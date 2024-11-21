<?php

namespace App\Broadcasting;

use App\Models\User;
use App\Models\Ticket;

class MessageChannel
{
    /**
     * Create a new channel instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Authenticate the user's access to the channel.
     */
    public function join(User $user, Ticket $tiket): array|bool
    {
        return Auth::check() && (int) $user->id == Auth::id() && (int) $tiket->id_ticket == Auth::id();
    }
}
