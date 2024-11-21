<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

class IkuOpdController extends Controller
{
  public function __construct()
  {
    $this->permissionCreate = 'iku-opd create';
    $this->permissionRead = 'iku-opd read';
    $this->permissionUpdate = 'iku-opd update';
    $this->permissionDelete = 'iku-opd delete';
    $this->permissionValidation = 'iku-opd validation';
    $this->permissionPrivilege = 'iku-opd privilege';
  }

  public function index()
  {
    $data['titlePage'] = 'Indikator Kinerja Utama Organisasi Perangkat Daerah (IKU OPD)';
    $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data IKU OPD';
    $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

    $data['permissionCreate'] = $this->permissionCreate;
    $data['permissionRead'] = $this->permissionRead;
    $data['permissionUpdate'] = $this->permissionUpdate;
    $data['permissionValidation'] = $this->permissionValidation;
    $data['permissionDelete'] = $this->permissionDelete;
    $data['permissionPrivilege'] = $this->permissionPrivilege;

    return view('panel.iku-opd.index', $data);
  }
}
