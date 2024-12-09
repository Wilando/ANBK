<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use App\Models\Pengajuan;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class IndexController extends Controller
{

    public function nonaktif()
    {
     
        if (auth()->user()->is_active == 1) {
            return Redirect::to('app');
        }
        $data['titlePage'] = 'Akun Dinonaktifkan';
        $data['descriptionPage'] = 'halaman non aktif';
        $data['iconPage'] = '<i class="fa-fw fa-solid fa-user-slash"></i>';


        return view('panel.ekstra.non_aktif_halaman', $data);


    }


    public function index()
    {
       $tanggalAwalBulan = Carbon::now()->startOfYear();
       $tanggalAkhirBulan = Carbon::now()->endOfYear();
       $data['tglAwal'] = $tanggalAwalBulan->toDateString();
       $data['tglAkhir'] = $tanggalAkhirBulan->toDateString();

        $startOfDay = Carbon::now()->startOfDay();

        $endOfDay = Carbon::now()->endOfDay();


        $data['titlePage'] = 'dashboard';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';


        return view('panel.dashboard.index', $data);


    }
    
    public function listUjian()
    {

        $data['titlePage'] = 'List Ujian';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';
        return view('panel.dashboard.listUjian', $data);
    }
    
    public function ujian()
    {

        $data['titlePage'] = 'Ujian';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';
        return view('panel.dashboard.ujianSiswa', $data);
    }

    public function banksoal()
    {
      

        $data['titlePage'] = 'bank soal';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';


        return view('panel.dashboard.banksoal', $data);


    }
    public function soallm()
    {
      

        $data['titlePage'] = 'soallm';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';


        return view('panel.dashboard.soallm', $data);


    }
    
    public function literasinumerik()
    {
      

        $data['titlePage'] = 'literasinumerik';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';


        return view('panel.dashboard.literasinumerik', $data);

    }
    public function surveykarakter()
    {
      

        $data['titlePage'] = 'surveykarakter';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';


        return view('panel.dashboard.surveykarakter', $data);

    }
    public function lingkungansekitar()
    {
      

        $data['titlePage'] = 'lingkungansekitar';
        $data['descriptionPage'] = 'halaman yang digunakan untuk melihat ringkasan data';
        $data['iconPage'] = '<i class="fas fa-fw fa-chart-area me-2"></i>';


        return view('panel.dashboard.lingkungansekitar', $data);

    }
    public function onprogress()
    {
        $data['titlePage'] = 'on progress';
        $data['descriptionPage'] = 'halaman atau fitur sedang dalam pengembangan aplikasi';
        $data['iconPage'] = '<i class="fas fa-fw fa-warning me-2"></i>';

        return view('panel.onprogress', $data);
    }
}
