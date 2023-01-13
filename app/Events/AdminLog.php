<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AdminLog
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $operation;
    public $table;
    public $model;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($operation, $table, $model)
    {
        $this->operation = $operation;
        $this->table = $table;
        $this->model = $model;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
