<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\IkuRpjmd;
use App\Models\Kegiatan;
use App\Models\MisiPemda;
use App\Models\Program;
use App\Models\SubKegiatan;
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

class IkuRpjmdController extends Controller
{
  public function __construct()
  {
    $this->valuePrivilege = null;
    $this->middleware('auth');
    $this->permissionCreate = 'iku-rpjmd create';
    $this->permissionRead = 'iku-rpjmd read';
    $this->permissionUpdate = 'iku-rpjmd update';
    $this->permissionDelete = 'iku-rpjmd delete';
    $this->permissionValidation = 'iku-rpjmd validation';
    $this->permissionPrivilege = 'iku-rpjmd privilege';

    $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
    $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
    $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
    $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
    $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);

    $this->model = IkuRpjmd::class;
    $this->titleData = 'IKU RPJMD';
    $this->columnRef = 'nama_iku_rpjmd';
    $this->logName = 'iku-rpjmd';
    $this->defaultRedirect = 'app/iku-rpjmd';
    $this->nameTable = (new IkuRpjmd())->getTable();
    $this->primaryKey = (new IkuRpjmd())->getKeyName();
    $this->columnPrivilege = 'created_by';
    $this->columnValidation = 'is_active';
    $this->valueValidation = 1;
    $this->myService = new hideyoriService();
    $this->middleware(function ($request, $next) {
      $this->valuePrivilege = Auth::user()->id;
      return $next($request);
    });
  }

  public function datatable(Request $request)
  {
    $model = $this->model::datatable();

    return DataTables::eloquent($model)
      ->filter(function ($query) use ($request) {
        if ($request->mulai && $request->selesai) {
          $query->whereBetween('created_at', [$request->mulai, $request->selesai]);
        }

        $filters = [
          'tr_iku_rpjmd.id_misi' => $request->misi_pemda,
          'tr_iku_rpjmd.is_active' => $request->is_active,
          'tr_iku_rpjmd.created_by' => $request->created_by,
        ];

        foreach ($filters as $key => $value) {
          if ($value != '') {
            if (is_array($value)) {
              $query->whereIn($key, $value);
            } else {
              $query->where($key, $value);
            }
          }
        }
      })
      ->addIndexColumn()
      ->addColumn('kosong', function () {
        return '';
      })
      ->addColumn('hashId', function ($row) {
        return encodeId($row->id_iku_rpjmd);
      })
      ->addColumn('encode_row', function ($row) {
        return json_encode($row);
      })
      ->order(function ($query) {
        $query->orderBy('tahun_awal', 'asc');
        $query->orderBy('nama_misi', 'asc');
      })
      ->toJson();
  }

  public function store(Request $request)
  {
    $rule = [
      'id_misi' => 'required:exists:master_misi_pemda,id_misi',
      'nama_iku_rpjmd' => 'required',
      'satuan' => 'required',
      'target' => 'required',
      'realisasi' => 'required',
      'capaian' => 'required',
      'keterangan' => 'required',
    ];

    if (xhasPermission($this->permissionValidation)) {
      $rule[$this->columnValidation] = 'required';
    }

    $validator = Validator::make($request->all(), $rule);
    if ($validator->fails()) {
      return resValidator($validator);
    }

    $reqData = [
      'id_misi' => $request->input('id_misi'),
      'nama_iku_rpjmd' => $request->input('nama_iku_rpjmd'),
      'satuan' => $request->input('satuan'),
      'target' => $request->input('target'),
      'realisasi' => $request->input('realisasi'),
      'capaian' => $request->input('capaian'),
      'keterangan' => $request->input('keterangan'),
      'is_active' => 0,
    ];

    if (xhasPermission($this->permissionValidation)) {
      $reqData['is_active'] = $request->input('is_active');
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
    $listData = $this->model::view()->where('id_iku_rpjmd', decodeId($id))->first();
    $res['message'] = $this->titleData . ' berhasil didapatkan';
    $res['success'] = true;
    $res['data'] = $listData;
    return response()->json($res, Response::HTTP_OK);
  }

  public function show_misi_pemda($id)
  {
    $listData = MisiPemda::where('satuan', decodeId($id))->first();
    $res['message'] = $this->titleData . ' berhasil didapatkan';
    $res['success'] = true;
    $res['data'] = $listData;
    return response()->json($res, Response::HTTP_OK);
  }

  public function update(Request $request, $id)
  {
    $master = $this->model::findOrfail(decodeId($id));

    $rule = [
      'id_misi' => 'required:exists:master_misi_pemda,id_misi',
      'nama_iku_rpjmd' => 'required',
      'satuan' => 'required',
      'target' => 'required',
      'realisasi' => 'required',
      'capaian' => 'required',
      'keterangan' => 'required',
    ];

    if (xhasPermission($this->permissionValidation)) {
      $rule[$this->columnValidation] = 'required';
    }

    $validator = Validator::make($request->all(), $rule);
    if ($validator->fails()) {
      return resValidator($validator);
    }

    $reqData = [
      'id_misi' => $request->input('id_misi'),
      'nama_iku_rpjmd' => $request->input('nama_iku_rpjmd'),
      'satuan' => $request->input('satuan'),
      'target' => $request->input('target'),
      'realisasi' => $request->input('realisasi'),
      'capaian' => $request->input('capaian'),
      'keterangan' => $request->input('keterangan'),
      'is_active' => 0,
    ];

    if (xhasPermission($this->permissionValidation)) {
      $reqData['is_active'] = $request->input('is_active');
    }

    $res = $this->myService->trx_db($this->_update($master, $reqData));

    if ($request->wantsJson()) {
      return response()->json($res, Response::HTTP_OK);
    } else {
      return redirect($this->defaultRedirect)->with($res);
    }
  }

  public function destroy($id, Request $request)
  {
    $master = $this->model::findOrfail(decodeId($id));

    $res = $this->myService->trx_db($this->_destroy($master));

    if ($request->wantsJson()) {
      return response()->json($res, Response::HTTP_OK);
    } else {
      return redirect($this->defaultRedirect)->with($res);
    }

    return redirect($this->defaultRedirect)->with($res);
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

  public function bulkUpdate(Request $request)
  {
    $rule = [
      'ids' => 'required|array',
    ];

    $checks = [
      [
        'field' => 'id_misi',
        'name' => 'id_misi',
        'check' => 'misi_pemda_switch_bulk',
        'option' => true,
        'rule' => 'exists:master_misi_pemda,id_misi',
      ],
      ['field' => 'nama_iku_rpjmd', 'name' => 'nama_iku_rpjmd', 'check' => 'nama_iku_rpjmd_switch_bulk', 'option' => false],
      ['field' => 'satuan', 'name' => 'satuan', 'check' => 'satuan_switch_bulk', 'option' => false],
      ['field' => 'target', 'name' => 'target', 'check' => 'target_switch_bulk', 'option' => false],
      ['field' => 'realisasi', 'name' => 'realisasi', 'check' => 'realisasi_switch_bulk', 'option' => false],
      ['field' => 'capaian', 'name' => 'capaian', 'check' => 'capaian_switch_bulk', 'option' => false],
      ['field' => 'keterangan', 'name' => 'keterangan', 'check' => 'keterangan_switch_bulk', 'option' => false],
    ];

    foreach ($checks as $check) {
      if ($request->input($check['check'])) {
        if ($check['option']) {
          if ($request->input($check['name'])) {
            $rule[$check['name']] = isset($check['rule']) ? $check['rule'] : 'required';
          }
        } else {
          $rule[$check['name']] = isset($check['rule']) ? $check['rule'] : 'required';
        }
      }
    }

    if (xhasPermission($this->permissionValidation)) {
      if ($request->input('is_active_switch_bulk')) {
        $rule[$this->columnValidation] = 'required';
      }
    }

    $validator = Validator::make($request->all(), $rule);
    if ($validator->fails()) {
      return resValidator($validator);
    }

    $column_update = [];

    foreach ($checks as $check) {
      if ($request->input($check['check'])) {
        $column_update[$check['field']] = $request->input($check['name']);
      }
    }

    if (xhasPermission($this->permissionValidation)) {
      if ($request->input('is_active_switch_bulk')) {
        $column_update[$this->columnValidation] = $request->input('is_active');
      }
    }

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
    $dataRemote = $this->model::query();

    $parameter = $request->parameter;

    if ($parameter) {
      foreach ($parameter as $x => $val) {
        $dataRemote = $dataRemote->where($x, $val);
      }
    }

    $search = $request->search;
    if ($search) {
      $dataRemote = $dataRemote->where('nama_iku_rpjmd', 'like', '%' . $search . '%');
    }

    $dataRemote = $dataRemote
      ->with('misiPemda:id_misi,nama_misi,deskripsi')
      ->select('id_iku_rpjmd as id', 'nama_iku_rpjmd as text', 'id_misi')
      ->orderBy('nama_iku_rpjmd')
      ->limit(100)
      ->get();

    return response()->json($dataRemote);
  }

  public function remoteajax(Request $request)
  {
    $search = $request->search;

    if (!$search) {
      return response()->json([]);
    }

    $dataRemote = $this->model::query();

    $parameter = $request->parameter;

    if ($parameter) {
      foreach ($parameter as $x => $val) {
        $dataRemote = $dataRemote->where($x, $val);
      }
    }

    $dataRemote = $dataRemote->where(function ($query) use ($search) {
      $query->where('nama_iku_rpjmd', 'like', '%' . $search . '%');
    })
      ->with('misiPemda:id_misi,nama_misi,deskripsi')
      ->select('id_iku_rpjmd as id', 'nama_iku_rpjmd as text', 'id_misi')
      ->orderBy('nama_iku_rpjmd')
      ->limit(100)
      ->get();

    return response()->json($dataRemote);
  }

  public function remote_satuan(Request $request)
  {
    $dataRemote = $this->model::query();

    $parameter = $request->parameter;

    if ($parameter) {
      foreach ($parameter as $x => $val) {
        $dataRemote = $dataRemote->where($x, $val);
      }
    }

    $search = $request->search;
    if ($search) {
      $dataRemote = $dataRemote->where('satuan', 'like', '%' . $search . '%');
    }

    $dataRemote = $dataRemote
      ->select('satuan as id', 'satuan as text')
      ->distinct()
      ->orderBy('satuan')
      ->limit(100)
      ->get();

    return response()->json($dataRemote);
  }

  public function remote_misi_pemda(Request $request)
  {
    return MisiPemda::all();
  }

  public function getKodeRekening($id)
  {
    // Ambil data master kegiatan berdasarkan id yang dipilih
    $kegiatan = $this->model::find($id);

    if ($kegiatan) {
      return response()->json([
        'kode_rekening' => $kegiatan->kode_rekening
      ]);
    } else {
      return response()->json([
        'message' => 'kegiatan tidak ditemukan'
      ], 404);
    }
  }

  // private methods

  private function _insert($reqData)
  {
    $processData = $this->model::create($reqData);
    $newAttributes = $processData->getAttributes();

    $properties = ['new' => $newAttributes];

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

  private function _insert_bulk($reqDataArray)
  {
    $bulkData = [];

    $jumlah_input = count($reqDataArray['nama_kegiatan']);

    if ($jumlah_input > 0) {
      for ($i = 0; $i < $jumlah_input; $i++) {


        $bulkData[] = [
          'nama_kegiatan' => $reqDataArray['nama_kegiatan'][$i],
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

  private function _bulkDelete($reqData)
  {
    $ids = $reqData['ids'];
    $idsDecode = [];
    $jumlah = 0;
    $titleDataColumn = $this->titleData;

    foreach ($ids as $id) {
      $master = $this->model::findOrfail(decodeId($id));


      if ($master) {
        // $cekjumlah = $this->model::view()->where('id_misi', $master->id_misi)->value('jumlah_digunakan');
        // if ($cekjumlah == 0) {
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
        // }
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
}
