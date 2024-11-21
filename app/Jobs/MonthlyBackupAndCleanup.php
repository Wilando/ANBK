<?php

namespace App\Jobs;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Spatie\Activitylog\Models\Activity;

class MonthlyBackupAndCleanup implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function handle()
    {
        // Backup activity log to a SQL file
        $backupPath = storage_path('app/backups');
        if (!File::exists($backupPath)) {
            File::makeDirectory($backupPath, 0755, true);
        }

        $backupFilename = 'activity_log_backup_' . now()->format('Y-m-d') . '.sql';
        $backupFilePath = $backupPath . '/' . $backupFilename;

        DB::statement("SELECT * INTO OUTFILE '$backupFilePath' FROM activity_log");

        // Delete old activity logs
        Activity::where('created_at', '<=', now()->subMonths(1))->delete();
    }
}
