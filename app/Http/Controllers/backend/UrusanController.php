<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use App\Models\Urusan;
use App\Models\SubUrusan;

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

class UrusanController extends Controller
{


    public function __construct()
    {
        $this->valuePrivilege = null;
        $this->middleware('auth');
        $this->permissionCreate = 'urusan create';
        $this->permissionRead = 'urusan read';
        $this->permissionUpdate = 'urusan update';
        $this->permissionDelete = 'urusan delete';
        $this->permissionValidation = 'urusan validation';
        $this->permissionPrivilege = 'urusan privilege';

        $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
        $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
        $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
        $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
        $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);

        $this->model = Urusan::class;
        $this->titleData = 'Urusan';
        $this->columnRef = 'nama_urusan';
        $this->logName = 'urusan';
        $this->defaultRedirect = 'app/urusan';
        $this->nameTable = (new Urusan())->getTable();
        $this->primaryKey = (new Urusan())->getKeyName();
        $this->columnPrivilege = 'created_by';
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
        $data = $this->model::view();

        $created_by = $request->get('created_by');
        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        $active = $request->get('is_active');

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
                $query->where('is_active', $active);
            }
        });


        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('hashId', function ($row) {
                return encodeId($row->id_urusan);
            })
            ->addColumn('encode_row', function ($row) {
                return json_encode($row);
            })
            ->toJson();
    }



    private function _insert_bulk($reqDataArray)
    {


        $bulkData = [];

        $jumlah_input = count($reqDataArray['nama_urusan']);


        if ($jumlah_input > 0) {
            for ($i = 0; $i < $jumlah_input; $i++) {


                $bulkData[] = [
                    'nama_urusan' => $reqDataArray['nama_urusan'][$i],
                    'deskripsi' => $reqDataArray['deskripsi'][$i],


                    'is_active' => xhasPermission($this->permissionValidation) ? $reqDataArray['is_active'][$i] : 0,

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

        $rule = [
            'nama_urusan' => 'required',
            'kode_rekening' => 'required|unique:master_urusan',

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

            'nama_urusan' => $request->input('nama_urusan'),
            'kode_rekening' => $request->input('kode_rekening'),


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
        function show(
        $id
    ) {

        $listData = $this->model::view()->where('id_urusan', decodeId($id))->first();
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
        $masterview = $this->model::view()->where('id_urusan', $id)->first();
        $rule = [
            'kode_rekening' => 'required',
            'nama_urusan' => 'required',

        ];

        if ($request->input('kode_rekening') !== $master->kode_rekening) {
            // Tambahkan validasi unique jika kode_rekening berubah
            $rule['kode_rekening'] = 'required|unique:master_urusan,kode_rekening';
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
            'kode_rekening' => $request->input('kode_rekening'),
            'nama_urusan' => $request->input('nama_urusan'),
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
        
        $cekRelasi = SubUrusan::where('id_urusan', $master->id_urusan)->exists();
        if ($cekRelasi) {
            $res['message'] = 'Tidak dapat menghapus, Urusan sudah terkait pada data lain';
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

        foreach ($reqData["ids"] as $id) {
            $cekRelasi = SubUrusan::where('id_urusan', $id)->exists();
            if ($cekRelasi) {
                return response()->json([
                    'success' => false,
                    'message' => "Tidak dapat menghapus, Urusan sudah terkait pada data lain.",
                ], 200);
            }
        }

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
        $dataRemote = Urusan::query();

        $parameter = $request->parameter;

        if ($parameter) {
            foreach ($parameter as $x => $val) {
                $dataRemote = $dataRemote->where($x, $val);
            }
        }

        $search = $request->search;
        if ($search) {
            $dataRemote = $dataRemote->where('nama_urusan', 'like', '%' . $search . '%')->orWhere('kode_rekening', 'like', '%' . $search . '%');
        }
        $dataRemote = $dataRemote->select('id_urusan as id', 'nama_urusan as text', "kode_rekening")->orderBy('nama_urusan')->limit(100)->get();

        return response()->json($dataRemote);
    }

    public function remoteajax(Request $request)
    {
        // Ambil input pencarian dari request
        $search = $request->search;

        // Jika tidak ada input pencarian, kembalikan array kosong
        if (!$search) {
            return response()->json([]);
        }

        // Jika ada input pencarian, lakukan query
        $dataRemote = Urusan::query();

        $parameter = $request->parameter;

        if ($parameter) {
            foreach ($parameter as $x => $val) {
                $dataRemote = $dataRemote->where($x, $val);
            }
        }

        // Lanjutkan query dengan pencarian
        $dataRemote = $dataRemote->where(function ($query) use ($search) {
            $query->where('nama_urusan', 'like', '%' . $search . '%')
            ->orWhere('kode_rekening', 'like', '%' . $search . '%');
        })
            ->select('id_urusan as id', 'nama_urusan as text', 'kode_rekening')
            ->orderBy('nama_urusan')
            ->limit(100)
            ->get();

        return response()->json($dataRemote);
    }

    public function getKodeRekening($id)
    {
        // Ambil data master urusan berdasarkan id yang dipilih
        $urusan = Urusan::find($id);

        if ($urusan) {
            return response()->json([
                'kode_rekening' => $urusan->kode_rekening
            ]);
        } else {
            return response()->json([
                'message' => 'Urusan tidak ditemukan'
            ], 404);
        }
    }


}
