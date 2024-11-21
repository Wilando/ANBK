<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class UnitKerjaController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'unit kerja create';
        $this->permissionRead = 'unit kerja read';
        $this->permissionUpdate = 'unit kerja update';
        $this->permissionDelete = 'unit kerja delete';
        $this->permissionValidation = 'unit kerja validation';
        $this->permissionPrivilege = 'unit kerja privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Unit Kerja';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data Unit Kerja';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.unit_kerja.index', $data);
    }


}
