<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use Spatie\Activitylog\Models\Activity;

class CleanupActivityLogs implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function handle()
    {
        // Backup activity logs to an SQL format
        $lastmonth = now()->subMonths(1)->format('Ym');
        $backupPath = storage_path('app/backups/activity_logs_backup_' . $lastmonth . '.sql');
        $this->backupActivityLogs($backupPath);

        // Delete activity logs
        $this->deleteActivityLogs();
    }

    protected function backupActivityLogs($backupPath)
    {
        $activityLogs = Activity::where('created_at', '<', now()->subMonths(1))->get();

        if (count($activityLogs) > 0) {
            $sql = $activityLogs->map(function ($log) {
                return "INSERT INTO activity_log (log_name, description, subject_type, subject_id, event, causer_id, causer_type, properties, batch_uuid, created_at, updated_at) VALUES ('$log->log_name', '$log->description', '$log->subject_type', '$log->subject_id', '$log->event', '$log->causer_id', '$log->causer_type', '$log->properties', '$log->batch_uuid', '$log->created_at', '$log->updated_at');";
            })->implode("\n");

            file_put_contents($backupPath, $sql);
        }


    }

    protected function deleteActivityLogs()
    {
        Activity::where('created_at', '<', now()->subMonths(1))->delete(); // This will delete all records from the activity log table
    }
}

