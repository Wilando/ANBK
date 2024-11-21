<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

class IndikatorController extends Controller
{
  public function __construct()
  {
    $this->permissionCreate = 'indikator create';
    $this->permissionRead = 'indikator read';
    $this->permissionUpdate = 'indikator update';
    $this->permissionDelete = 'indikator delete';
    $this->permissionValidation = 'indikator validation';
    $this->permissionPrivilege = 'indikator privilege';
  }

  public function index()
  {
    $data['titlePage'] = 'Indikator';
    $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data indikator';
    $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

    $data['permissionCreate'] = $this->permissionCreate;
    $data['permissionRead'] = $this->permissionRead;
    $data['permissionUpdate'] = $this->permissionUpdate;
    $data['permissionValidation'] = $this->permissionValidation;
    $data['permissionDelete'] = $this->permissionDelete;
    $data['permissionPrivilege'] = $this->permissionPrivilege;

    return view('panel.indikator.index', $data);
  }
}
