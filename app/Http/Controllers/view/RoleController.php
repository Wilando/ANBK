<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Vinkla\Hashids\Facades\Hashids;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:superadmin']);
    }

    public function index()
    {
        $data['titlePage'] = 'Role';
        $data['iconPage'] = '<i class="fas fa-lock me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan mengolah data role';

        return view('panel.role.index', $data);
    }

    public function create()
    {
        $data = [
            'action' => url('app/role/store'),
            'name' => old('name', ''),
            'Permission' => Permission::get(),
            'rolePermissions' => [],
            'mode' => 'add',
            'back' => url('app/role'),
        ];
        $data['titlePage'] = 'Form Add';
        $data['iconPage'] = '<i class="fas fa-lock me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan tambah data role';

        return view('panel.role.form', $data);
    }

    public function edit($id)
    {
        $decodeId = Hashids::decode($id)[0];
        $row = Role::where('id', $decodeId)->first();
        $rolePermissions = DB::table('role_has_permissions')->where('role_has_permissions.role_id', $row->id)
            ->pluck('role_has_permissions.permission_id', 'role_has_permissions.permission_id')
            ->all();
        $data = [
            'action' => url('app/role/update/'.decodeId($id)),
            'name' => $row->name,
            'Permission' => Permission::get(),
            'rolePermissions' => $rolePermissions,
            'mode' => 'edit',
            'back' => url('app/role'),
        ];
        $data['titlePage'] = 'Form Edit';
        $data['iconPage'] = '<i class="fas fa-lock me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan ubah data role';

        return view('panel.role.form', $data);
    }

    public function detail($id)
    {
        $decodeId = Hashids::decode($id)[0];
        $row = Role::where('id', $decodeId)->first();
        $rolePermissions = DB::table('role_has_permissions')
            ->leftJoin('permissions', 'role_has_permissions.permission_id', '=', 'permissions.id')
            ->where('role_has_permissions.role_id', $row->id)
            ->pluck('role_has_permissions.permission_id', 'permissions.name')
            ->all();
        $data = [
            'name' => $row->name,
            'rolePermissions' => $rolePermissions,
            'back' => url('app/role'),
        ];
        $data['titlePage'] = 'Detail';
        $data['iconPage'] = '<i class="fas fa-lock me-2"></i>';
        $data['descriptionPage'] = 'halaman yang digunakan lihat data role';

        return view('panel.role.detail', $data);
    }
}
