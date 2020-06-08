<?php

namespace App\Http\Controllers;

use App\Models\TipoEvaluacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoEvaluacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoEvaluacion = TipoEvaluacion::with([])
                    ->get();
        
        return $tipoEvaluacion;
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
            'nb_tipo_evaluacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoEvaluacion = tipoEvaluacion::create($request->all());

        return [ 'msj' => 'TipoEvaluacion Agregado Correctamente', compact('tipoEvaluacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoEvaluacion  $tipoEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoEvaluacion $tipoEvaluacion)
    {
        return $tipoEvaluacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoEvaluacion  $tipoEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoEvaluacion $tipoEvaluacion)
    {
        $validate = request()->validate([
            'nb_tipo_evaluacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoEvaluacion = $tipoEvaluacion->update($request->all());

        return [ 'msj' => 'TipoEvaluacion Editado' , compact('tipoEvaluacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoEvaluacion  $tipoEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoEvaluacion $tipoEvaluacion)
    {
        $tipoEvaluacion = $tipoEvaluacion->delete();
 
        return [ 'msj' => 'TipoEvaluacion Eliminado' , compact('tipoEvaluacion')];
    }
}