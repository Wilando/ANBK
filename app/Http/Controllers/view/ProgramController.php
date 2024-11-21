<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class ProgramController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'program create';
        $this->permissionRead = 'program read';
        $this->permissionUpdate = 'program update';
        $this->permissionDelete = 'program delete';
        $this->permissionValidation = 'program validation';
        $this->permissionPrivilege = 'program privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Program';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data program';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.program.index', $data);
    }


}
