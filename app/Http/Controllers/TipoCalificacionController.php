<?php

namespace App\Http\Controllers;

use App\Models\TipoCalificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoCalificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoCalificacion = TipoCalificacion::with([])
                    ->get();
        
        return $tipoCalificacion;
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
            'nb_tipo_calificacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoCalificacion = tipoCalificacion::create($request->all());

        return [ 'msj' => 'TipoCalificacion Agregado Correctamente', compact('tipoCalificacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoCalificacion  $tipoCalificacion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoCalificacion $tipoCalificacion)
    {
        return $tipoCalificacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoCalificacion  $tipoCalificacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoCalificacion $tipoCalificacion)
    {
        $validate = request()->validate([
            'nb_tipo_calificacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoCalificacion = $tipoCalificacion->update($request->all());

        return [ 'msj' => 'TipoCalificacion Editado' , compact('tipoCalificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoCalificacion  $tipoCalificacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoCalificacion $tipoCalificacion)
    {
        $tipoCalificacion = $tipoCalificacion->delete();
 
        return [ 'msj' => 'TipoCalificacion Eliminado' , compact('tipoCalificacion')];
    }
}
