<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Carbon;
use Spatie\Activitylog\Models\Activity;

class CleanupActivityLogsBAK implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function handle()
    {
        $backupPath = storage_path('app/backups');
        if (!is_dir($backupPath)) {
            mkdir($backupPath, 0755, true);
        }

        // Backup and delete old activity logs
//        Activity::where('created_at', '<', now()->subMonths(1))->chunk(100, function ($activities) {
        $activities = Activity::where('created_at', '<', now()->subMonths(1))->get();
        foreach ($activities as $activity) {
            $backupFileName = 'activity_log_' . $activity->id . '_' . now()->format('YmdHis') . '.json';
            Storage::put('backups/' . $backupFileName, json_encode($activity->toArray()));
            $activity->delete();
        }


        logger('Activity logs backed up and deleted.');
    }
}
