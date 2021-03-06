<?php

namespace App\Http\Controllers;
use App\Models\PlanEvaluacion;
use App\Models\PlanDetalle;
use App\Models\PlanPlantilla;
use App\Models\Calificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;

class PlanEvaluacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return PlanEvaluacion::with([
                                        'docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                        'grupo:id,nb_grupo', 
                                        'periodo:id,nb_periodo', 
                                        'materia:id,nb_materia',
                                        'evaluacion'
                                    ])
                                    ->get();
    }

    public function planEvaluacionGrupoPeriodo($idGrupo, $idPeriodo)
    {
        return PlanEvaluacion::with([
                                        'docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                        'grupo:id,nb_grupo', 
                                        'periodo:id,nb_periodo', 
                                        'materia:id,nb_materia',
                                        'evaluacion'
                                    ])
                                    ->where('id_grupo', $idGrupo)
                                    ->where('id_periodo', $idPeriodo)
                                    ->get();
    }

    public function planEvaluacionGrupoPeriodoMateria($idGrupo, $idPeriodo, $idMateria)
    {
        return PlanEvaluacion::with([
                                    'evaluacion:id,id_tipo_evaluacion,id_plan_evaluacion,nu_peso,fe_planificada,fe_evaluacion,tx_tema,tx_observaciones,id_status',
                                    'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion',
                                    'evaluacion.status:status.id,nb_status,tx_icono,tx_color',
                                    'evaluacion.archivo'
                                ])
                                ->select('id', 'id_status')
                                ->where('id_grupo', $idGrupo)
                                ->where('id_periodo', $idPeriodo)
                                ->where('id_materia', $idMateria)
                                ->where('id_status', 1)
                                ->first();
    }

    public function planEvaluacionDocentePeriodo($idDocente, $idPeriodo)
    {
        
        
        return PlanEvaluacion::with([
                                    'grupo.alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento',
                                ])
                                ->select(   'plan_evaluacion.id_grupo',
                                            'plan_evaluacion.id_periodo',
                                            'plan_evaluacion.id_materia',
                                            'plan_evaluacion.id_docente',
                                            'plan_evaluacion.id_status',
                                            'materia.nb_materia',
                                            'grupo.nb_grupo'
                                        )
                                ->join('materia', 'materia.id', '=', 'id_materia' )
                                ->join('grupo', 'grupo.id', '=', 'id_grupo' )
                                ->where('plan_evaluacion.id_docente', $idDocente)
                                ->where('plan_evaluacion.id_periodo', $idPeriodo)
                                ->orderBy('nb_grupo', 'asc')
                                ->orderBy('nb_materia', 'asc')
                                ->get();
    }

    public function planEvaluacionAlumno($idAlumno)
    {
    
        return PlanEvaluacion::with([
                                    'materia:id,nb_materia',
                                    'evaluacion',
                                    'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion',
                                    'evaluacion.archivo',
                                    'evaluacion.evaluacionAlumno'
                                ])
                                ->select(   'plan_evaluacion.id',
                                            'plan_evaluacion.id_grupo',
                                            'plan_evaluacion.id_periodo',
                                            'plan_evaluacion.id_materia',
                                            'plan_evaluacion.id_docente',
                                            'plan_evaluacion.id_status',
                                        )
                                ->has('periodoActivo')
                                ->whereHas('grupo.alumno', function (Builder $query) use($idAlumno) {
                                    $query->where('alumno.id', $idAlumno);
                                })   
                                ->whereHas('materia.alumno', function (Builder $query) use($idAlumno) {
                                    $query->where('alumno.id', $idAlumno);
                                })                                
                                ->get();
    }


   /*  public function PlanEvaluacionCalificacionAlumno($idAlumno)
    {
        $planEvaluacion =   PlanEvaluacion::with([
                                        'materia',
                                        'evaluacion.evaluacionAlumno'=> function($query) use ( $idAlumno ){
                                            $query->where('id_alumno', $idAlumno);
                                        },
                                        'evaluacion.evaluacionAlumno.calificacion',
                                    ])
                                    ->whereHas('grupo.alumno', function ($query) use ($idAlumno) {
                                        $query->where('alumno.id', $idAlumno);
                                    })
                                    ->whereHas('materia.alumno', function ($query) use ($idAlumno) {
                                        $query->where('alumno.id', $idAlumno);
                                    })
                                    ->has('periodoActivo')
                                    ->activo()
                                    ->get();

        $calificaciones = $this->calcularCalificaciones($planEvaluacion);

        return [ 'calificaciones' => $calificaciones, 'planEvaluacion' => $planEvaluacion ];
    } */

    public function calcularCalificaciones($planEvaluacion)
    {
        $calificaciones = Calificacion::with(['nivelCalificacion:id,nb_nivel_calificacion'])->get();
                                 
        $calificacion = [];

        foreach ($planEvaluacion as $key => $plan) {

            $materiaId = $plan->id_materia;
            $materia   = $plan->materia->nb_materia;
            
            $calificacion[$materiaId] = [
                                            'id_materia'      => $materiaId,
                                            'nb_materia'      => $materia,
                                            'nu_calificacion' => 0 , 
                                            'calificacion'    => [],
                                        ];

            foreach ($plan->evaluacion as $key => $evaluacion) {

                foreach ($evaluacion->evaluacionAlumno as $key => $evaluacionAlumno) {
                    $calificacion[$materiaId]['nu_calificacion'] += ($evaluacionAlumno->nu_calificacion != null) ? $evaluacionAlumno->nu_calificacion : 0;
                }    
            }

            $calificacion[$materiaId]['calificacion'] = $this->getTipoCalificacion($calificaciones, $calificacion[$materiaId]['nu_calificacion']);
        }

        return $calificacion;
    }

    public function getTipoCalificacion($nu_calificacion)
    {
        $nu_calificacion  = number_format(round( $nu_calificacion, 2, PHP_ROUND_HALF_UP), 0 , ',', ''); // fix 4.6 bug
        
        $calificacion     = Calificacion::with(['nivelCalificacion:id,nb_nivel_calificacion'])->where('nu_desde' ,'<=', $nu_calificacion )->where('nu_hasta' ,'>=', $nu_calificacion )->first();
        
        return $calificacion;
    }
    public function PlanEvaluacionCalificacionGrupo($idAlumno)
    {
      
        /* return  PlanEvaluacion::with([
                        'planEvaluacion' => function($query) use ( $idAlumno ){
                            $query->whereHas('grupo.alumno', function ($query) use ($idAlumno) {
                                $query->where('alumno.id', $idAlumno);
                            })->has('periodoActivo')
                            ->activo();
                        },
                        'planEvaluacion.evaluacion',
                        'planEvaluacion.evaluacion.evaluacionAlumno'=> function($query) use ( $idAlumno ){
                            $query->where('id_alumno', $idAlumno);
                        },
                        'planEvaluacion.evaluacion.evaluacionAlumno.calificacion',
                    ])
                    ->comboData()
                    ->whereHas('alumno', function ($query) use ($idAlumno) {
                        $query->where('alumno.id', $idAlumno);
                    }) 
                    ->has('planEvaluacion')
                    ->orderBY('nb_materia')
                    ->get(); */

    }


    public function PlanEvaluacionCalificacionAlumnoMateria($idAlumno, $idMateria)
    {
        $planEvaluacion =   PlanEvaluacion::with([
                                        'materia:id,nb_materia',
                                        'planDetalle.tipoEvaluacion',
                                        'planDetalle.evaluacion.origen',
                                        'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion',
                                        'planDetalle.evaluacion.evaluacionAlumno'=> function($query) use ( $idAlumno ){
                                            $query->where('id_alumno', $idAlumno);
                                        },
                                    ])
                                    ->whereHas('grupo.alumno', function ($query) use ($idAlumno) {
                                        $query->where('alumno.id', $idAlumno);
                                    })
                                    ->whereHas('materia.alumno', function ($query) use ($idAlumno) {
                                        $query->where('alumno.id', $idAlumno);
                                    })
                                    ->where('id_materia', $idMateria)
                                    ->has('periodoActivo')
                                    ->activo()
                                    ->get();

        $calificaciones = $this->calcularCalificacionAlumno($planEvaluacion);

        return [ 'calificaciones' => $calificaciones, 'planEvaluacion' => $planEvaluacion ];
    }

  
    public function PlanEvaluacionCalificacionAlumno($idAlumno)
    {
        $planEvaluacion =   PlanEvaluacion::with([
                                    'materia:id,nb_materia', 
                                    'planDetalle.tipoEvaluacion',
                                    'planDetalle.evaluacion.origen',
                                    'evaluacion.tipoEvaluacion',
                                    'planDetalle.evaluacion.evaluacionAlumno'=> function($query) use ( $idAlumno ){
                                        $query->where('id_alumno', $idAlumno);
                                    },
                            ])
                            ->whereHas('materia.alumno', function ($query) use ($idAlumno) {
                                $query->where('alumno.id', $idAlumno);
                            }) 
                            ->has('periodoActivo')
                            ->activo()
                            ->get();

        $calificaciones = $this->calcularCalificacionAlumno($planEvaluacion);

        return [ 'calificaciones' => $calificaciones, 'planEvaluacion' => $planEvaluacion ];
    }

    public function calcularCalificacionAlumno($planesEvaluacion)
    {
        //$calificaciones = Calificacion::with(['nivelCalificacion:id,nb_nivel_calificacion'])->where('id_grupo_calificacion', 1)->get();
                                 
        $calificacion = [];

        foreach ($planesEvaluacion as $key => $planEvaluacion) {

            $materiaId = $planEvaluacion->id_materia;

            $materia   = $planEvaluacion->materia->nb_materia;
            
            $calificacion[$materiaId] = [
                                            'id_materia'      => $materiaId,
                                            'nb_materia'      => $materia,
                                            'nu_calificacion' => 0 , 
                                            'calificacion'    => [],
                                        ];

            $notaMateria = 0;
           
            foreach ($planEvaluacion->evaluacion as $key => $evaluacion) {

                $promedioNota    = 0;
                $nroEvaluaciones = 0;
                $porcentajeEvaluacion = 0;
                $porcentaje      = $planEvaluacion->planDetalle->firstWhere('id_origen', $evaluacion->id_tipo_evaluacion)->nu_peso;

                foreach ($evaluacion->evaluacionAlumno as $key => $evaluacionAlumno) {

                   if($evaluacionAlumno->nu_calificacion != null and $evaluacionAlumno->id_status !=2)
                   {
                       $promedioNota += $evaluacionAlumno->nu_calificacion;
                       $nroEvaluaciones++;
                   }
                }  
                
                $promedioNota         =  ($nroEvaluaciones > 0)  ? $promedioNota / $nroEvaluaciones : 0;
                
                $porcentajeEvaluacion = $promedioNota * $porcentaje / 100;

                $notaMateria += $porcentajeEvaluacion;
            }

            $notaMateria    =  number_format(round( $notaMateria, 2, PHP_ROUND_HALF_UP), 2 , ',', ''); // fix 4.6 bug

            $calificacion[$materiaId]['nu_calificacion'] = $notaMateria;

            //TODO: single query
            $calificaciones = Calificacion::with(['nivelCalificacion:id,nb_nivel_calificacion'])->where('nu_desde' ,'<=', $notaMateria )->where('nu_hasta' ,'>=', $notaMateria )->first();
            
            $calificacion[$materiaId]['calificacion'] = $calificaciones;
        }

        return $calificacion;
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
            'id_periodo'        => 	'required|integer|max:999999999',
            'id_materia'        => 	'required|integer|max:999999999',
            'id_docente'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planEvaluacion = planEvaluacion::create($request->all());

        $planDetalle = $this->setPlanDetalle($planEvaluacion);

        return [ 'msj' => 'Plan de Evaluacion Agregada Correctamente', 'planEvaluacion'  => $planEvaluacion, 'planDetalle' => $planDetalle];
    }

    public function setPlanDetalle($planEvaluacion)
    {
        $exist       = $planEvaluacion->planDetalle;

        if(count($exist)>0)
        {
            return false;
        }

        $detalles    = PlanPlantilla::get();
        $planDetalle = [];

        foreach ($detalles as $detalle) {
            $planDetalle[] = [
                'id_plan_evaluacion'    => $planEvaluacion->id,
                'tx_origen'             => $detalle->tx_origen,
                'id_origen'             => $detalle->id_origen,
                'nu_peso'               => $detalle->nu_peso,
                'id_status'             => 1,
                'id_usuario'            => $planEvaluacion->id_usuario,
                'created_at'            => $planEvaluacion->created_at
            ];
        }
        return PlanDetalle::insert($planDetalle);
    }

    public function fixPlanDetalles()
    {
        $planesEvaluacion = PlanEvaluacion::with(['planDetalle'])->get();
        $plantilla        = PlanPlantilla::get();
        $planDetalles = [];

        foreach ($planesEvaluacion as $planEvaluacion) {
            if( count($planEvaluacion->planDetalle) < 1)
            {
                foreach ($plantilla  as $detalle) {
                    $planDetalles[] = [
                        'id_plan_evaluacion'    => $planEvaluacion->id,
                        'tx_origen'             => $detalle->tx_origen,
                        'id_origen'             => $detalle->id_origen,
                        'nu_peso'               => $detalle->nu_peso,
                        'id_status'             => 1,
                        'id_usuario'            => $planEvaluacion->id_usuario,
                        'created_at'            => $planEvaluacion->created_at
                    ];
                }
            }
        }

        return PlanDetalle::insert($planDetalles);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PlanEvaluacion  $planEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function show(PlanEvaluacion $planEvaluacion)
    {
        return $planEvaluacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlanEvaluacion  $planEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PlanEvaluacion $planEvaluacion)
    {
        $validate = request()->validate([
            'id_grupo'          => 	'required|integer|max:999999999',
            'id_periodo'        => 	'required|integer|max:999999999',
            'id_materia'        => 	'required|integer|max:999999999',
            'id_docente'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $update      = $planEvaluacion->update($request->all());

        $planDetalle = $this->setPlanDetalle($planEvaluacion);

        return [ 'msj' => 'Plan de Evaluacion Actualizado' , compact('update', 'planDetalle')];
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlanEvaluacion  $planEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function updateStatus(Request $request, PlanEvaluacion $planEvaluacion)
    {
        $validate = request()->validate([
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);
        
        $planEvaluacion = $planEvaluacion->update($validate);

        $status         = ($request->id_status == 1) ? 'Confirmado' : 'Inactivo';  

        return [ 'msj' => "Plan de Evaluacion $status" , 'update' => $planEvaluacion];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PlanEvaluacion  $planEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(PlanEvaluacion $planEvaluacion)
    {
        if( count($planEvaluacion->planDetalle) > 0 )
        {
            throw ValidationException::withMessages(['poseePlanDetalle' => "Posee Detalle(s) del Plan asociado(s)"]);
        }

        $planEvaluacion = $planEvaluacion->delete();
 
        return [ 'msj' => 'Plan de Evaluacion Eliminado' , compact('planEvaluacion')];
    }
}
