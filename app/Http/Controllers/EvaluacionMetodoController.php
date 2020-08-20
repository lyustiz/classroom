<?php

namespace App\Http\Controllers;

use App\Models\EvaluacionMetodo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EvaluacionMetodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $evaluacionMetodo = EvaluacionMetodo::with([])
                    ->get();
        
        return $evaluacionMetodo;
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
            'nb_evaluacion_metodo'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacionMetodo = evaluacionMetodo::create($request->all());

        return [ 'msj' => 'Metodo de Evaluacion Agregado Correctamente', compact('evaluacionMetodo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\EvaluacionMetodo  $evaluacionMetodo
     * @return \Illuminate\Http\Response
     */
    public function show(EvaluacionMetodo $evaluacionMetodo)
    {
        return $evaluacionMetodo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EvaluacionMetodo  $evaluacionMetodo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EvaluacionMetodo $evaluacionMetodo)
    {
        $validate = request()->validate([
            'nb_evaluacion_metodo'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacionMetodo = $evaluacionMetodo->update($request->all());

        return [ 'msj' => 'Metodo de Evaluacion Editado' , compact('evaluacionMetodo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EvaluacionMetodo  $evaluacionMetodo
     * @return \Illuminate\Http\Response
     */
    public function destroy(EvaluacionMetodo $evaluacionMetodo)
    {
        $evaluacionMetodo = $evaluacionMetodo->delete();
 
        return [ 'msj' => 'Metodo de Evaluacion Eliminado' , compact('evaluacionMetodo')];
    }
}
