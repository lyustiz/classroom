<?php

namespace App\Http\Controllers;

use App\Models\TipoMensaje;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoMensajeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TipoMensaje::with([])
                    ->get();
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
            'nb_tipo_mensaje'   => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoMensaje = tipoMensaje::create($request->all());

        return [ 'msj' => 'Tipo Mensaje Agregado Correctamente', compact('tipoMensaje') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoMensaje  $tipoMensaje
     * @return \Illuminate\Http\Response
     */
    public function show(TipoMensaje $tipoMensaje)
    {
        return $tipoMensaje;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoMensaje  $tipoMensaje
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoMensaje $tipoMensaje)
    {
        $validate = request()->validate([
            'nb_tipo_mensaje'   => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoMensaje = $tipoMensaje->update($request->all());

        return [ 'msj' => 'Tipo Mensaje Editado' , compact('tipoMensaje')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoMensaje  $tipoMensaje
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoMensaje $tipoMensaje)
    {
        $tipoMensaje = $tipoMensaje->delete();
 
        return [ 'msj' => 'Tipo Mensaje Eliminado' , compact('tipoMensaje')];
    }
}
