<?php

namespace App\Console;
use App\Jobs\CleanupActivityLogs;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // $schedule->command('inspire')->hourly();
        $schedule->job(new CleanupActivityLogs())->monthlyOn(1, '09:00');
//        $schedule->command('backup:run')->dailyAt('09:00');
        $schedule->command('status:update')->everyMinute();
//        $schedule->command('backup:run')->everyMinute();
//        $schedule->command('backup:run')->dailyAt('02:00');
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');
        require base_path('routes/console.php');
    }
}