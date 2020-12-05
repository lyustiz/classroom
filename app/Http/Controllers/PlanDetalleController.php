<?php

namespace App\Http\Controllers;

use App\Models\PlanDetalle;
use App\Models\TipoEvaluacion;
use App\Models\TipoAsignacion;
use App\Models\Rasgo;
use App\Models\PlanTema;


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

    public function combos()
    {
        $tipoEvaluacion = TipoEvaluacion::comboData()->activo()->get(); 

        $tipoAsignacion = TipoAsignacion::comboData()->activo()->get(); 

        $rasgo = Rasgo::comboData()->activo()->get(); 

        return compact('tipoEvaluacion', 'tipoAsignacion', 'rasgo');
    }


    public function planDetallePlanEvaluacion($idPlanEvaluacion)
    {
        $planDetalle = PlanDetalle::with([
                                            'origen',
                                        ])
                                        ->where('id_plan_evaluacion', $idPlanEvaluacion)
                                        ->get();
        
        return ['planDetalle' => $planDetalle, 'combos' => $this->combos()];
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

    public function updatePlanesDetalle(Request $request, $idPlanEvaluacion, $idGrupo)
    {
        $validate = request()->validate([
            'detalles'      => 	'required|array',
			'temas'         => 	'required|array',
			'id_usuario'    => 	'required|integer|max:999999999',
        ]);

        $planDetalles = PlanDetalle::where('id_plan_evaluacion', $idPlanEvaluacion)->get();

        foreach ($planDetalles as $planDetalle) {

            $dataUpdate = $this->getDataUpdate($planDetalle->id, $request->detalles);
            $planDetalle->nu_peso = $dataUpdate['nu_peso'];
            $planDetalle->save();
        }

        $temas = $this->updateTema($idPlanEvaluacion, $request->temas, $request->id_usuario, $idGrupo);

        return [ 'msj' => 'Plan Actualizado' , compact('planDetalles', 'temas')];
    }

    public function getDataUpdate($idPlanDetalle, $dataUpdate)
    {
        foreach ($dataUpdate as $data) {
            if($data['id'] == $idPlanDetalle) return $data;
        }
    }

    public function updateTema($idPlanEvaluacion, $temas, $idUsuario, $idGrupo)
    {
        $delete   = PlanTema::where('id_plan_evaluacion',$idPlanEvaluacion)->delete();
        $planTema = [];
        
        foreach ($temas as $tema) {
            $planTema[] = [
                'id_plan_evaluacion' => $idPlanEvaluacion,
                'id_grupo'           => $idGrupo,
                'id_tema'            => $tema,
                'id_status'          => 1,
                'id_usuario'         => $idUsuario
            ];
        }

        return PlanTema::insert($planTema);
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
