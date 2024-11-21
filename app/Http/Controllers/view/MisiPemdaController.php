<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class MisiPemdaController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'misi pemda create';
        $this->permissionRead = 'misi pemda read';
        $this->permissionUpdate = 'misi pemda update';
        $this->permissionDelete = 'misi pemda delete';
        $this->permissionValidation = 'misi pemda validation';
        $this->permissionPrivilege = 'misi pemda privilege';
    }

    public function index()
    {       

        $data['titlePage'] = 'Misi Pemda';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data misi pemda';
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
