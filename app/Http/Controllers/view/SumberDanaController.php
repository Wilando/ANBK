<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class SumberDanaController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'sumber dana create';
        $this->permissionRead = 'sumber dana read';
        $this->permissionUpdate = 'sumber dana update';
        $this->permissionDelete = 'sumber dana delete';
        $this->permissionValidation = 'sumber dana validation';
        $this->permissionPrivilege = 'sumber dana privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Sumber Dana';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data sumber dana';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.sumber_dana.index', $data);
    }


}
