<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Pusher\Pusher;

class MeetController extends Controller
{
    public function index(Request $request, Usuario $usuario)  { //TODO: Ususrio Segun token
        
        $users  = Usuario::select('id', 'nb_usuario', 'nb_nombres')
                          ->where('id', '!=', $usuario->id)
                          ->whereIn('id_tipo_usuario', [1,2,3])
                          ->limit(10)
                          ->get();
                        
        return [
            'users'        => $users,
            'pusherKey'    => config('broadcasting.connections.pusher.key'),
            'pusherCluster'=> config('broadcasting.connections.pusher.options.cluster') 
        ];
    }

    public function auth(Request $request, Usuario $usuario) 
    {
        $socket_id    = $request->socket_id;
        $channel_name = $request->channel_name;
        $pusher = new Pusher(
            config('broadcasting.connections.pusher.key'),
            config('broadcasting.connections.pusher.secret'),
            config('broadcasting.connections.pusher.app_id'),
            [
                'cluster' => config('broadcasting.connections.pusher.options.cluster'),
                'encrypted' => true
            ]
        );
        return response(
            $pusher->presence_auth($channel_name, $socket_id, $usuario->id, $usuario->only(['id', 'nb_nombres', 'nb_usuario', 'id_tipo_usuario','tx_email']))
        );
    }

}
