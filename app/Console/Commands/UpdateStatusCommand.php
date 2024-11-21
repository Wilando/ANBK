<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\StatusBooking;
use App\Models\Booking;

class UpdateStatusCommand extends Command
{
    protected $signature = 'status:update';
    protected $description = 'Update status of entities if time has passed.';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $idBatal = StatusBooking::select('id_status_booking')->where('status_ketersediaan', 'batal')->first()->id_status_booking ?? null;
        $idSelesai = StatusBooking::select('id_status_booking')->where('status_ketersediaan', 'tersedia')->first()->id_status_booking ?? null;
        $idKonfirmasi = StatusBooking::select('id_status_booking')->where('status_ketersediaan', 'tidak tersedia')->first()->id_status_booking ?? null;
        $idTolak = StatusBooking::select('id_status_booking')->where('status_booking', 'DITOLAK')->where('status_ketersediaan', '-')->first()->id_status_booking ?? null;
        $idProses = StatusBooking::select('id_status_booking')->where('status_booking', 'DALAM PROSES')->where('status_ketersediaan', '-')->first()->id_status_booking ?? null;
        if ($idKonfirmasi) {
            $entitiesSelesai = Booking::where('id_status_booking', $idKonfirmasi)
                ->where('tgl_selesai_booking', '<=', now())
                ->get();
            foreach ($entitiesSelesai as $entity) {
                $entity->id_status_booking = $idSelesai;
                $entity->save();
            }
        }

        if ($idProses) {
            $entitiesTolak = Booking::where('id_status_booking', $idProses)
                ->where('tgl_selesai_booking', '<=', now())
                ->get();
            foreach ($entitiesTolak as $entity) {
                $entity->id_status_booking = $idTolak;
                $entity->save();
            }
        }


        $this->info('Status Booking updated successfully.');
    }
}
