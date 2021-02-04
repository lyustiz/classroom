<?php

namespace App\Http\Controllers;

use App\Models\Grupo;
use App\Models\GradoMateria;
use App\Models\GrupoMateria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;

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
                              'materia:materia.id,nb_materia',
                              'coordinador:docente.id,nb_nombre,nb_apellido'])
                    ->orderBy('id_grado', 'asc')
                    ->orderBy('nu_orden', 'asc')
                    ->has('calendarioActivo')
                    ->get();
        
        return $grupo;
    }

    public function list()
    {
        return Grupo::select('id', 'nb_grupo')
                    ->orderBy('id_calendario', 'asc')
                    ->orderBy('id_grado', 'asc')
                    ->has('calendarioActivo')
                    ->get();
    }

    public function grupoDocente($idDocente)
    {
        return Grupo::with([
                            'grado:id,nb_grado'
                        ])
                        ->select('grupo.id', 'nb_grupo', 'id_grado')
                        ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                            $query->where('id_docente', $idDocente);
                        })
                        ->has('calendarioActivo')
                        ->get();
    }

    public function grupoAlumnosDocente($idDocente)
    {
        return Grupo::with([
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento',
                            'alumno.foto:id,tx_src,id_tipo_foto,id_origen',
                            'alumno.foto.tipoFoto:id,tx_base_path',
                            'alumno.usuarioAlumno:id,nb_usuario,id_origen'
                          ])
                    ->select('grupo.id', 'nb_grupo')
                    ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                        $query->where('id_docente', $idDocente);
                    })
                    ->has('calendarioActivo')
                    ->get();
    }


    public function grupoGrado($idGrado)
    {
        return Grupo::select('id', 'nb_grupo')
                    ->where('id_grado', $idGrado)
                    ->where('id_status', 1)
                    ->has('calendarioActivo')
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

        $materias  = $this->storeGrupoMateria($grupo);

        return [ 'msj' => 'Grupo Agregado Correctamente', compact('grupo', 'materias') ];
    }

    public function storeGrupoMateria($grupo)
    {
        $materias  = GradoMateria::select('id_materia')->where('id_grado', $grupo->id_grado)->get();

        $storeMaterias = [];

        foreach ($materias as $materia) {
           
            $storeMaterias[] =  [
                                'id_grupo'   => $grupo->id,
                                'id_materia' => $materia->id_materia,
                                'id_status'  => 1,
                                'id_usuario' => $grupo->id_usuario,
                                ];
        }

        return GrupoMateria::insert($storeMaterias);
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
        if( count($grupo->planEvaluacion) > 0 )
        {
            throw ValidationException::withMessages(['poseePlanEvaluacion' => "Posee Plan(es) de Evaluacion asociada(s)"]);
        }

        if( count($grupo->horario) > 0 )
        {
            throw ValidationException::withMessages(['poseeHorario' => "Posee Horario(s) asociado(s)"]);
        }

        if( count($grupo->materia) > 0 )
        {
            throw ValidationException::withMessages(['poseeMateria' => "Posee Materia(s) asociada(s)"]);
        }
        
        $grupo = $grupo->delete();
 
        return [ 'msj' => 'Grupo Eliminado' , compact('grupo')];
    }
}
