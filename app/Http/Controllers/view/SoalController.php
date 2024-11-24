<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class SoalController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'soal create';
        $this->permissionRead = 'soal read';
        $this->permissionUpdate = 'soal update';
        $this->permissionDelete = 'soal delete';
        $this->permissionValidation = 'soal validation';
        $this->permissionPrivilege = 'soal privilege';
    }

    public function index()
    {       

        $data['titlePage'] = 'Soal';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data soal';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.soal.index', $data);
    }


}
