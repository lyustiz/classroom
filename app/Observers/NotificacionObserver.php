<?php

namespace App\Observers;

use App\Models\Notificacion;
use App\Events\NotificacionEvent;

class NotificacionObserver
{
    /**
     * Handle the notificacion "created" event.
     *
     * @param  \App\Notificacion  $notificacion
     * @return void
     */
    public function created(Notificacion $notificacion)
    {
        event(new NotificacionEvent($notificacion->load('tipoNotificacion')));
    }

}
