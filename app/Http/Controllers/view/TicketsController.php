<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class TicketsController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'tickets create';
        $this->permissionRead = 'tickets read';
        $this->permissionUpdate = 'tickets update';
        $this->permissionDelete = 'tickets delete';
        $this->permissionValidation = 'tickets validation';
        $this->permissionPrivilege = 'tickets privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Daftar Ticket';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data tickets';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';
        $data['btnText'] = 'Buat Tiket';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.tickets.index', $data);
    }

    public function detail()
    {

        $data['titlePage'] = 'Detail Ticket';
        $data['chatPage'] = 'Chat Ticket';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah detail tickets';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.tickets.detail', $data);
    }

}
