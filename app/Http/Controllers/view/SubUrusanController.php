<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class SubUrusanController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'sub urusan create';
        $this->permissionRead = 'sub urusan read';
        $this->permissionUpdate = 'sub urusan update';
        $this->permissionDelete = 'sub urusan delete';
        $this->permissionValidation = 'sub urusan validation';
        $this->permissionPrivilege = 'sub urusan privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Sub Urusan';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data Sub urusan';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.sub_urusan.index', $data);
    }

    public function getSubUrusan($id)
    {
        // Mengambil data SubUrusan dengan relasi ke Urusan
        $subUrusan = SubUrusan::with('urusan')->find($id);

        // Cek jika data ditemukan
        if (!$subUrusan) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        // Mengembalikan data sebagai JSON untuk dipakai di JavaScript
        return response()->json($subUrusan);
    }
}
