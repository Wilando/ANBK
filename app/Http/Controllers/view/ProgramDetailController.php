<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class ProgramDetailController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'program detail create';
        $this->permissionRead = 'program detail read';
        $this->permissionUpdate = 'program detail update';
        $this->permissionDelete = 'program detail delete';
        $this->permissionValidation = 'program detail validation';
        $this->permissionPrivilege = 'program detail privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Program Detail';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data program detail';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.program_detail.index', $data);
    }


}
