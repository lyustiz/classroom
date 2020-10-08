<?php

namespace App\Http\Controllers;

use App\Models\ActividadRecurso;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadRecursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ActividadRecurso::with([])
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
            'id_actividad'      => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadRecurso = actividadRecurso::create($request->all());

        return [ 'msj' => 'ActividadRecurso Agregado Correctamente', compact('actividadRecurso') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ActividadRecurso  $actividadRecurso
     * @return \Illuminate\Http\Response
     */
    public function show(ActividadRecurso $actividadRecurso)
    {
        return $actividadRecurso;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ActividadRecurso  $actividadRecurso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ActividadRecurso $actividadRecurso)
    {
        $validate = request()->validate([
            'id_actividad'      => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadRecurso = $actividadRecurso->update($request->all());

        return [ 'msj' => 'ActividadRecurso Editado' , compact('actividadRecurso')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ActividadRecurso  $actividadRecurso
     * @return \Illuminate\Http\Response
     */
    public function destroy(ActividadRecurso $actividadRecurso)
    {
        $actividadRecurso = $actividadRecurso->delete();
 
        return [ 'msj' => 'ActividadRecurso Eliminado' , compact('actividadRecurso')];
    }
}
