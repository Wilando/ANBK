<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

class IkuRpjmdController extends Controller
{
  public function __construct()
  {
    $this->permissionCreate = 'iku-rpjmd create';
    $this->permissionRead = 'iku-rpjmd read';
    $this->permissionUpdate = 'iku-rpjmd update';
    $this->permissionDelete = 'iku-rpjmd delete';
    $this->permissionValidation = 'iku-rpjmd validation';
    $this->permissionPrivilege = 'iku-rpjmd privilege';
  }

  public function index()
  {
    $data['titlePage'] = 'Indikator Kinerja Utama Rencana Pembangunan Jangka Menengah Daerah (IKU RPJMD)';
    $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data IKU RPJMD';
    $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

    $data['permissionCreate'] = $this->permissionCreate;
    $data['permissionRead'] = $this->permissionRead;
    $data['permissionUpdate'] = $this->permissionUpdate;
    $data['permissionValidation'] = $this->permissionValidation;
    $data['permissionDelete'] = $this->permissionDelete;
    $data['permissionPrivilege'] = $this->permissionPrivilege;

    return view('panel.iku-rpjmd.index', $data);
  }
}
