<?php

namespace App\Http\Controllers;

use App\Models\Notificacion;
use App\Models\TipoNotificacion;
use App\Models\TipoPrioridad;
use App\Models\TipoDestinatario;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;

class NotificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $notificacion = Notificacion::with([])
                    ->get();
        
        return $notificacion;
    }

    public function combos()
    {
        $tipoNotificacion = TipoNotificacion::comboData()->activo()->get(); 

        $tipoPrioridad    = TipoPrioridad::comboData()->activo()->get(); 

        $tipoDestinatario = TipoDestinatario::comboData()->activo()->get(); 

        return compact('tipoNotificacion','tipoPrioridad','tipoDestinatario');
    }

    public function destinatario($tipoDestinatario)
    {
        $tipoDestinatario = TipoDestinatario::select('tx_origen')->find($tipoDestinatario); 

        if($tipoDestinatario->tx_origen == '*')
        {

            $data = ['id' => '1', 'nb_corto' => 'Todos'];

        }else{

            $nameSpace = '\\App\\Models\\'; 

            $model = $nameSpace . Str::of($tipoDestinatario->tx_origen)->camel();

            $data = $model::select('id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2')->activo()->get(); 
        }

        return ['destinatario' => $data];
    }

    public function destinatarioById($tipoDestinatario, $idDestinatario)
    {
        $tipoDestinatario = TipoDestinatario::select('tx_origen')->find($tipoDestinatario); 

        $nameSpace = '\\App\\Models\\'; 

        $model = $nameSpace . Str::of($tipoDestinatario->tx_origen)->camel();

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
			'id_tipo_destinatario'  => 	'required|integer|max:999999999',
			'id_destinatario'       => 	'required|integer|max:999999999',
			'tx_asunto'             => 	'required|string|max:100',
			'tx_mensaje'            => 	'required|string|max:300',
			'tx_lugar'              => 	'nullable|string|max:80',
			'id_tipo_notificacion'  => 	'required|integer|max:999999999',
			'id_tipo_prioridad'     => 	'required|integer|max:999999999',
			'fe_notificacion'       => 	'required|date',
			'hh_inicio'             => 	'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'                => 	'nullable|date_format:"H:i"',
			'tx_observaciones'      => 	'nullable|string|max:100',
			'id_status'             => 	'required|integer|max:999999999',
			'id_usuario'            => 	'required|integer|max:999999999',
        ]);

        $request->merge(['co_notificacion' => Str::random(16)]);

        $notificacion = notificacion::create($request->all());

        return [ 'msj' => 'Notificacion Creada Correctamente', compact('notificacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Notificacion  $notificacion
     * @return \Illuminate\Http\Response
     */
    public function show(Notificacion $notificacion)
    {
        return $notificacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Notificacion  $notificacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Notificacion $notificacion)
    {
        $validate = request()->validate([
			'id_tipo_destinatario'  => 	'required|integer|max:999999999',
			'id_destinatario'       => 	'required|integer|max:999999999',
			'tx_asunto'             => 	'required|string|max:100',
			'tx_mensaje'            => 	'required|string|max:300',
			'tx_lugar'              => 	'nullable|string|max:80',
			'id_tipo_notificacion'  => 	'required|integer|max:999999999',
			'id_tipo_prioridad'     => 	'required|integer|max:999999999',
            'fe_notificacion'       => 	'required|date',
			'hh_inicio'             => 	'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'                => 	'nullable|date_format:"H:i"',
			'tx_observaciones'      => 	'nullable|string|max:100',
			'id_status'             => 	'required|integer|max:999999999',
			'id_usuario'            => 	'required|integer|max:999999999',
        ]);

        $notificacion = $notificacion->update($request->all());

        return [ 'msj' => 'Notificacion Editado' , compact('notificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Notificacion  $notificacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Notificacion $notificacion)
    {
        $notificacion = $notificacion->delete();
 
        return [ 'msj' => 'Notificacion Eliminado' , compact('notificacion')];
    }
}
