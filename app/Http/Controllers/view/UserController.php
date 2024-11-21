<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{
    //
    public function __construct()
    {
        $this->permissionCreate = 'users create';
        $this->permissionRead = 'users read';
        $this->permissionUpdate = 'users update';
        $this->permissionDelete = 'users delete';
        $this->permissionValidation = 'users validation';
        $this->permissionPrivilege = 'users privilege';
    }

    public function index()
    {
        $data['titlePage'] = 'pengguna aplikasi';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data pengguna aplikasi';
        $data['iconPage'] = '<i class="fas fa-fw fa-users me-2"></i>';
        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.user.index', $data);
    }
}
