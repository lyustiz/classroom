<?php

namespace App\Http\Controllers;

use App\Models\Evaluacion;
use App\Models\EvaluacionAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;
use App\Http\Controllers\Traits\NotificacionTrait;

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
        return Evaluacion::with([
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
    }

    public function evaluacionGrupo($idGrupo)
    {
        return Evaluacion::with([
                                'tipoEvaluacion:id,nb_tipo_evaluacion',
                                'materia:id,nb_materia',
                                'origen',
                        ])
                        ->where('id_grupo',$idGrupo)
                        ->get();
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
        return Evaluacion::with([
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
            'id_tipo_evaluacion' => 'required|integer|max:999999999',
            'id_grupo'           => 'required|integer|max:999999999',
            'id_materia'         => 'required|integer|max:999999999',
            'id_tema'            => 'required|integer|max:999999999',
            'tx_origen'          => 'required|string|max:30',
            'id_origen'          => 'required|integer|max:999999999',
            'nu_peso'            => 'nullable|integer|max:999999999',
            'fe_inicio'          => 'required|date|before_or_equal:fe_fin',
		    'fe_fin'             => 'required|date',
            'hh_inicio'          => 'required|date_format:"H:i"',
            'hh_fin'             => 'required|date_format:"H:i"',
            'nu_minutos'         => 'required|integer|max:999999999',
            'tx_observaciones'   => 'nullable|string|max:999999999',
            'id_status'          => 'required|integer|max:999999999',
            'id_usuario'         => 'required|integer|max:999999999',
            'alumnos'            => 'required|array'
        ]);

        $evaluacion = evaluacion::create($request->all());

        $evaluacionAlumno = $this->asignarEvaluacionAlumnos($evaluacion, $request->alumnos);

        $notificacion = NotificacionTrait::evaluacion([ 
            'id_tipo_evaluacion' => $request->id_tipo_evaluacion, 
            'alumnos'            => $request->alumnos,
            'id_materia'         => $request->id_materia,
            'fe_inicio'          => $request->fe_inicio,
            'id_usuario'         => $request->id_usuario 
        ]);
        
        return [ 'msj' => 'Evaluacion Agregada Correctamente', compact('evaluacion', 'evaluacionAlumno', 'notificacion') ]; 
    }

    public function asignarEvaluacionAlumnos(Evaluacion $evaluacion, $alumnos)
    {
        $evaluacionAlumnos = [];

        foreach ($alumnos as $idAlumno) 
        {
            $evaluacionAlumnos[] = [
                                    'id_evaluacion' => $evaluacion->id,
                                    'id_alumno'     => $idAlumno,
                                    'id_usuario'    => $evaluacion->id_usuario,
                                    'id_status'     => 3,
                                    'created_at'    => date('Y-m-d H:i:s'),
                                ];
        }

        return EvaluacionAlumno::insert($evaluacionAlumnos);
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

    public function cerrar(Request $request, Evaluacion $evaluacion)
    {
        $validate = request()->validate([
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacionesPendientes = EvaluacionAlumno::whereNull('id_calificacion')
                                                   ->where('id_evaluacion', $evaluacion->id)
                                                   ->count();

        if($evaluacionesPendientes > 0)
        {
            throw ValidationException::withMessages(['EvalPendientes' => "Existe(n) $evaluacionesPendientes evaluciones(s) pendientes"]);
        }

        $request->merge( ['id_status' => $evaluacion->evaluada()] );

        $evaluacion = $evaluacion->update($request->all());

        return [ 'msj' => 'Evaluacion Cerrada' , compact('evaluacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Evaluacion  $evaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Evaluacion $evaluacion)
    {
        $evaluacionAlumno = EvaluacionAlumno::where('id_evaluacion', $evaluacion->id)->delete();
        
        $delete = $evaluacion->delete();
 
        return [ 'msj' => 'Evaluacion Eliminada' , compact('delete', 'evaluacionAlumno')];
    }
}
