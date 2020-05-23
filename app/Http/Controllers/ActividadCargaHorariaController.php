<?php

namespace App\Http\Controllers;

use App\Models\ActividadCargaHoraria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadCargaHorariaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $actividadCargaHoraria = ActividadCargaHoraria::with([])
                    ->get();
        
        return $actividadCargaHoraria;
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
			'id_carga_horaria'  => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadCargaHoraria = actividadCargaHoraria::create($request->all());

        return [ 'msj' => 'ActividadCargaHoraria Agregado Correctamente', compact('actividadCargaHoraria') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ActividadCargaHoraria  $actividadCargaHoraria
     * @return \Illuminate\Http\Response
     */
    public function show(ActividadCargaHoraria $actividadCargaHoraria)
    {
        return $actividadCargaHoraria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ActividadCargaHoraria  $actividadCargaHoraria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ActividadCargaHoraria $actividadCargaHoraria)
    {
        $validate = request()->validate([
            'id_actividad'      => 	'required|integer|max:999999999',
			'id_carga_horaria'  => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadCargaHoraria = $actividadCargaHoraria->update($request->all());

        return [ 'msj' => 'ActividadCargaHoraria Editado' , compact('actividadCargaHoraria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ActividadCargaHoraria  $actividadCargaHoraria
     * @return \Illuminate\Http\Response
     */
    public function destroy(ActividadCargaHoraria $actividadCargaHoraria)
    {
        $actividadCargaHoraria = $actividadCargaHoraria->delete();
 
        return [ 'msj' => 'ActividadCargaHoraria Eliminado' , compact('actividadCargaHoraria')];
    }
}
