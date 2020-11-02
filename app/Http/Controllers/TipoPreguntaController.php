<?php

namespace App\Http\Controllers;

use App\Models\TipoPregunta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoPreguntaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoPregunta = TipoPregunta::with([])
                    ->activo()
                    ->get();
        
        return $tipoPregunta;
    }

    public function tipoPreguntaActividad()
    {
        return  TipoPregunta::whereIn('id', [2, 3])
                    ->activo()
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
            'nb_tipo_pregunta'  => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoPregunta = tipoPregunta::create($request->all());

        return [ 'msj' => 'TipoPregunta Agregado Correctamente', compact('tipoPregunta') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoPregunta  $tipoPregunta
     * @return \Illuminate\Http\Response
     */
    public function show(TipoPregunta $tipoPregunta)
    {
        return $tipoPregunta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoPregunta  $tipoPregunta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoPregunta $tipoPregunta)
    {
        $validate = request()->validate([
            'nb_tipo_pregunta'  => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoPregunta = $tipoPregunta->update($request->all());

        return [ 'msj' => 'TipoPregunta Editado' , compact('tipoPregunta')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoPregunta  $tipoPregunta
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoPregunta $tipoPregunta)
    {
        $tipoPregunta = $tipoPregunta->delete();
 
        return [ 'msj' => 'TipoPregunta Eliminado' , compact('tipoPregunta')];
    }
}
