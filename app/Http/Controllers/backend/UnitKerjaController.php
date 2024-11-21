<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use App\Models\KegiatanDetail;
use App\Models\ProgramDetail;
use App\Models\SubKegiatanDetail;
use App\Models\UnitKerja;
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

class UnitKerjaController extends Controller
{


    public function __construct()
    {
        $this->valuePrivilege = null;
        $this->middleware('auth');
        $this->permissionCreate = 'unit kerja create';
        $this->permissionRead = 'unit kerja read';
        $this->permissionUpdate = 'unit kerja update';
        $this->permissionDelete = 'unit kerja delete';
        $this->permissionValidation = 'unit kerja validation';
        $this->permissionPrivilege = 'unit kerja privilege';

        $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
        $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
        $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
        $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
        $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);

        $this->model = UnitKerja::class;
        $this->titleData = 'Unit Kerja';
        $this->columnRef = 'Unit_Kerja';
        $this->logName = 'Unit_Kerja';
        $this->defaultRedirect = 'app/jenis-pakan';
        $this->nameTable = (new UnitKerja())->getTable();
        $this->primaryKey = (new UnitKerja())->getKeyName();
        $this->columnPrivilege = 'created_by';
        $this->columnValidation = 'Is_Active';
        $this->valueValidation = 1;
        $this->myService = new hideyoriService();
        $this->middleware(function ($request, $next) {
            $this->valuePrivilege = auth()->user()->id;

            return $next($request);
        });
    }

    public function datatable(Request $request)
    {
        $data = $this->model::with(['programunker', 'kegiatanunker']);

        $created_by = $request->get('created_by');
        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        $active = $request->get('Is_Active');

        $data = $data->where(function ($query) use ($created_by, $mulai, $selesai, $active) {


            if ($created_by != '') {
                if (is_array($created_by)) {
                    $query->whereIn('created_by', $created_by);

                } else {
                    $query->where('created_by', $created_by);

                }
            }
            if ($mulai && $selesai) {
                $query->whereBetween('created_at', [$mulai, $selesai])
                    ->orWhereBetween('created_at', [$mulai, $selesai]);
            }

            if ($active != '') {
                $query->where('Is_Active', $active);
            }
        });


        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('hashId', function ($row) {
                return encodeId(id: $row->ID);
            })
            ->addColumn('encode_row', function ($row) {
                return json_encode($row);
            })
            ->toJson();
    }


    private function _insert_bulk($reqDataArray)
    {


        $bulkData = [];

        $jumlah_input = count($reqDataArray['Unit_Kerja']);


        if ($jumlah_input > 0) {
            for ($i = 0; $i < $jumlah_input; $i++) {


                $bulkData[] = [
                    'Unit_Kerja' => $reqDataArray['Unit_Kerja'][$i],
                    'deskripsi' => $reqDataArray['deskripsi'][$i],


                    'Is_Active' => xhasPermission($this->permissionValidation) ? $reqDataArray['Is_Active'][$i] : 0,

                    'created_by' => auth()->user()->id,
                    'updated_by' => auth()->user()->id,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }
        } else {
            $res['message'] = 'input data harus ada';
            $res['success'] = false;
            return $res;
        }


        $this->model::insert($bulkData);


        $insertedRecords = $this->model::whereIn('nama_misi', $reqDataArray['nama_misi'])->get();


        foreach ($insertedRecords as $record) {
            $newAttributes = $record->getAttributes();
            $properties = ['new' => $newAttributes];

            activity()
                ->useLog($this->logName)
                ->causedBy(auth()->user())
                ->performedOn($record)
                ->withProperties($properties)
                ->event('created')
                ->log('menambahkan ' . $this->titleData . ' ' . $record->{$this->columnRef});
        }


        $res['message'] = 'berhasil bulk ' . $jumlah_input . ' data nama misi';
        $res['success'] = true;

        return $res;
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
        // dd($request->all());
        $rule = [
            'Unit_Kerja' => 'required|unique:master_unker',
            'T_KUnker' => 'required|unique:master_unker',
            'Kepala' => 'required|unique:master_unker'

        ];


        if (xhasPermission($this->permissionValidation)) {
            $rule[$this->columnValidation] = 'required';
        }

        $attribute_rule = [

        ];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }

        $reqData = [
            'Unit_Kerja' => $request->input('Unit_Kerja'),
            'T_KUnker' => $request->input('T_KUnker'),
            'Kepala' => $request->input('Kepala')
        ];

        $reqData['Is_Active'] = 0;
        if (xhasPermission($this->permissionValidation)) {
            $Is_Active = $request->input('Is_Active');

            $reqData['Is_Active'] = $Is_Active;

        }


        $res = $this->myService->trx_db($this->_insert($reqData));

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_CREATED);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }


    }

    public function show($id)
    {

        $listData = $this->model::view()->where('ID', decodeId($id))->first();
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
        $masterview = $this->model::view()->where('ID', $id)->first();
        $rule = [
            'Unit_Kerja' => 'required',
            'T_KUnker' => 'required',
            'Kepala' => 'required'

        ];

        if ($request->input('kode_rekening') !== $master->kode_rekening) {
            // Tambahkan validasi unique jika kode_rekening berubah
            $rule['Unit_Kerja'] = 'required|unique:master_unker,Unit_Kerja';
            $rule['T_KUnker'] = 'required|unique:master_unker,T_KUnker';
            $rule['Kepala'] = 'required|unique:master_unker,Kepala';
        }


        if (xhasPermission($this->permissionValidation)) {
            $rule[$this->columnValidation] = 'required';
        }


        $attribute_rule = [

        ];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }

        $reqData = [
            'Unit_Kerja' => $request->input('Unit_Kerja'),
            'T_KUnker' => $request->input('T_KUnker'),
            'Kepala' => $request->input('Kepala')
        ];


        $reqData['Is_Active'] = $master->Is_Active;


        if (xhasPermission($this->permissionValidation)) {
            $Is_Active = $request->input('Is_Active');

            $reqData['Is_Active'] = $Is_Active;

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

        $cekRelasi = ProgramDetail::where('id_unker', $master->ID)->exists()
            || KegiatanDetail::where('id_unker', $master->ID)->exists();
        if ($cekRelasi) {
            $res['message'] = 'Tidak dapat menghapus, Unit Kerja sudah terkait pada data lain';
            $res['success'] = false;

            return $res;
        }

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
            'Is_Active' => $request->input('Is_Active'),


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
        $dataRemote = UnitKerja::query();

        $parameter = $request->parameter;

        if ($parameter) {
            foreach ($parameter as $x => $val) {
                $dataRemote = $dataRemote->where($x, $val);
            }
        }

        $search = $request->search;
        if ($search) {
            $dataRemote = $dataRemote->where('Unit_Kerja', 'like', '%' . $search . '%');
        }
        $dataRemote = $dataRemote->select('ID as id', 'Unit_Kerja as text')->orderBy('Unit_Kerja')->limit(100)->get();

        return response()->json($dataRemote);
    }

    public function remoteDetailMaster(Request $request)
    {
        $dataRemote = KegiatanDetail::with(['unker', "kegiatan"]);
        $id_kegiatan = $request->id_kegiatan;

        if ($id_kegiatan) {
            $dataRemote = $dataRemote->where('id_kegiatan', $id_kegiatan);
        }

        $dataRemote = $dataRemote->select('*')->orderBy('id_kegiatan_detail')->get();

        return response()->json($dataRemote);
    }

    public function remoteDetailProgramMaster(Request $request)
    {
        $dataRemote = ProgramDetail::with(['unker', "program"]);
        $id_program = $request->id_program;

        if ($id_program) {
            $dataRemote = $dataRemote->where('id_program', $id_program);
        }

        $dataRemote = $dataRemote->select('*')->orderBy('id_program_detail')->get();

        return response()->json($dataRemote);
    }

    public function remoteDetailSubKegiatanMaster(Request $request)
    {
        $dataRemote = SubKegiatanDetail::with(['unker', "sub_kegiatan"]);
        $id_sub_kegiatan = $request->id_sub_kegiatan;

        if ($id_sub_kegiatan) {
            $dataRemote = $dataRemote->where('id_sub_kegiatan', $id_sub_kegiatan);
        }

        $dataRemote = $dataRemote->select('*')->orderBy('id_sub_kegiatan_detail')->get();

        return response()->json($dataRemote);
    }
}
