<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class KegiatanController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'kegiatan create';
        $this->permissionRead = 'kegiatan read';
        $this->permissionUpdate = 'kegiatan update';
        $this->permissionDelete = 'kegiatan delete';
        $this->permissionValidation = 'kegiatan validation';
        $this->permissionPrivilege = 'kegiatan privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Kegiatan';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data kegiatan';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.kegiatan.index', $data);
    }


}
