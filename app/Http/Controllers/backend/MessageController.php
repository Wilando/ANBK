<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use App\Models\TicketMessage;
use App\Models\User;
use App\Models\MessageImage;
use App\Jobs\SendMessage;

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

class MessageController extends Controller
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

        $this->model = TicketMessage::class;
        $this->titleData = 'Message';
        $this->logName = 'Ticket';
        $this->defaultRedirect = 'app/jenis-pakan';
        $this->nameTable = (new TicketMessage())->getTable();
        $this->primaryKey = (new TicketMessage())->getKeyName();
        $this->columnPrivilege = 'created_by';;
        $this->myService = new hideyoriService();
        $this->middleware(function ($request, $next) {
            $this->valuePrivilege = auth()->user()->id;

            return $next($request);
        });
    }

    public function listMessage($id)
    {
        $listData = $this->model::with("user")->where('id_ticket', decodeId($id))->first();
        $res['message'] = $this->titleData . ' berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $listData;
        return response()->json($res, Response::HTTP_OK);
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
            ->log('mengirim pesan pada tiket');

        $res['message'] = 'berhasil mengirim pesan';
        $res['success'] = true;
        $res['data'] = $processData;

        return $res;
    }


    public function store(Request $request)
    {
        $rule = [
            'message' => 'required',
            'id_ticket' => 'required'
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
            if ($errors->has('message')) {
                $customMessages["message"] = $errors->first('message');
            }
            if ($errors->has('id_ticket')) {
                $customMessages["id_ticket"] = $errors->first('id_ticket');
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
            'message' => $request->input('message'),
            'id_ticket' => $request->input('id_ticket'),
            'sender_id' => Auth::user()->id,
        ];

        $res = $this->myService->trx_db($this->_insert($reqData));

        if ($request->hasFile('gambar')) {
            $listGambar = $request->file('gambar');
            foreach ($listGambar as $gambar) {
                $hashImage = $gambar->hashName();
                $gambar->storeAs('public/gambar_message', $hashImage);
                MessageImage::create([
                    'id_message'=>$res["data"]["id_message"],
                    'image'=>'gambar_message/'.$hashImage,
                ]);
            }
        }

        SendMessage::dispatch($res["data"]->getAttributes());

        if ($request->wantsJson()) {
            return response()->json($res, Response::HTTP_CREATED);
        } else {
            return redirect($this->defaultRedirect)->with($res);
        }
    }

    public function dataMessageTiket($id)
    {
        $pesan = TicketMessage::with(["user", "gambar"])->find(decodeId($id));
        $pesan->sent_at = Carbon::parse($pesan->sent_at)->format('H:i');
        $res['message'] = $this->titleData . ' berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $pesan;
        return response()->json($res, Response::HTTP_OK);
    }

}
