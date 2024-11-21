<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Indikator;
use App\Models\Kegiatan;

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

class IndikatorController extends Controller
{
  public function __construct()
  {
    $this->valuePrivilege = null;
    $this->middleware('auth');
    $this->permissionCreate = 'indikator create';
    $this->permissionRead = 'indikator read';
    $this->permissionUpdate = 'indikator update';
    $this->permissionDelete = 'indikator delete';
    $this->permissionValidation = 'indikator validation';
    $this->permissionPrivilege = 'indikator privilege';

    $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
    $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
    $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
    $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
    $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);

    $this->model = Indikator::class;
    $this->titleData = 'Indikator';
    $this->columnRef = 'jenis_indikator';
    $this->logName = 'indikator';
    $this->defaultRedirect = 'app/indikator';
    $this->nameTable = (new Indikator())->getTable();
    $this->primaryKey = (new Indikator())->getKeyName();
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
          'program' => $request->is_exist_program,
          'kegiatan' => $request->is_exist_kegiatan,
          'subKegiatan' => $request->is_exist_sub_kegiatan,
          'unitKerja' => $request->is_exist_unker,
        ];

        foreach ($filters as $key => $value) {
          if ($value != '') {
            if ($value == 1) {
              $query->has($key);
            } else {
              $query->doesntHave($key);
            }
          }
        }

        $filters = [
          'id_program' => $request->program,
          'id_kegiatan' => $request->kegiatan,
          'id_sub_kegiatan' => $request->sub_kegiatan,
          'id_unker' => $request->unker,
          'is_active' => $request->is_active,
          'created_by' => $request->created_by,
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
        return encodeId($row->id_indikator);
      })
      ->addColumn('encode_row', function ($row) {
        return json_encode($row);
      })
      ->toJson();
  }

  public function store(Request $request)
  {
    $rule = [
      'jenis_indikator' => 'required',
      'deskripsi' => 'required',
      'id_program' => 'exists:master_program,id_program',
      'id_kegiatan' => 'exists:master_kegiatan,id_kegiatan',
      'id_sub_kegiatan' => 'exists:master_sub_kegiatan,id_sub_kegiatan',
      'id_unker' => 'exists:master_unker,id',
    ];

    if (xhasPermission($this->permissionValidation)) {
      $rule[$this->columnValidation] = 'required';
    }

    $validator = Validator::make($request->all(), $rule);
    if ($validator->fails()) {
      return resValidator($validator);
    }

    $id_program = null;
    $id_kegiatan = null;
    $id_sub_kegiatan = null;

    if ($request->input('id_sub_kegiatan') != '') {
      $sub_kegiatan = SubKegiatan::with('kegiatan', 'program')->find($request->input('id_sub_kegiatan'));

      $id_program = $sub_kegiatan->program->id_program;
      $id_kegiatan = $sub_kegiatan->kegiatan->id_kegiatan;
      $id_sub_kegiatan = (int) $request->input('id_sub_kegiatan');
    } else if ($request->input('id_kegiatan') != '') {
      $kegiatan = Kegiatan::with('program')->find($request->input('id_kegiatan'));

      $id_program = $kegiatan->program->id_program;
      $id_kegiatan = (int) $request->input('id_kegiatan');
    } else if ($request->input('id_program') != '') {
      $id_program = (int) $request->input('id_program');
    }

    $reqData = [
      'jenis_indikator' => $request->input('jenis_indikator'),
      'deskripsi' => $request->input('deskripsi'),
      'id_program' => $id_program,
      'id_kegiatan' => $id_kegiatan,
      'id_sub_kegiatan' => $id_sub_kegiatan,
      'id_unker' => $request->input('id_unker'),
      'is_active' => 0,
    ];

    if (xhasPermission($this->permissionValidation)) {
      $reqData[$this->columnValidation] = $request->input('is_active');
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
    $listData = $this->model::view()->where('id_indikator', decodeId($id))->first();
    $res['message'] = $this->titleData . ' berhasil didapatkan';
    $res['success'] = true;
    $res['data'] = $listData;
    return response()->json($res, Response::HTTP_OK);
  }

  public function update(Request $request, $id)
  {
    $master = $this->model::findOrfail(decodeId($id));

    $rule = [
      'jenis_indikator' => 'required',
      'deskripsi' => 'required',
      'id_program' => 'exists:master_program,id_program',
      'id_kegiatan' => 'exists:master_kegiatan,id_kegiatan',
      'id_sub_kegiatan' => 'exists:master_sub_kegiatan,id_sub_kegiatan',
      'id_unker' => 'exists:master_unker,id',
    ];

    if (xhasPermission($this->permissionValidation)) {
      $rule[$this->columnValidation] = 'required';
    }

    $validator = Validator::make($request->all(), $rule);
    if ($validator->fails()) {
      return resValidator($validator);
    }

    $id_program = null;
    $id_kegiatan = null;
    $id_sub_kegiatan = null;

    if ($request->input('id_sub_kegiatan') != '') {
      $sub_kegiatan = SubKegiatan::with('kegiatan', 'program')->find($request->input('id_sub_kegiatan'));

      $id_program = $sub_kegiatan->program->id_program;
      $id_kegiatan = $sub_kegiatan->kegiatan->id_kegiatan;
      $id_sub_kegiatan = (int) $request->input('id_sub_kegiatan');
    } else if ($request->input('id_kegiatan') != '') {
      $kegiatan = Kegiatan::with('program')->find($request->input('id_kegiatan'));

      $id_program = $kegiatan->program->id_program;
      $id_kegiatan = (int) $request->input('id_kegiatan');
    } else if ($request->input('id_program') != '') {
      $id_program = (int) $request->input('id_program');
    }

    $reqData = [
      'jenis_indikator' => $request->input('jenis_indikator'),
      'deskripsi' => $request->input('deskripsi'),
      'id_program' => $id_program,
      'id_kegiatan' => $id_kegiatan,
      'id_sub_kegiatan' => $id_sub_kegiatan,
      'id_unker' => $request->input('id_unker'),
      'is_active' => 0,
    ];

    if (xhasPermission($this->permissionValidation)) {
      $reqData[$this->columnValidation] = $request->input('is_active');
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
        'field' => 'id_unker',
        'name' => 'id_unker',
        'check' => 'unker_switch_bulk',
        'option' => true,
        'rule' => 'exists:master_unker,id',
      ],
      ['field' => 'jenis_indikator', 'name' => 'jenis_indikator', 'check' => 'jenis_indikator_switch_bulk', 'option' => false],
      ['field' => 'deskripsi', 'name' => 'deskripsi', 'check' => 'deskripsi_switch_bulk', 'option' => false],
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

    if ($request->input('indikator_switch_bulk')) {
      if ($request->input('id_sub_kegiatan')) {
        $rule['id_sub_kegiatan'] = 'exists:master_sub_kegiatan,id_sub_kegiatan';
      } else if ($request->input('id_kegiatan')) {
        $rule['id_kegiatan'] = 'exists:master_kegiatan,id_kegiatan';
      } else if ($request->input('id_program')) {
        $rule['id_program'] = 'exists:master_program,id_program';
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

    if ($request->input('indikator_switch_bulk')) {
      $id_program = null;
      $id_kegiatan = null;
      $id_sub_kegiatan = null;

      if ($request->input('id_sub_kegiatan') != '') {
        $sub_kegiatan = SubKegiatan::with('kegiatan', 'program')->find($request->input('id_sub_kegiatan'));

        $id_program = $sub_kegiatan->program->id_program;
        $id_kegiatan = $sub_kegiatan->kegiatan->id_kegiatan;
        $id_sub_kegiatan = (int) $request->input('id_sub_kegiatan');
      } else if ($request->input('id_kegiatan') != '') {
        $kegiatan = Kegiatan::with('program')->find($request->input('id_kegiatan'));

        $id_program = $kegiatan->program->id_program;
        $id_kegiatan = (int) $request->input('id_kegiatan');
      } else if ($request->input('id_program') != '') {
        $id_program = (int) $request->input('id_program');
      }

      $column_update['id_program'] = $id_program;
      $column_update['id_kegiatan'] = $id_kegiatan;
      $column_update['id_sub_kegiatan'] = $id_sub_kegiatan;
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
      $dataRemote = $dataRemote
        ->where('jenis_indikator', 'like', '%' . $search . '%');
    }

    $dataRemote = $dataRemote
      ->with(
        'program:id_program,kode_rekening,nama_program',
        'kegiatan:id_kegiatan,kode_rekening,nama_kegiatan',
        'subKegiatan:id_sub_kegiatan,kode_rekening,nama_sub_kegiatan'
      )
      ->select(
        'id_indikator as id',
        'jenis_indikator as text',
        'deskripsi',
        'id_program',
        'id_kegiatan',
        'id_sub_kegiatan'
      )
      ->orderBy('jenis_indikator')
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
      $query->where('jenis_indikator', 'like', '%' . $search . '%');
    })
      ->with(
        'program:id_program,kode_rekening,nama_program',
        'kegiatan:id_kegiatan,kode_rekening,nama_kegiatan',
        'subKegiatan:id_sub_kegiatan,kode_rekening,nama_sub_kegiatan'
      )
      ->select(
        'id_indikator as id',
        'jenis_indikator as text',
        'deskripsi',
        'id_program',
        'id_kegiatan',
        'id_sub_kegiatan'
      )
      ->orderBy('jenis_indikator')
      ->limit(100)
      ->get();

    return response()->json($dataRemote);
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
