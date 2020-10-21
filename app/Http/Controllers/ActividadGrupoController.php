<?php

namespace App\Http\Controllers;

use App\Models\ActividadGrupo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadGrupoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ActividadGrupo::with([])
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
			'id_grupo'          => 	'required|integer|max:999999999',
			'fe_inicio'         => 	'required|string|max:0',
			'fe_fin'            => 	'nullable|string|max:0',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadGrupo = actividadGrupo::create($request->all());

        return [ 'msj' => 'ActividadGrupo Agregado Correctamente', compact('actividadGrupo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ActividadGrupo  $actividadGrupo
     * @return \Illuminate\Http\Response
     */
    public function show(ActividadGrupo $actividadGrupo)
    {
        return $actividadGrupo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ActividadGrupo  $actividadGrupo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ActividadGrupo $actividadGrupo)
    {
        $validate = request()->validate([
            'id_actividad'      => 	'required|integer|max:999999999',
			'id_grupo'          => 	'required|integer|max:999999999',
			'fe_inicio'         => 	'required|string|max:0',
			'fe_fin'            => 	'nullable|string|max:0',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadGrupo = $actividadGrupo->update($request->all());

        return [ 'msj' => 'ActividadGrupo Editado' , compact('actividadGrupo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ActividadGrupo  $actividadGrupo
     * @return \Illuminate\Http\Response
     */
    public function destroy(ActividadGrupo $actividadGrupo)
    {
        $actividadGrupo = $actividadGrupo->delete();
 
        return [ 'msj' => 'ActividadGrupo Eliminado' , compact('actividadGrupo')];
    }
}
