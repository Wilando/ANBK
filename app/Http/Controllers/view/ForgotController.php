<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class ForgotController extends Controller
{

    public function __construct()
    {
    }


    public function index()
    {
        return view('auth.forgot');
    }

    public function reset(Request $request)
    {
        $data['token'] = $request->get('token');
        $data['email'] = $request->get('email');
        return view('auth.reset', $data);
    }


}
