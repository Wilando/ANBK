<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use App\Models\MisiPemda;
use Harishdurga\LaravelQuiz\Models\Topic;
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
use Yajra\DataTables\Facades\DataTables;

class MisiPemdaController extends Controller
{


    public function __construct()
    {
        $this->valuePrivilege = null;
        $this->middleware('auth');
        $this->permissionCreate = 'topic create';
        $this->permissionRead = 'topic read';
        $this->permissionUpdate = 'topic update';
        $this->permissionDelete = 'topic delete';
        $this->permissionValidation = 'topic validation';
        $this->permissionPrivilege = 'topic privilege';

        $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
        $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
        $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
        $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
        $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);
        $this->model = Topic::class;
        $this->titleData = 'Topic';
        $this->columnRef = 'name';
        $this->logName = 'topic';
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
        $data = $this->model::query();

        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        $active = $request->get('is_active');

        $data = $data->where(function ($query) use ($mulai, $selesai, $active) {
            if ($mulai && $selesai) {
                $query->whereBetween('created_at', [$mulai, $selesai])
                    ->orWhereBetween('created_at', [$mulai, $selesai]);
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
                return encodeId($row->id_misi);
            })
            ->addColumn('encode_row', function ($row) {
                return json_encode($row);
            })
            ->toJson();
    }

    private function _insert($reqData)
    {
        $processData = $this->model::create($reqData);

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
            'name' => 'required',
        ];

        if (xhasPermission($this->permissionValidation)) {
            $rule[$this->columnValidation] = 'required';
        }

        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }


        $reqData = [
            'name' => $request->input('name'),
        ];
        $reqData['is_active'] = 0;
        if (xhasPermission($this->permissionValidation)) {
            $is_active = $request->input('is_active');

            $reqData['is_active'] = $is_active;
        }


        $res = $this->myService->trx_db($this->_insert($reqData));

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_CREATED);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    public
    function show($id)
    {

        $listData = $this->model::query()->where('id', decodeId($id))->first();
        $res['message'] = $this->titleData . ' berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $listData;
        return response()->json($res, Response::HTTP_OK);
    }


    private function _update($master, $reqData)
    {

        $oldAttributes = $master->getOriginal();

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
            'name' => 'required',
        ];


        if (xhasPermission($this->permissionValidation)) {
            $rule[$this->columnValidation] = 'required';
        }


        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }


        $reqData = [
            'name' => $request->input('name'),
        ];


        $reqData['is_active'] = $master->is_active;


        if (xhasPermission($this->permissionValidation)) {
            $is_active = $request->input('is_active');

            $reqData['is_active'] = $is_active;
        }

        $res = $this->myService->trx_db($this->_update($master, $reqData));


        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    private function _destroy($master)
    {

        $oldAttributes = $master->getOriginal();





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
            $dataRemote = $dataRemote->where('name', 'like', '%' . $search . '%');
        }
        $dataRemote = $dataRemote
            ->select('id', 'name as text')
            ->orderBy('name')
            ->limit(100)
            ->get();

        return response()->json($dataRemote);
    }

    public function listTopic(Request $request)
    {
        $dataRemote = Topic::query()->get();

        return response()->json($dataRemote);
    }
    public function listSoalTopic(Request $request, $id)
    {
        $dataRemote = Topic::with(["questions.options"])->where('id', decodeId($id))->first();

        return response()->json($dataRemote);
    }
    
}
