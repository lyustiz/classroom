<?php

namespace App\Http\Controllers;

use App\Models\TipoPrioridad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoPrioridadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoPrioridad = TipoPrioridad::with([])
                    ->get();
        
        return $tipoPrioridad;
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
            'nb_tipo_prioridad' => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:30',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoPrioridad = tipoPrioridad::create($request->all());

        return [ 'msj' => 'TipoPrioridad Agregado Correctamente', compact('tipoPrioridad') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoPrioridad  $tipoPrioridad
     * @return \Illuminate\Http\Response
     */
    public function show(TipoPrioridad $tipoPrioridad)
    {
        return $tipoPrioridad;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoPrioridad  $tipoPrioridad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoPrioridad $tipoPrioridad)
    {
        $validate = request()->validate([
            'nb_tipo_prioridad' => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:30',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoPrioridad = $tipoPrioridad->update($request->all());

        return [ 'msj' => 'TipoPrioridad Editado' , compact('tipoPrioridad')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoPrioridad  $tipoPrioridad
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoPrioridad $tipoPrioridad)
    {
        $tipoPrioridad = $tipoPrioridad->delete();
 
        return [ 'msj' => 'TipoPrioridad Eliminado' , compact('tipoPrioridad')];
    }
}
