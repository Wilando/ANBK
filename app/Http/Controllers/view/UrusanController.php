<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class UrusanController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'urusan create';
        $this->permissionRead = 'urusan read';
        $this->permissionUpdate = 'urusan update';
        $this->permissionDelete = 'urusan delete';
        $this->permissionValidation = 'urusan validation';
        $this->permissionPrivilege = 'urusan privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Urusan';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data urusan';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.urusan.index', $data);
    }


}
