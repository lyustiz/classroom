<?php

namespace App\Http\Controllers;

use App\Models\TipoNotificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class TipoNotificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoNotificacion = TipoNotificacion::with([])
                    ->get();
        
        return $tipoNotificacion;
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
            'nb_tipo_notificacion'=> 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:30',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoNotificacion = tipoNotificacion::create($request->all());

        return [ 'msj' => 'TipoNotificacion Agregado Correctamente', compact('tipoNotificacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoNotificacion  $tipoNotificacion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoNotificacion $tipoNotificacion)
    {
        return $tipoNotificacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoNotificacion  $tipoNotificacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoNotificacion $tipoNotificacion)
    {
        $validate = request()->validate([
            'nb_tipo_notificacion'=> 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:30',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoNotificacion = $tipoNotificacion->update($request->all());

        return [ 'msj' => 'TipoNotificacion Editado' , compact('tipoNotificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoNotificacion  $tipoNotificacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoNotificacion $tipoNotificacion)
    {
        if( count($tipoNotificacion->notificacion) > 0 )
        {
            throw ValidationException::withMessages(['poseeNotificacion' => "Posee Notificacion(es) asociada(s)"]);
        }
        
        $tipoNotificacion = $tipoNotificacion->delete();
 
        return [ 'msj' => 'TipoNotificacion Eliminado' , compact('tipoNotificacion')];
    }
}
