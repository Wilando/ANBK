<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;

use App\Models\AreaAset;
use App\Models\Aset;
use App\Models\Barang;
use App\Models\Booking;
use App\Models\Customer;
use App\Models\Dokumen;
use App\Models\DTBarang;

use App\Models\JenisAset;
use App\Models\LogSyaratPegawai;
use App\Models\Pegawai;
use App\Models\Pengajuan;
use App\Models\ReviewAset;
use App\Models\StatusBooking;
use App\Models\Supplier;
use App\Models\Syarat;
use App\Models\SyaratJenisAset;
use App\Models\User;
use App\Services\hideyoriService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class IndexController extends Controller
{
    public function __construct()
    {
        $this->myService = new hideyoriService();
    }

    public function getSettingapp($name)
    {
        return getSetting($name);
    }

    public function getDashboard(Request $request)
    {

        $data['jumlah_dokumen'] = Dokumen::count();
        $data['jumlah_syarat'] = Syarat::count();
        $data['jumlah_pegawai'] = Pegawai::count();


        $jumlah_pengajuan = Pengajuan::view();




        $group_status_pengajuan = Pengajuan::view()->select(DB::raw('status_pengajuan, COUNT(status_pengajuan) as jumlah_status'));

        // $results_notif_pegawai = LogSyaratPegawai::join('syarat', 'log_pegawai_syarat.id_syarat', '=', 'syarat.id_syarat')
        //     ->select(
        //         'log_pegawai_syarat.id_pegawai',
        //         'log_pegawai_syarat.id_syarat',
        //         'syarat.pengingat_tahun',
        //         'log_pegawai_syarat.tanggal_syarat',
        //         DB::raw('DATE_ADD(log_pegawai_syarat.tanggal_syarat, INTERVAL syarat.pengingat_tahun YEAR) AS next_reminder')
        //     );



        // if (xhasRole('pic')) {
        //     $data['jumlah_daftar_aset'] = Aset::where('id_user_pic', auth()->user()->id)->count();

        //     $jumlah_pengajuan->where('id_user_pic', auth()->user()->id);
        //     $group_status_pengajuan->where('id_user_pic', auth()->user()->id);
        // }

        $jumlah_notif = LogSyaratPegawai::notif();
        if (xhasRole('peternak')) {
            $jumlah_pengajuan = $jumlah_pengajuan->where('id_pegawai', auth()->user()->id_pegawai);
            $group_status_pengajuan = $group_status_pengajuan->where('id_pegawai', auth()->user()->id_pegawai);
            $jumlah_notif = $jumlah_notif->where('id_pegawai', auth()->user()->id_pegawai);
        }

        $fDate = $request->get('fDate') ?? null;
        $tDate = $request->get('tDate') ?? null;
        if ($fDate && $tDate) {
            //            $jumlah_pengajuan->whereBetween('tgl_transaksi', [$fDate, $tDate]);

            $jumlah_pengajuan->whereBetween('tanggal_pengajuan', [$fDate, $tDate]);
            $jumlah_notif->whereBetween('next_reminder', [$fDate, $tDate]);
            // $results_notif_pegawai->whereBetween(DB::raw('DATE_ADD(log_pegawai_syarat.tanggal_syarat, INTERVAL syarat.pengingat_tahun YEAR)'), [$fDate, $tDate]);






            $group_status_pengajuan->whereBetween('tanggal_pengajuan', [$fDate, $tDate]);
        }
        // $results_notif_pegawai = $results_notif_pegawai->paginate(10);
        $group_status_pengajuan = $group_status_pengajuan->groupBy('status_pengajuan')->get();
        $stat1['group_status_pengajuan'] = $group_status_pengajuan;
        $stat1['fDate'] = $fDate;
        $stat1['tDate'] = $tDate;

        $res['stat1'] = view('panel.dashboard.data_statistik', $stat1)->render();

        $data['jumlah_pengajuan'] = $jumlah_pengajuan->count();
        $data['jumlah_notif'] = $jumlah_notif->count();
        // $hasil['results_notif_pegawai'] = $results_notif_pegawai;
        // $res['tabel_notif_syarat'] = view('panel.dashboard.list_notif_syarat', $hasil)->render();



        $res['message'] = 'data dashboard retrieved successfully';
        $res['success'] = true;
        $res['data'] = $data;

        return response()->json($res, Response::HTTP_OK);
    }

    public function datatable_notif(Request $request)
    {
        $data = LogSyaratPegawai::notif();
        if (xhasRole('peternak')) {
            $data = $data->where('id_pegawai', auth()->user()->id_pegawai);
        }

        // $created_by = $request->get('created_by');
        $fDate = $request->get('fDate') ?? null;
        $tDate = $request->get('tDate') ?? null;


        $data = $data->where(function ($query) use ($fDate, $tDate) {



            if ($fDate && $tDate) {
                $query->whereBetween('next_reminder', [$fDate, $tDate]);
            }
        });


        return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('kosong', function () {
                return '';
            })
            ->escapeColumns([])
            ->toJson();
    }




    public function uploadEditor(Request $request)
    {

        $rule['file'] = 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048';


        $validator = Validator::make($request->all(), $rule, [], []);
        if ($validator->fails()) {
            return resValidator($validator);
        }


        $fileimage = $request->file('file');
        $hashImage = $fileimage->hashName();
        $fileimage->storeAs('public/editor', $hashImage);


        return response()->json(['location' => asset("storage/editor/$hashImage")]);
    }


}
