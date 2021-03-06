<?php

namespace App\Http\Controllers;

use App\Models\Grado;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;

class GradoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grado = Grado::with([
                                'nivel:nivel.id,nb_nivel', 
                                'materia:materia.id,nb_materia', 
                                'grupo:grupo.id,nb_grupo,id_grado'
                            ])
                        ->get();
        
        return $grado;
    }

    public function list()
    {
        return Grado::select('id', 'nb_grado', 'nu_grado')
                    ->orderBy('id_nivel', 'asc')
                    ->orderBy('nu_grado', 'asc')
                    ->activo()
                    ->get();
    }

    public function gradoMateriaAlumno()
    {
        return Grado::with([
                        'grupo:grupo.id,nb_grupo,id_grado', 
                        'grupo.alumno' => function ($query) {
                            $query->select('alumno.id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2','tx_documento')
                            ->orderBy('nb_apellido', 'asc' );
                        },  
                        'grupo.materia:materia.id,nb_materia',
                        'grupo.alumno.alumnoMateria:alumno_materia.id,id_materia,id_alumno',
                        'grupo.alumno.matricula:matricula.id,id_alumno,id_tipo_condicion'
                        ])
                        ->get();
    }

    public function gradoPlanEvaluacion()
    {
        return Grado::with([
                        'grupo:grupo.id,nb_grupo,id_grado', 
                        'grupo.planEvaluacion:id,id_grupo,id_materia,id_periodo,id_docente,id_status', 
                        'grupo.planEvaluacion.docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2', 
                        'materia:materia.id,nb_materia',
                        'materia.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',                            
                        ])
                        ->get();
    }

    public function gradoPlanEvaluacionDocente($idDocente)
    {
        return Grado::with([
                        'grupo' => function ($query) use($idDocente) {
                            $query->select('grupo.id','nb_grupo','id_grado')
                            ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('id_docente', $idDocente);
                            });
                        }, 
                        'grupo.planEvaluacion' => function ($query) use($idDocente) {
                            $query->select('plan_evaluacion.id','id_grupo','id_materia','id_periodo','id_docente','id_status')
                                  ->where('id_docente', $idDocente)
                                  ->has('periodoActivo');
                        }, 
                        'grupo.planEvaluacion.materia'=> function ($query) use($idDocente) {
                            $query->select('materia.id','nb_materia')
                            ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('id_docente', $idDocente);
                            });
                        }, 
                        ])
                ->whereHas('grupo.planEvaluacion', function (Builder $query) use($idDocente) {
                    $query->where('id_docente', $idDocente);
                })
                ->get();
    }

    public function gradoPlanEvaluacionDocentePeriodo($idDocente, $idPeriodo)
    {
        return Grado::with([
                        'grupo:grupo.id,nb_grupo,id_grado', 
                        'grupo.planEvaluacion' => function ($query) use($idDocente,$idPeriodo) {
                            $query->select('id','id_grupo','id_materia','id_periodo','id_docente','id_status')
                                  ->where('id_periodo', $idPeriodo)
                                  ->where('id_docente', $idDocente);
                        }, 
                        'grupo.planEvaluacion.materia:id,nb_materia',
                        'materia.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',                            
                        ])
                ->get();
    }

    public function gradoGrupoDocente($idDocente)
    {        
        return Grado::with([
                                'grupo' => function ($query) use($idDocente) {
                                    $query->select('grupo.id', 'nb_grupo', 'id_grado')
                                    ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                                        $query->where('plan_evaluacion.id_docente', $idDocente)
                                              ->has('periodoActivo');
                                    });
                                },     
                                   
                            ])
                            ->whereHas('grupo.planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('plan_evaluacion.id_docente', $idDocente)
                                      ->has('periodoActivo');
                            })
                            ->get();
    }

    public function gradoGrupoMateriaAlumnoDocente($idDocente)
    {        
        return Grado::with([
                                'grupo' => function ($query) use($idDocente) {
                                    $query->select('grupo.id', 'nb_grupo', 'id_grado')
                                    ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                                        $query->where('plan_evaluacion.id_docente', $idDocente)
                                              ->has('periodoActivo');
                                    });
                                }, 
                                'grupo.materia' => function ($query) use($idDocente) {
                                    $query->select('materia.id', 'nb_materia')
                                    ->whereHas('docente', function (Builder $query) use($idDocente) {
                                        $query->where('docente.id', $idDocente);
                                    });
                                },   

                                'grupo.alumno',
                                'grupo.alumno.foto',
                            
                            ])
                            ->whereHas('grupo.planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('plan_evaluacion.id_docente', $idDocente)
                                      ->has('periodoActivo');
                            })
                            ->get();
    }

    public function gradoMateriaDocente($idDocente)
    {
        return Grado::with([
                                'materia' => function ($query) use($idDocente) {
                                    $query->select('materia.id', 'nb_materia')
                                    ->whereHas('docente', function (Builder $query) use($idDocente) {
                                        $query->where('docente.id', $idDocente);
                                    });
                                },                           
                            ])
                            ->select('grado.id', 'nb_grado')
                            ->whereHas('grupo.planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('id_docente', $idDocente)
                                ->has('periodoActivo');
                            })
                            ->get();
    }


    public function grupoGrado($idGrado)
    {
        return Grado::select('id', 'nb_grado')
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
            'nb_grado'          => 	'required|string|max:30',
			'nu_grado'          => 	'required|integer|max:99',
			'id_nivel'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grado = grado::create($request->all());

        return [ 'msj' => 'Grado Agregado Correctamente', compact('grado') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function show(Grado $grado)
    {
        return $grado;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grado $grado)
    {
        $validate = request()->validate([
            'nb_grado'          => 	'required|string|max:30',
			'nu_grado'          => 	'required|integer|max:999999999',
			'id_nivel'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grado = $grado->update($request->all());

        return [ 'msj' => 'Grado Editado' , compact('grado')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Grado $grado)
    {
        if( count($grado->grupo) > 0 )
        {
            throw ValidationException::withMessages(['poseeGrupo' => "Posee Grupo(s) asociado(s)"]);
        }

        if( count($grado->materia) > 0 )
        {
            throw ValidationException::withMessages(['poseeMateria' => "Posee Materia(s) asociada(s)"]);
        }
        
        $grado = $grado->delete();
 
        return [ 'msj' => 'Grado Eliminado' , compact('grado')];
    }
}
