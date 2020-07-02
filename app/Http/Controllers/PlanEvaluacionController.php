<?php

namespace App\Http\Controllers;

use App\Models\PlanEvaluacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
                                        'grupo:id,nb_grupo', 
                                        'periodo:id,nb_periodo', 
                                        'materia:id,nb_materia',
                                        'planDetalle'
                                    ])
                                    ->get();
 
    }

    public function planEvaluacionGrupoPeriodo($idGrupo, $idPeriodo)
    {
        return PlanEvaluacion::with([
                                        'grupo:id,nb_grupo', 
                                        'periodo:id,nb_periodo', 
                                        'materia:id,nb_materia',
                                        'planDetalle'
                                    ])
                                    ->where('id_grupo', $idGrupo)
                                    ->where('id_periodo', $idPeriodo)
                                    ->get();
    }

    public function planEvaluacionGrupoPeriodoMateria($idGrupo, $idPeriodo, $idMateria)
    {
        return PlanEvaluacion::with([
                                    'planDetalle:id,id_tipo_evaluacion,id_plan_evaluacion,nu_peso,fe_evaluacion,tx_tema,tx_observaciones,id_status',
                                    'planDetalle.tipoEvaluacion:id,nb_tipo_evaluacion',
                                    'planDetalle.evaluacion',
                                    'planDetalle.archivo'
                                ])
                                ->select('id', 'id_status')
                                ->where('id_grupo', $idGrupo)
                                ->where('id_periodo', $idPeriodo)
                                ->where('id_materia', $idMateria)
                                ->where('id_status', 1)
                                ->first();
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
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planEvaluacion = planEvaluacion::create($request->all());

        return [ 'msj' => 'Plan Evaluacion Agregado Correctamente', compact('planEvaluacion') ];
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
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planEvaluacion = $planEvaluacion->update($request->all());

        return [ 'msj' => 'Plan  Evaluacion Actualizado' , compact('planEvaluacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PlanEvaluacion  $planEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(PlanEvaluacion $planEvaluacion)
    {
        $planEvaluacion = $planEvaluacion->delete();
 
        return [ 'msj' => 'PlanEvaluacion Eliminado' , compact('planEvaluacion')];
    }
}
