<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;


class PermissionController extends Controller
{

    public function __construct()
    {
        $this->middleware(['role:superadmin']);
    }

    public function index()
    {
        $data['titlePage'] = 'Permission';
        $data['iconPage'] = '<i class="fas fa-lock me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan mengolah data permission';
        return view('panel.permission.index', $data);
    }


}
