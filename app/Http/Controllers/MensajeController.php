<?php

namespace App\Http\Controllers;

use App\Models\Mensaje;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\TipoMensaje;
use App\Models\TipoPrioridad;
use App\Models\TipoDestinatario;
use Illuminate\Support\Str;
use Carbon\Carbon;

class MensajeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Mensaje::with([])
                    ->get();
    }

    public function unRead($idDestinatario, $idTipoDestinatario)
    {
        return Mensaje::with([ 'usuario:usuario.id,nb_usuario,nb_nombres,id_tipo_usuario', 
                               'tipoMensaje:tipo_mensaje.id,nb_tipo_mensaje,tx_icono',
                               'tipoPrioridad:tipo_prioridad.id,nb_tipo_prioridad,tx_color'
                            ])
                           ->where( 'id_destinatario', $idDestinatario )
                           ->where( 'id_tipo_destinatario', $idTipoDestinatario )
                           ->unread()
                           ->latest()
                           ->limit(30)
                           ->get();
    }

    public function read($idDestinatario, $idTipoDestinatario)
    {
        return Mensaje::with([ 'usuario:usuario.id,nb_usuario,nb_nombres,id_tipo_usuario', 
                               'tipoMensaje:tipo_mensaje.id,nb_tipo_mensaje,tx_icono',
                               'tipoPrioridad:tipo_prioridad.id,nb_tipo_prioridad,tx_color'
                            ])
                            ->where( 'id_destinatario', $idDestinatario )
                            ->where( 'id_tipo_destinatario', $idTipoDestinatario )
                            ->read()
                            ->latest()
                            ->limit(30)
                            ->get();
    }

    public function combos()
    {
        $tipoMensaje      = TipoMensaje::comboData()->activo()->get(); 

        $tipoPrioridad    = TipoPrioridad::comboData()->activo()->get(); 

        $tipoDestinatario = TipoDestinatario::comboData()->activo()->get(); 

        return compact('tipoMensaje','tipoPrioridad','tipoDestinatario');
    }

    public function destinatario($tipoDestinatario)
    {
        $tipoDestinatario = TipoDestinatario::select('tx_origen')->find($tipoDestinatario); 

        if($tipoDestinatario->tx_origen == '*')
        {

            $data = ['id' => '1', 'nb_corto' => 'Todos'];

        }else{

            $nameSpace = '\\App\\Models\\'; 

            $model = $nameSpace . Str::studly($tipoDestinatario->tx_origen);

            $data = $model::select('id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2')->activo()->get(); 
        }

        return ['destinatario' => $data];
    }

    public function destinatarioById($tipoDestinatario, $idDestinatario)
    {
        $tipoDestinatario = TipoDestinatario::select('tx_origen')->find($tipoDestinatario); 

        $nameSpace = '\\App\\Models\\'; 

        $model = $nameSpace . Str::studly($tipoDestinatario->tx_origen);

        $data = $model::select('id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2')->activo()->find($idDestinatario); 

        return ['destinatario' => $data];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = request()->validate([
			'id_tipo_destinatario' => 'required|integer|max:999999999',
			'id_destinatario'      => 'required|integer|max:999999999',
			'tx_asunto'            => 'required|string|max:100',
			'tx_mensaje'           => 'required|string|max:300',
			'tx_lugar'             => 'nullable|string|max:80',
			'id_tipo_mensaje'      => 'required|integer|max:999999999',
			'id_tipo_prioridad'    => 'required|integer|max:999999999',
			'fe_mensaje'           => 'required|date',
			'hh_inicio'            => 'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'               => 'nullable|date_format:"H:i"',
            'id_origen'            => 'nullable|integer|max:999999999',
			'fe_lectura'           => 'nullable|date',
			'tx_observaciones'     => 'nullable|string|max:100',
			'id_status'            => 'required|integer|max:999999999',
			'id_usuario'           => 'required|integer|max:999999999',
        ]);

        $request->merge(['co_mensaje' =>   strtoupper ( Str::random(3). '-' .Str::random(3). '-' .Str::random(3). '-' .Str::random(3) ) ]);

        $mensaje = mensaje::create($request->all());

        return [ 'msj' => 'Mensaje Enviado', compact('mensaje') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Mensaje  $mensaje
     * @return \Illuminate\Http\Response
     */
    public function show(Mensaje $mensaje)
    {
        return $mensaje;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Mensaje  $mensaje
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Mensaje $mensaje)
    {
        $validate = request()->validate([
			'id_tipo_destinatario'=> 'required|integer|max:999999999',
			'id_destinatario'     => 'required|integer|max:999999999',
			'tx_asunto'           => 'required|string|max:100',
			'tx_mensaje'          => 'required|string|max:300',
			'tx_lugar'            => 'nullable|string|max:80',
			'id_tipo_mensaje'     => 'required|integer|max:999999999',
			'id_tipo_prioridad'   => 'required|integer|max:999999999',
			'fe_mensaje'          => 'required|date',
			'hh_inicio'           => 'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'              => 'nullable|date_format:"H:i"',
            'id_origen'           => 'nullable|integer|max:999999999',
			'fe_lectura'          => 'nullable|date',
			'tx_observaciones'    => 'nullable|string|max:100',
			'id_status'           => 'required|integer|max:999999999',
			'id_usuario'          => 'required|integer|max:999999999',
        ]);

        $mensaje = $mensaje->update($request->all());

        return [ 'msj' => 'Mensaje Editado' , compact('mensaje')];
    }

    public function markRead(Request $request, Mensaje $mensaje)
    {
        $mensaje = $mensaje->update(['fe_lectura' => Carbon::now()]);

        return [ 'msj' => 'Leido' , compact('mensaje')];
    }

    public function markReadAll($idDestinatario, $idTipoDestinatario)
    {
        $mensaje = Mensaje::where('id_destinatario',      $idDestinatario)
                          ->where('id_tipo_destinatario', $idTipoDestinatario)
                          ->whereNull('fe_lectura')
                          ->update(['fe_lectura' => Carbon::now()]);

        return [ 'msj' => 'Todos han sido marcadas como leidos' , compact('mensaje')];
    }

    public function markUnread(Request $request, Mensaje $mensaje)
    {
        $mensaje = $mensaje->update(['fe_lectura' => null]);

        return [ 'msj' => 'Leida' , compact('mensaje')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Mensaje  $mensaje
     * @return \Illuminate\Http\Response
     */
    public function destroy(Mensaje $mensaje)
    {
        $mensaje = $mensaje->delete();
 
        return [ 'msj' => 'Mensaje Eliminado' , compact('mensaje')];
    }
}
