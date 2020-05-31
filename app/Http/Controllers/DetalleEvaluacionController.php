<?php

namespace App\Http\Controllers;

use App\Models\DetalleEvaluacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class DetalleEvaluacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $detalleEvaluacion = DetalleEvaluacion::with([])
                    ->get();
        
        return $detalleEvaluacion;
    }

    public function detallePlanEvaluacion($idPlanEvaluacion)
    {
        $planEvaluacion = DetalleEvaluacion::with([
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
			'nu_peso'           => 	'required|integer|max:999999999',
			'fe_evaluacion'     => 	'nullable|date',
			'tx_tema'           => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $detalleEvaluacion = detalleEvaluacion::create($request->all());

        return [ 'msj' => 'Evaluacion Agregada Correctamente', compact('detalleEvaluacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DetalleEvaluacion  $detalleEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function show(DetalleEvaluacion $detalleEvaluacion)
    {
        return $detalleEvaluacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DetalleEvaluacion  $detalleEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DetalleEvaluacion $detalleEvaluacion)
    {
        $validate = request()->validate([
            'id_plan_evaluacion'=> 	'required|integer|max:999999999',
            'id_tipo_evaluacion'=> 	'required|integer|max:999999999',
			'nu_peso'           => 	'required|integer|max:999999999',
			'fe_evaluacion'     => 	'nullable|date',
			'tx_tema'           => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $detalleEvaluacion = $detalleEvaluacion->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('detalleEvaluacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DetalleEvaluacion  $detalleEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(DetalleEvaluacion $detalleEvaluacion)
    {
        $detalleEvaluacion = $detalleEvaluacion->delete();
 
        return [ 'msj' => 'Evaluacion Eliminada' , compact('detalleEvaluacion')];
    }
}
