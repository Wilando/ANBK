<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use App\Models\Tickets;
use App\Models\User;
use App\Models\TicketImage;

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
use Carbon\Carbon;

class TicketsController extends Controller
{
    public function __construct()
    {
        $this->valuePrivilege = null;
        $this->middleware('auth');
        $this->permissionCreate = 'tickets create';
        $this->permissionRead = 'tickets read';
        $this->permissionUpdate = 'tickets update';
        $this->permissionDelete = 'tickets delete';
        $this->permissionValidation = 'tickets validation';
        $this->permissionPrivilege = 'tickets privilege';

        $this->middleware('permission:' . $this->permissionRead, ['only' => ['index']]);
        $this->middleware('permission:' . $this->permissionCreate, ['only' => ['store']]);
        $this->middleware('permission:' . $this->permissionUpdate, ['only' => ['update']]);
        $this->middleware('permission:' . $this->permissionDelete, ['only' => ['destroy', 'bulkDelete']]);
        $this->middleware('permission:' . $this->permissionValidation . '|' . $this->permissionUpdate, ['only' => ['bulkUpdate']]);

        $this->model = Tickets::class;
        $this->titleData = 'Tickets';
        $this->columnRef = 'subject';
        $this->logName = 'Ticket';
        $this->defaultRedirect = 'app/jenis-pakan';
        $this->nameTable = (new Tickets())->getTable();
        $this->primaryKey = (new Tickets())->getKeyName();
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
        $data = $this->model::with("user");

        // $id_user = $request->get('id_user');
        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        $status = $request->get('status');

        $data = $data->where(function ($query) use ($mulai, $selesai, $status) {

            if ($status) {
                $query->where('status', $status);
            }
            if ($mulai && $selesai) {
                $query->whereBetween('created_at', [$mulai, $selesai]);
            }
        });


        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('hashId', function ($row) {
                return encodeId(id: $row->id_ticket);
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
            ->log('membuat tiket');

        $res['message'] = $this->titleData . ' berhasil ditambahkan';
        $res['success'] = true;
        $res['data'] = $processData;

        return $res;
    }


    public function store(Request $request)
    {
        $rule = [
            'subject' => 'required',
        ];
        
        if ($request->hasFile('gambar')) {
            $rule['gambar'] = 'required|array'; 
            $rule['gambar.*'] = 'image|mimes:jpeg,png,jpg,gif,svg|max:2048';
        }
        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            // Ambil semua kesalahan validasi
            $errors = $validator->errors();
            
            // Buat pesan kesalahan khusus
            $customMessages = [];

            // Jika ada kesalahan lainnya
            if ($errors->has('subject')) {
                $customMessages["subject"] = $errors->first('subject');
            }
            if ($errors->has('gambar.*')) {
                $customMessages["gambar"] = 'Beberapa file dalam input tidak valid. Pastikan semuanya adalah gambar.';
            }

            // Kembalikan kesalahan sebagai response JSON
            return response()->json([
                'success' => false,
                'errors' => $customMessages,
                'messages' => $customMessages,
            ], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $reqData = [
            'subject' => $request->input('subject'),
            'status' => "open",
        ];

        $res = $this->myService->trx_db($this->_insert($reqData));

        if ($request->hasFile('gambar')) {
            $listGambar = $request->file('gambar');
            foreach ($listGambar as $gambar) {
                $hashImage = $gambar->hashName();
                $gambar->storeAs('public/gambar_tiket', $hashImage);
                TicketImage::create([
                    'id_ticket'=>$res["data"]["id_ticket"],
                    'image'=>'gambar_tiket/'.$hashImage,
                ]);
            }
        }

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_CREATED);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    public function show($id)
    {

        $listData = $this->model::with(["user","gambar"])->where('id_ticket', decodeId($id))->first();
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


        $attribute_rule = [];

        $validator = Validator::make($request->all(), $rule, [], $attribute_rule);
        if ($validator->fails()) {
            return resValidator($validator);
        }

        $reqData = [
            'Unit_Kerja' => $request->input('Unit_Kerja'),
            'T_KUnker' => $request->input('T_KUnker'),
            'Kepala' => $request->input('Kepala')
        ];

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

    private function _ubahStatus($master, $reqData)
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
                ->log('memperbarui status tiket');
        }


        $res['message'] = $this->titleData . ' berhasil diperbarui';
        $res['success'] = true;
        $res['data'] = $processData;

        return $res;
    }

    public function ubahStatus(Request $request, $id)
    {
        $master = $this->model::findOrfail(decodeId($id));
        $reqData = [
            'status' => $request->input('status')
        ];

        $res = $this->myService->trx_db($this->_ubahStatus($master, $reqData));

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_OK);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    public function dataMessageTiket($id)
    {
        $listData = $this->model::with(["pesan.user", "pesan.gambar"])->where('id_ticket', decodeId($id))->get();
        $pesanData = $listData->flatMap(function ($ticket) {
            return $ticket->pesan;
        })->groupBy(function ($pesan) {
            return Carbon::parse($pesan->sent_at)->format('Y-m-d');
        })->map(function ($groupedMessages) {
            return $groupedMessages->map(function ($pesan) {
                $pesan->sent_at = Carbon::parse($pesan->sent_at)->format('H:i'); // Tampilkan hanya jam (format 24 jam)
                return $pesan;
            });
        });

        $res['message'] = 'Pesan berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $pesanData;
        return response()->json($res, Response::HTTP_OK);
    }
}
