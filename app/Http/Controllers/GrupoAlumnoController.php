<?php

namespace App\Http\Controllers;

use App\Models\GrupoAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GrupoAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grupoAlumno = GrupoAlumno::with([
                                            'alumno:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                            'grupo:id,nb_grupo',
                                        ])
                                        ->get();
        
        return $grupoAlumno;
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
            'id_grupo'          => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupoAlumno = grupoAlumno::create($request->all());

        return [ 'msj' => 'Grupo Agregado Correctamente', compact('grupoAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GrupoAlumno  $grupoAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(GrupoAlumno $grupoAlumno)
    {
        return $grupoAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GrupoAlumno  $grupoAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GrupoAlumno $grupoAlumno)
    {
        $validate = request()->validate([
            'id_grupo'          => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupoAlumno = $grupoAlumno->update($request->all());

        return [ 'msj' => 'Grupo Actualizado' , compact('grupoAlumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GrupoAlumno  $grupoAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(GrupoAlumno $grupoAlumno)
    {
        $grupoAlumno = $grupoAlumno->delete();
 
        return [ 'msj' => 'Grupo Eliminado' , compact('grupoAlumno')];
    }
}
