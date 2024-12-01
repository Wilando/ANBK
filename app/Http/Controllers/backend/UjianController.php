<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use Harishdurga\LaravelQuiz\Models\Question;
use Harishdurga\LaravelQuiz\Models\QuestionOption;
use Harishdurga\LaravelQuiz\Models\Quiz;
use Harishdurga\LaravelQuiz\Models\QuizAuthor;
use Harishdurga\LaravelQuiz\Models\QuizQuestion;
use Harishdurga\LaravelQuiz\Models\QuizAttempt;
use Harishdurga\LaravelQuiz\Models\QuizAttemptAnswer;


use App\Models\User;
use App\Services\hideyoriService;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Yajra\DataTables\Facades\DataTables;

class UjianController extends Controller
{


    public function __construct()
    {
        $this->valuePrivilege = null;
        $this->middleware('auth');
        $this->permissionCreate = 'ujian create';
        $this->permissionRead = 'ujian read';
        $this->permissionUpdate = 'ujian update';
        $this->permissionDelete = 'ujian delete';
        $this->permissionValidation = 'ujian validation';
        $this->permissionPrivilege = 'ujian privilege';

        $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
        $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
        $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
        $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
        $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);
        $this->model = Quiz::class;
        $this->titleData = 'Ujian';
        $this->columnRef = 'name';
        $this->logName = 'ujian';
        $this->defaultRedirect = 'app/jenis-pakan';
        $this->primaryKey = "id";
        $this->columnValidation = 'is_active';
        $this->valueValidation = 1;
        $this->myService = new hideyoriService();
        $this->middleware(function ($request, $next) {
            $this->valuePrivilege = auth()->user()->id;

            return $next($request);
        });
    }

    public function datatable(Request $request)
    {   
        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        $active = $request->get('is_active');
        $topic = $request->get('topic');
        
        $data = $this->model::with(["quizAuthors.author", "topics" , "questions.question"])
        ->whereHas('topics', function ($query) use ($topic) {
            if ($topic != '') {
                $query->where('topic_id', $topic);
            }
        })
        ->orderBy('updated_at', 'desc');

        $data = $data->where(function ($query) use ($mulai, $selesai, $active) {
            if ($mulai && $selesai) {
                $query->whereBetween('created_at', [$mulai, $selesai]);
            }
            if ($active != '') {
                $query->where('is_active', $active);
            }
        });


        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('hashId', function ($row) {
                return encodeId($row->id);
            })
            ->addColumn('encode_row', function ($row) {
                return json_encode($row);
            })
            ->toJson();
    }

    private function _insert($reqData, $id_topic, $list_soal)
    {
        $processData = $this->model::create($reqData);

        $processData->topics()->attach([$id_topic]);

        foreach ($list_soal as $index => $soal) {
            QuizQuestion::create([
                'quiz_id' => $processData->id,
                'question_id' => $soal,
                'order' => $index + 1,
            ]);
        }

        QuizAuthor::create([
            'quiz_id' => $processData->id,
            'author_id' => auth()->user()->id,
            'author_type' => get_class(auth()->user()),
            'author_role' => "guru",
        ]);

        $newAttributes = $processData->getAttributes();
        $properties = [
            'new' => $newAttributes,
        ];
        activity()
            ->useLog($this->logName)
            ->causedBy(auth()->user())
            ->performedOn($processData)
            ->withProperties($properties)
            ->event('created')
            ->log('menambahkan ' . $this->titleData . ' ' . $reqData[$this->columnRef]);

        $res['message'] = $this->titleData . ' berhasil ditambahkan';
        $res['success'] = true;
        $res['data'] = $processData;

        return $res;
    }


    public function store(Request $request)
    {
        $rule = [
            'nama_ujian' => 'required',
            'topic' => 'required',
            'mulai' => 'required',
            'selesai' => 'required',
            'jumlah' => 'required',
        ];

        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }


        $reqData = [
            'name' => $request->input('nama_ujian'),
            'valid_from' => $request->input('mulai'),
            'valid_upto' => $request->input('selesai'),
            'negative_marking_settings'=>[
                'enable_negative_marks' => false,
                'negative_marking_type' => 'fixed',
                'negative_mark_value' => 0,
            ]
        ];
        
        $list_soal = [];

        $i = 1;
        while ($request->has('soal_' . $i)) {
            $list_soal[] = $request->input('soal_' . $i);
            $i++;
        }

        $res = $this->myService->trx_db($this->_insert( $reqData, $request->input('topic'), $list_soal ));

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_CREATED);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }


    private function _update($master, $reqData, $id_topic, $list_soal)
    {

        $oldAttributes = $master->getOriginal();
        $master->topics()->sync([$id_topic]);
        $master->questions()->delete();
        
        foreach ($list_soal as $index => $soal) {
            QuizQuestion::create([
                'quiz_id' => $master->id,
                'question_id' => $soal,
                'order' => $index + 1,
            ]);
        }
        $processData = $master->update($reqData);

        $changes = $master->getChanges();
        if (!empty($changes)) {
            $newAttributes = $master->getAttributes();
            $properties = [
                'old' => $oldAttributes,
                'new' => $newAttributes,
            ];
            activity()
                ->useLog($this->logName)
                ->causedBy(auth()->user())
                ->performedOn($master)
                ->withProperties($properties)
                ->event('updated')
                ->log('memperbarui ' . $this->titleData . ' ' . $reqData[$this->columnRef]);
        }


        $res['message'] = $this->titleData . ' berhasil diperbarui';
        $res['success'] = true;
        $res['data'] = $processData;

        return $res;
    }


    public function update(Request $request, $id)
    {
        $master = $this->model::findOrfail(decodeId($id));
        $masterview = $this->model::query()->where('id', $id)->first();
        $rule = [
            'nama_ujian' => 'required',
            'topic' => 'required',
            'mulai' => 'required',
            'selesai' => 'required',
            'jumlah' => 'required',
        ];

        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }


        $reqData = [
            'name' => $request->input('nama_ujian'),
            'valid_from' => $request->input('mulai'),
            'valid_upto' => $request->input('selesai'),
            'negative_marking_settings'=>[
                'enable_negative_marks' => false,
                'negative_marking_type' => 'fixed',
                'negative_mark_value' => 0,
            ]
        ];


        $list_soal = [];

        $i = 1;
        while ($request->has('soal_' . $i)) {
            $list_soal[] = $request->input('soal_' . $i);
            $i++;
        }

        $res = $this->myService->trx_db($this->_update($master,$reqData, $request->input('topic'), $list_soal));


        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    private function _destroy($master)
    {

        $oldAttributes = $master->getOriginal();
        $master->questions()->delete();
        $deleted = $master->delete();
        if ($deleted) {
            $properties['old'] = $oldAttributes;
            if (!empty($changes)) {
                $newAttributes = $master->getAttributes();
                $properties['new'] = $newAttributes;
            }
            activity()
                ->useLog($this->logName)
                ->causedBy(auth()->user())
                ->performedOn($master)
                ->withProperties($properties)
                ->event('deleted')
                ->log('hapus ' . $this->titleData . ' ' . $master[$this->columnRef]);
        }
        $res['message'] = $this->titleData . ' berhasil dihapus';
        $res['success'] = true;

        return $res;
    }

    public function destroy($id, Request $request)
    {
        $master = $this->model::findOrfail(decodeId($id));
        //        $cekjumlah = $this->model::view()->where('id_misi', $master->id_misi)->value('jumlah_digunakan');
        //        dd($cekjumlah);
        //        if ($cekjumlah > 0) {
        //            $res['message'] = 'tidak dapat dihapus, misi pemda memiliki ' . $cekjumlah . ' pada data lainnnya';
        //            $res['success'] = false;
        //
        //            return $res;
        //        }
        $res = $this->myService->trx_db($this->_destroy($master));

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }


        return redirect($this->defaultRedirect)->with($res);
    }

    private function _bulkDelete($reqData)
    {
        $ids = $reqData['ids'];
        $idsDecode = [];
        $jumlah = 0;
        $titleDataColumn = $this->titleData;

        foreach ($ids as $id) {
            $master = $this->model::findOrfail(decodeId($id));


            if ($master) {
                //                $cekjumlah = $this->model::view()->where('id_misi', $master->id_misi)->value('jumlah_digunakan');
                //                if ($cekjumlah == 0) {
                $oldAttribute = $master->getOriginal();
                $properties['old'] = $oldAttribute;
                $titleDataColumn = $this->titleData . ' ' . $master[$this->columnRef];

                $idsDecode[] = decodeId($id);
                activity()
                    ->useLog($this->logName)
                    ->causedBy(auth()->user())
                    ->performedOn($master)
                    ->withProperties($properties)
                    ->event('deleted')
                    ->log('hapus ' . $titleDataColumn);
                ++$jumlah;
                //                }

            }
        }


        $deletedRows = $this->model::whereIn($this->primaryKey, $idsDecode)->delete();

        $desc = $deletedRows . ' ' . $this->titleData;
        if ($jumlah == 1) {
            $desc = $titleDataColumn;
        }

        $res['message'] = $desc . ' berhasil dihapus';
        $res['success'] = true;
        if ($deletedRows == 0) {
            $res['message'] = 'tidak ada data yang terhapus, pastikan data tidak digunakan pada data lainnya';
            $res['success'] = false;
        }

        return $res;
    }

    public function bulkDelete(Request $request)
    {
        $rule = [
            'ids' => 'required|array',

        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }

        $reqData = [
            'ids' => $request->input('ids'),
        ];
        $res = $this->myService->trx_db($this->_bulkDelete($reqData));
        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    private function _bulkUpdate($reqData)
    {
        $ids = $reqData['ids'];
        $column_update = $reqData['column_update'];

        $jumlah = 0;
        $titleData = $this->titleData;
        $titleDataColumn = '';
        foreach ($ids as $id) {

            $master = $this->model::findOrfail(decodeId($id));

            if ($master) {
                $column_updateNew = $column_update;

                if (!xhasPermission($this->permissionValidation)) {
                    if ($master[$this->columnValidation]) {
                        if ($master[$this->columnValidation] == $this->valueValidation) {
                            $column_updateNew = null;
                        }
                    }
                }


                if ($column_updateNew != null) {
                    $oldAttribute = $master->getOriginal();
                    $master->update($column_update);
                    $titleDataColumn = $this->titleData . ' ' . $master[$this->columnRef];
                    $changes = $master->getChanges();
                    if (!empty($changes)) {
                        $properties = [
                            'old' => $oldAttribute,
                            'new' => $master->getAttributes(),
                        ];
                        activity()
                            ->useLog($this->logName)
                            ->causedBy(auth()->user())
                            ->performedOn($master)
                            ->withProperties($properties)
                            ->event('updated')
                            ->log('memperbarui ' . $titleDataColumn);
                    }
                    ++$jumlah;
                }
            }
        }

        if ($jumlah == 0) {
            $titleData = 'tidak ada data yang';
        } else if ($jumlah == 1) {
            $titleData = $titleDataColumn;
        }
        $res['message'] = $titleData . ' berhasil diperbarui';
        $res['success'] = true;

        return $res;
    }

    public function bulkUpdate(Request $request)
    {
        $rule = [
            'ids' => 'required|array',

        ];
        $validator = Validator::make($request->all(), $rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }

        $column_update = array_filter([
            'is_active' => $request->input('is_active'),


        ], function ($var) {
            return $var !== null && $var !== false && $var !== '';
        });

        $reqData = [
            'ids' => $request->input('ids'),
            'column_update' => $column_update,
        ];

        $res = $this->myService->trx_db($this->_bulkUpdate($reqData));

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    public function remote(Request $request)
    {
        $dataRemote = Topic::query();

        $parameter = $request->parameter;

        if ($parameter) {
            foreach ($parameter as $x => $val) {
                $dataRemote = $dataRemote->where($x, $val);
            }
        }

        $search = $request->search;
        if ($search) {
            $dataRemote = $dataRemote->where('nama_misi', 'like', '%' . $search . '%');
        }
        $dataRemote = $dataRemote
            ->select('id_misi as id', 'nama_misi as text', 'tahun_awal', 'tahun_akhir')
            ->orderBy('nama_misi')
            ->limit(100)
            ->get();

        return response()->json($dataRemote);
    }

    public function listSoal($id)
    {   
        $master = $this->model::with(['questions.question.options', "questions.question.topics"])
        ->findOrFail(decodeId($id));

        $groupedQuestions = $master->questions->groupBy(function ($questionWrapper) {
            // Ambil nama topik pertama dari koleksi topik
            return $questionWrapper->question->topics->pluck('name')->first() ?? 'Tanpa Topik';
        });

        $groupedQuestionsArray = $groupedQuestions->map(function ($questions, $topicName) {
            return [
                'topic' => $topicName,
                'questions' => $questions->map(function ($questionWrapper) {
                    $question = $questionWrapper->question;
                    return [
                        'question' => $question->name,
                        'options' => $question->options->map(function ($option) {
                            return [
                                'name' => $option->name,
                                'is_correct' => $option->is_correct,
                            ];
                        }),
                    ];
                }),
            ];
        })->values()->toArray();

        // $data = $this->model::with(["options", "topics", "question_type"])->get();
        // $questionsGroupedByTopic = $data->groupBy(function ($question) {
        //     return $question->topics->pluck('name')->join(', '); // Mengelompokkan berdasarkan nama topik
        // });

        return response()->json($groupedQuestionsArray);
    }

    public function listUjian($filter){
        $master = $this->model::with("topics");

        if ($filter == "sekarang") {
            $master = $master->$master->where('valid_upto', '>=', now())->get();;
        }
        else if ($filter == "lewat") {
            $master = $master->where('valid_upto', '<', now())->get();
        }
        else {
            $master = [];
        }

        $response = new StreamedResponse(function () use ($master) {
            while (true) {
                // Your server-side logic to get data
                $data = json_encode($master);
                echo "data: $data\n\n";
                // Flush the output buffer
                ob_flush();
                flush();

                // Delay for 1 second
                sleep(1);
            }
        });

        $response->headers->set('Content-Type', 'text/event-stream');
        $response->headers->set('Cache-Control', 'no-cache');
        $response->headers->set('Connection', 'keep-alive');

        return $response;
    }

    public
    function show($id)
    {
        $master = $this->model::with(['questions.question.options', "questions.question.topics"])
        ->findOrFail(decodeId($id));
        $res['message'] = $this->titleData . ' berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $master;
        return response()->json($res, Response::HTTP_OK);
    }

    public function inputJawaban(Request $request)
    {
        $rule = [
            'jawaban' => 'required',
            'id_quiz' => 'required',
        ];

        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }

        
        $quiz_attempt = QuizAttempt::create([
            'quiz_id' => $request->input('id_quiz'),
            'participant_id' => auth()->user()->id,
            'participant_type' => get_class(auth()->user())
        ]);

        foreach ($request->input('jawaban') as $jawaban) {
            QuizAttemptAnswer::create(
                [
                    'quiz_attempt_id' => $quiz_attempt->id,
                    'quiz_question_id' => $jawaban["id_pertanyaan"],
                    'question_option_id' => $jawaban["id_jawaban"],
                ]
            );
        }
        
        $res['message'] = "ujian berhasil dikerjakan";
        $res['success'] = true;
        $res['data'] = $quiz_attempt;
        return response()->json($res, Response::HTTP_CREATED);
        
    }
}
