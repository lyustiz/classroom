<?php

namespace App\Http\Controllers;

use App\Models\Grupo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class GrupoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grupo = Grupo::with(['grado:grado.id,nb_grado',
                              'turno:turno.id,nb_turno',
                              'calendario:calendario.id,nb_calendario',
                              'docente:docente.id,nb_nombre,nb_apellido'])
                    ->orderBy('id_calendario', 'asc')
                    ->orderBy('id_grado', 'asc')
                    ->get();
        
        return $grupo;
    }

    public function list()
    {
        return Grupo::select('id', 'nb_grupo')
                    ->orderBy('id_calendario', 'asc')
                    ->orderBy('id_grado', 'asc')
                    ->get();
    }

    public function grupoAlumnosDocente($idDocente)
    {
        return Grupo::with([
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento',
                          ])
                    ->select('grupo.id', 'nb_grupo')
                    ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                        $query->where('id_docente', $idDocente);
                    })
                    ->get();
    }

    public function grupoGrado($idGrado)
    {
        return Grupo::select('id', 'nb_grupo')
                    ->where('id_grado', $idGrado)
                    ->where('id_status', 1)
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
            'nb_grupo'          => 	'nullable|string|max:30',
			'id_grado'          => 	'required|integer|max:999999999',
            'id_turno'          => 	'required|integer|max:999999999',
            'id_calendario'     => 	'required|integer|max:999999999',
			'id_profesor'       => 	'nullable|integer|max:999999999',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupo = grupo::create($request->all());

        return [ 'msj' => 'Grupo Agregado Correctamente', compact('grupo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Grupo  $grupo
     * @return \Illuminate\Http\Response
     */
    public function show(Grupo $grupo)
    {
        return $grupo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grupo  $grupo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grupo $grupo)
    {
        $validate = request()->validate([
            'nb_grupo'          => 	'nullable|string|max:30',
			'id_grado'          => 	'required|integer|max:999999999',
            'id_turno'          => 	'required|integer|max:999999999',
            'id_calendario'     => 	'required|integer|max:999999999',
			'id_profesor'       => 	'nullable|integer|max:999999999',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupo = $grupo->update($request->all());

        return [ 'msj' => 'Grupo Editado' , compact('grupo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grupo  $grupo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Grupo $grupo)
    {
        $grupo = $grupo->delete();
 
        return [ 'msj' => 'Grupo Eliminado' , compact('grupo')];
    }
}
