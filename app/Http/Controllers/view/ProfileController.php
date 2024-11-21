<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Activitylog\Models\Activity;

class ProfileController extends Controller
{
    public function __construct()
    {
    }

    public function account()
    {
        $data['titlePage'] = 'Akun Pengguna';
        $data['iconPage'] = '<i class="fas fa-fw fa-user-cog me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data akun';

        return view('panel.profile.account', $data);
    }

    public function activity()
    {
        $data['titlePage'] = 'Aktivitas Saya';
        $data['iconPage'] = '<i class="fas fa-fw fa-hourglass me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat log aktivitas saya';

        return view('panel.profile.activity', $data);
    }

    public function change_password()
    {
        $data['titlePage'] = 'Ubah Kata Sandi Akun';
        $data['iconPage'] = '<i class="fas fa-lock-open me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengubah password akun';

        return view('panel.profile.password', $data);
    }

    public function renderActivity(Request $request)
    {
        $per_page = $request->get('per_page') ?? 15;
        $sort = $request->get('sort') ?? 'id';
        $order = $request->get('order') ?? 'DESC';
        $search = $request->get('search') ?? null;
        $columnSearch = $request->get('column_search') ?? 'description';
        $activityLog = Activity::select('id', 'log_name', 'description', 'created_at', 'updated_at')->where('causer_id', $request->user()->id);

        if ($search != null) {
            $activityLog = $activityLog->where($columnSearch, 'like', '%'.$search.'%');
        }
        $activityLog = $activityLog->orderBy($sort, $order)->paginate($per_page);
        $activityLog->onEachSide(0)->links();
        $res['message'] = 'log aktivitas saya berhasil didapatkan';
        $res['success'] = true;
        $res['data'] = $activityLog;

        return view('panel.profile.render_activity', $res)->render();
    }
}
