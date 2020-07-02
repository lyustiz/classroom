<?php

namespace App\Http\Controllers;

use App\Models\PlanDetalle;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PlanDetalleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $planDetalle = PlanDetalle::with([])
                    ->get();
        
        return $planDetalle;
    }

    public function detallePlanEvaluacion($idPlanEvaluacion)
    {
        $planEvaluacion = PlanDetalle::with([
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

        $planDetalle = planDetalle::create($request->all());

        return [ 'msj' => 'Evaluacion Agregada Correctamente', compact('planDetalle') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PlanDetalle  $planDetalle
     * @return \Illuminate\Http\Response
     */
    public function show(PlanDetalle $planDetalle)
    {
        return $planDetalle;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlanDetalle  $planDetalle
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PlanDetalle $planDetalle)
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

        $planDetalle = $planDetalle->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('planDetalle')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PlanDetalle  $planDetalle
     * @return \Illuminate\Http\Response
     */
    public function destroy(PlanDetalle $planDetalle)
    {
        $planDetalle = $planDetalle->delete();
 
        return [ 'msj' => 'Evaluacion Eliminada' , compact('planDetalle')];
    }
}
