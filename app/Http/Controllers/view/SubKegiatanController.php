<?php

namespace App\Http\Controllers\view;

use App\Http\Controllers\Controller;

use Vinkla\Hashids\Facades\Hashids;

class SubKegiatanController extends Controller
{
    public function __construct()
    {
        $this->permissionCreate = 'sub kegiatan create';
        $this->permissionRead = 'sub kegiatan read';
        $this->permissionUpdate = 'sub kegiatan update';
        $this->permissionDelete = 'sub kegiatan delete';
        $this->permissionValidation = 'sub kegiatan validation';
        $this->permissionPrivilege = 'sub kegiatan privilege';
    }

    public function index()
    {

        $data['titlePage'] = 'Sub Kegiatan';
        $data['descriptionPage'] = 'halaman yang digunakan untuk mengolah data Sub kegiatan';
        $data['iconPage'] = '<i class="fa-fw nav-icon bi bi-box2-heart-fill me-2"></i>';

        $data['permissionCreate'] = $this->permissionCreate;
        $data['permissionRead'] = $this->permissionRead;
        $data['permissionUpdate'] = $this->permissionUpdate;
        $data['permissionValidation'] = $this->permissionValidation;
        $data['permissionDelete'] = $this->permissionDelete;
        $data['permissionPrivilege'] = $this->permissionPrivilege;

        return view('panel.sub_kegiatan.index', $data);
    }

    public function getSubKegiatan($id)
    {
        // Mengambil data SubKegiatan dengan relasi ke Urusan
        $SubKegiatan = SubKegiatan::with('kegiatan')->find($id);

        // Cek jika data ditemukan
        if (!$SubKegiatan) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        // Mengembalikan data sebagai JSON untuk dipakai di JavaScript
        return response()->json($SubKegiatan);
    }
}
