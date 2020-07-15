<?php

namespace App\Http\Controllers;

use App\Models\Evaluacion;
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
                                            'archivo:id,id_tipo_archivo,tx_origen_id'
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
			'fe_evaluacion'     => 	'nullable|date',
			'tx_tema'           => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

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
			'fe_evaluacion'     => 	'nullable|date',
			'tx_tema'           => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

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
