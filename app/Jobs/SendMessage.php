<?php

namespace App\Jobs;

use App\Events\GotMessage;
use App\Models\TicketMessage;
use App\Models\MessageImage;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Carbon\Carbon;

class SendMessage implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct(public array $message)
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {   
        $pesan = TicketMessage::with(["gambar", "user"])->find($this->message["id_message"]);
        $pesan->sent_at = Carbon::parse($pesan->sent_at)->format('H:i');
        
        GotMessage::dispatch([
            'pesan' => $pesan,
        ]);
    }
}
