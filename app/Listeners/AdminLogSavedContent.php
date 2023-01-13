<?php

namespace App\Listeners;

use App\Models\Log;
use App\Events\AdminLog;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Auth;

class AdminLogSavedContent
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\AdminLog  $event
     * @return void
     */
    public function handle(AdminLog $event)
    {
        $operation = $event->operation;
        $table = $event->table;
        $model = $event->model;

        Log::create([
            'operation_name' => $operation,
            'table_name' => $table,
            'data_id' => $model->id,
            'user_id' => Auth::id(),
        ]);
    }
}
