<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class UjianController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'ujian create';
        $this->permissionRead = 'ujian read';
        $this->permissionUpdate = 'ujian update';
        $this->permissionDelete = 'ujian delete';
        $this->permissionValidation = 'ujian validation';
        $this->permissionPrivilege = 'ujian privilege';
    }

    public function index()
    {       

        $data['titlePage'] = 'Ujian';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data ujian';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.ujian.index', $data);
    }


}
