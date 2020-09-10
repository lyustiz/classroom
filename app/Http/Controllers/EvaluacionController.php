<?php

namespace App\Http\Controllers;

use App\Models\Evaluacion;
use App\Models\EvaluacionAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class EvaluacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $evaluacion = Evaluacion::with([])
                    ->get();
        
        return $evaluacion;
    }

    public function evaluacionPlan($idPlanEvaluacion)
    {
        $planEvaluacion = Evaluacion::with([
                                            'planEvaluacion',
                                            'planEvaluacion.grupo:id,nb_grupo', 
                                            'planEvaluacion.periodo:id,nb_periodo', 
                                            'tipoEvaluacion:id,nb_tipo_evaluacion',
                                            'archivo:id,id_tipo_archivo,tx_origen_id,created_at',
                                            'status:status.id,nb_status,tx_icono,tx_color',
                                            'evaluacionMetodo:id,nb_evaluacion_metodo,tx_icono,tx_color'
                                        ])
                                        ->where('id_plan_evaluacion', $idPlanEvaluacion)
                                        ->get();
        
        return $planEvaluacion;
    }

    public function evaluacionGrupo($idGrupo)
    {
        $evaluaciones = Evaluacion:: with([
                                            'tipoEvaluacion:id,nb_tipo_evaluacion',
                                            'planEvaluacion:id,id_materia',
                                            'planEvaluacion.materia:id,nb_materia,id_area_estudio',
                                            'planEvaluacion.materia.areaEstudio:id,tx_color'
                                    ])
                                    ->whereHas('planEvaluacion', function (Builder $query) use($idGrupo) {
                                        $query->where('id_grupo', $idGrupo)->where('id_status', 1);
                                    })
                                    ->get();

        return $evaluaciones;
    }

    public function evaluacionMateriaGrupo($idMateria, $idGrupo)
    {
        return Evaluacion::comboData()
                        ->whereHas('planEvaluacion', function (Builder $query) use($idMateria, $idGrupo) {
                            $query->where('id_materia', $idMateria)
                                    ->where('id_grupo', $idGrupo)
                                    ->activo();
                        })
                        ->get();

    }

    public function evaluacionMateriaGrupoPrueba($idMateria, $idGrupo)
    {
        return Evaluacion::comboData()
                        ->whereHas('planEvaluacion', function (Builder $query) use($idMateria, $idGrupo) {
                            $query->where('id_materia', $idMateria)
                                    ->where('id_grupo', $idGrupo)
                                    ->activo();
                        })
                        ->where('id_evaluacion_metodo', 1)
                        ->get();

    }

    public function evaluacionDocente($idDocente)
    {
        $evaluaciones = Evaluacion:: with([
                                            'tipoEvaluacion:id,nb_tipo_evaluacion',
                                            'planEvaluacion:id,id_materia,id_grupo',
                                            'planEvaluacion.materia:id,nb_materia,id_area_estudio',
                                            'planEvaluacion.materia.areaEstudio:id,tx_color',
                                            'planEvaluacion.grupo:id,nb_grupo'
                                    ])
                                    ->whereHas('planEvaluacion.grupo.docente', function (Builder $query) use($idDocente) {
                                        $query->where('id_docente', $idDocente);
                                    })
                                    ->get();

        return $evaluaciones;
    }

    public function evaluacionEvaluacionAlumno($idEvaluacion)
    {
        return Evaluacion:: with([
                                    'evaluacionAlumno',
                                    'evaluacionAlumno.alumno',
                                    'evaluacionAlumno.archivo',
                                ])
                                ->find($idEvaluacion);

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
            'id_plan_evaluacion'=> 	'required|integer|max:999999999',
			'id_tipo_evaluacion'=> 	'required|integer|max:999999999',
			'nu_peso'           => 	'nullable|integer|max:999999999',
			'fe_planificada'    => 	'nullable|date',
			'tx_tema'           => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge( ['id_status' => 9] );

        $evaluacion = evaluacion::create($request->all());

        return [ 'msj' => 'Evaluacion Agregada Correctamente', compact('evaluacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Evaluacion  $evaluacion
     * @return \Illuminate\Http\Response
     */
    public function show(Evaluacion $evaluacion)
    {
        return $evaluacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Evaluacion  $evaluacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Evaluacion $evaluacion)
    {
        $validate = request()->validate([
            'id_plan_evaluacion'=> 	'required|integer|max:999999999',
			'id_tipo_evaluacion'=> 	'required|integer|max:999999999',
			'nu_peso'           => 	'nullable|integer|max:999999999',
			'fe_planificada'    => 	'nullable|date',
			'tx_tema'           => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacion = $evaluacion->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('evaluacion')];
    }

    public function asignar(Request $request, Evaluacion $evaluacion)
    {       
        $validate = request()->validate([
            'id_evaluacion_metodo'  =>  'required|integer|max:999999999',
            'fe_evaluacion'         =>  'required|date|after_or_equal:fe_planificada',
            'hh_inicio'             => 	'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'                => 	'nullable|date_format:"H:i"',
			'tx_observaciones'      =>  'nullable|string|max:100',
			'id_usuario'            =>  'required|integer|max:999999999',
        ]);

        $request->merge( ['id_status' => $evaluacion->asignada()] );

        $evaluacionAlumnos = $this->asignarEvaluacionAlumnos($evaluacion);

        $evaluacion = $evaluacion->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('evaluacion','evaluacionAlumnos')];
    }

    public function asignarEvaluacionAlumnos($evaluacion)
    {
        if(count($evaluacion->evaluacionAlumno) < 1)
        {
            $alumnos =  $evaluacion->planEvaluacion->grupo->alumno;

            $evaluacionAlumnos = [];

            foreach ($alumnos as $key => $alumno) 
            {
                $evaluacionAlumnos[] = [
                                        'id_evaluacion' => $evaluacion->id,
                                        'id_alumno'     => $alumno->id,
                                        'id_usuario'    => $evaluacion->id_usuario,
                                        'id_status'     => 1,
                                    ];
            }

            return EvaluacionAlumno::insert($evaluacionAlumnos);
        }
        return false;
    }

    public function evaluar(Request $request, Evaluacion $evaluacion)
    {
        $validate = request()->validate([
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge( ['id_status' => $evaluacion->evaluada()] );

        $evaluacion = $evaluacion->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('evaluacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Evaluacion  $evaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Evaluacion $evaluacion)
    {
        $evaluacion = $evaluacion->delete();
 
        return [ 'msj' => 'Evaluacion Eliminada' , compact('evaluacion')];
    }
}
