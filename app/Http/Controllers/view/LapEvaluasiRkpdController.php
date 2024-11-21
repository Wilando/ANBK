<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

class LapEvaluasiRkpdController extends Controller
{
  public function __construct()
  {
    $this->permissionCreate = 'lap-evaluasi-rkpd create';
    $this->permissionRead = 'lap-evaluasi-rkpd read';
    $this->permissionUpdate = 'lap-evaluasi-rkpd update';
    $this->permissionDelete = 'lap-evaluasi-rkpd delete';
    $this->permissionValidation = 'lap-evaluasi-rkpd validation';
    $this->permissionPrivilege = 'lap-evaluasi-rkpd privilege';
  }

  public function index()
  {
    $data['titlePage'] = 'Laporan Evaluasi RKPD Provinsi';
    $data['descriptionPage'] = 'halaman yang digunakan untuk menampilkan Laporan Evaluasi RKPD Provinsi';
    $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

    $data['permissionCreate'] = $this->permissionCreate;
    $data['permissionRead'] = $this->permissionRead;
    $data['permissionUpdate'] = $this->permissionUpdate;
    $data['permissionValidation'] = $this->permissionValidation;
    $data['permissionDelete'] = $this->permissionDelete;
    $data['permissionPrivilege'] = $this->permissionPrivilege;

    return view('panel.lap-evaluasi-rkpd.index', $data);
  }
}
