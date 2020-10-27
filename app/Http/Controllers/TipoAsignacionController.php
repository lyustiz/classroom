<?php

namespace App\Http\Controllers;

use App\Models\TipoAsignacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoAsignacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TipoAsignacion::activo()->get();  
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
            'nb_tipo_asignacion'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_origen'         => 	'nullable|string|max:80',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoAsignacion = tipoAsignacion::create($request->all());

        return [ 'msj' => 'TipoAsignacion Agregado Correctamente', compact('tipoAsignacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoAsignacion  $tipoAsignacion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoAsignacion $tipoAsignacion)
    {
        return $tipoAsignacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoAsignacion  $tipoAsignacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoAsignacion $tipoAsignacion)
    {
        $validate = request()->validate([
            'nb_tipo_asignacion'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_origen'         => 	'nullable|string|max:80',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoAsignacion = $tipoAsignacion->update($request->all());

        return [ 'msj' => 'TipoAsignacion Editado' , compact('tipoAsignacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoAsignacion  $tipoAsignacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoAsignacion $tipoAsignacion)
    {
        $tipoAsignacion = $tipoAsignacion->delete();
 
        return [ 'msj' => 'TipoAsignacion Eliminado' , compact('tipoAsignacion')];
    }
}
