<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class MisiPemdaController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'topic create';
        $this->permissionRead = 'topic read';
        $this->permissionUpdate = 'topic update';
        $this->permissionDelete = 'topic delete';
        $this->permissionValidation = 'topic validation';
        $this->permissionPrivilege = 'topic privilege';
    }

    public function index()
    {       

        $data['titlePage'] = 'Topic';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data topic';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.misi_pemda.index', $data);
    }


}
