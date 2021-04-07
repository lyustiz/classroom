<?php

namespace App\Http\Controllers;

use App\Models\TipoEvaluacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class TipoEvaluacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return TipoEvaluacion::activo()->asignable($request->filled('asignable'))->get();  
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
            'tx_icono'          => 	'required|string|max:30',
            'tx_color'          => 	'required|string|max:30',
            'tx_clase'          => 	'required|string|max:30',
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
            'tx_icono'          => 	'required|string|max:30',
            'tx_color'          => 	'required|string|max:30',
            'tx_clase'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoEvaluacion = $tipoEvaluacion->update($request->all());

        return [ 'msj' => 'Tipo Evaluacion Actualizada' , compact('tipoEvaluacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoEvaluacion  $tipoEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoEvaluacion $tipoEvaluacion)
    {
        if($tipoEvaluacion->id)
        {
            throw ValidationException::withMessages(['lockData' => "Tipo evaluacion Asignada solo para pruebas"]);
        }
        
        $tipoEvaluacion = $tipoEvaluacion->delete();
 
        return [ 'msj' => 'Tipo Evaluacion Eliminada' , compact('tipoEvaluacion')];
    }
}
