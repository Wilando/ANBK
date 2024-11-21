<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Services\hideyoriService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Activitylog\Models\Activity;
use Yajra\DataTables\Facades\DataTables;

class LogController extends Controller
{
    private $myService;

    public function __construct()
    {
        $this->middleware(['auth', 'role:superadmin|admin']);
        $this->myService = new hideyoriService();
        $this->context = 'aktivitas';
    }

    public function index()
    {
        $eloUser = User::query();
        if (!xhasRole('superadmin')) {
            $eloUserNotSuper = User::whereHas('roles', function ($q) {
                $q->whereNotIn('name', ['superadmin']);
            });
            if (xhasRole('admin')) {
                $eloUser = $eloUserNotSuper;
            } else {
                if (xhasPermission('log-list')) {
                    $eloUser = $eloUserNotSuper;
                } else {
                    $eloUser = User::where('id', Auth::user()->id);
                }
            }
        }

        $view = 'panel.aktivitas.index';
        $data = [
            'listUser' => $eloUser->pluck('id', 'name')->all(),
        ];

        return view($view, $data);
    }

    public function data(Request $request)
    {
        $data = Activity::leftJoin('users', 'users.id', '=', 'activity_log.causer_id')->select('activity_log.id as id', 'activity_log.created_at as created_at', 'description', 'users.name as name');
//        if (!xhasRole('superadmin')) {
//            $eloUserNotSuper = User::distinct()->whereHas('roles', function ($q) {
//                $q->whereNotIn('name', ['superadmin']);
//            })->get(['id'])->pluck('id')->toArray();
//            if (xhasRole('admin')) {
//                $data->whereIn('causer_id', $eloUserNotSuper);
//            } else {
//                if (Auth::user()->can('log-list')) {
//                    $data->whereIn('causer_id', $eloUserNotSuper);
//                } else {
//                    $data->where('causer_id', Auth::user()->id);
//                }
//            }
//        }
        $causer_id = $request->get('causer_id');
        if ($causer_id != '') {
            $data->whereIn('causer_id', $causer_id);
        }

        $mulai = $request->get('mulai');
        $selesai = $request->get('selesai');
        if ($mulai && $selesai) {
            $data->whereBetween('activity_log.created_at', [$mulai, $selesai]);
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->addColumn('action', function ($row) {
                $btn = '';
//                if (xhasRole('superadmin')) {
//                    $btn .= deleteButtonDT($row->id);
//                }
//                $btn .= '</div>';
                return $btn;
            })
            ->escapeColumns([])
            ->toJson();
    }
}
