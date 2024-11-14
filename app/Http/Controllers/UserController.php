<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

use App\Models\User;

class UserController extends Controller
{
    public function listUser(){
        // Mengambil semua data pengguna
        $users = User::all();

        // Mengembalikan data pengguna dalam format JSON
        return response()->json([
            'status' => true,
            'data' => $users
        ]);
    }

    


}
