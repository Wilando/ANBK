<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;


class SettingController extends Controller
{

    public function __construct()
    {

    }

    public function index()
    {

        $data['allSetting'] = Setting::all();
        $data['titlePage'] = 'Konfigurasi Aplikasi';
        $data['iconPage'] = '<i class="fas fa-fw fa-gears me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengubah meta data aplikasi';
        return view('panel.settings.index', $data);
    }


}
