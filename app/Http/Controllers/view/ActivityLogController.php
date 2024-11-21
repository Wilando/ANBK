<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

class ActivityLogController extends Controller
{
    public function __construct()
    {
    }

    public function index()
    {
        $data['titlePage'] = 'Log Aktivitas';
        $data['iconPage'] = '<i class="fas fa-clock me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan melihat data aktivitas user';

        return view('panel.activity_log.index', $data);
    }
}
