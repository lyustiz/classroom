<?php

namespace App\Http\Controllers;

use App\Models\PlanTema;
use App\Models\Tema;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class PlanTemaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return PlanTema::with([])
                    ->get();
    }

    public function planTemaGrupoMateria($idPlanEvaluacion, $idGrupo, $idMateria)
    {
        $temasAsignados =  PlanTema::with([
                                'tema',
                            ])
                            ->where('id_plan_evaluacion',$idPlanEvaluacion)
                            ->where('id_grupo',$idGrupo)
                            ->get();

        $temasAsignar =   Tema::whereHas('grado.grupo', function (Builder $query) use($idGrupo) {
                                $query->where('id', $idGrupo)->activo();
                            })
                            ->where('id_materia', $idMateria)
                            ->get();

        return compact('temasAsignados','temasAsignar');
    }

    public function planTemaPlanEvaluacion($idPlanEvaluacion)
    {
        return PlanTema::with([
                                'tema',
                                'detallePlan',
                                'detallePlan.tema'
                            ])
                            ->where('id_plan',$idPlanEvaluacion)
                            ->get();
    }

    public function planTemadetallePlan($idDetallePlan)
    {
        return PlanTema::with([
                                'tema',
                            ])
                            ->where('id_plan_detalle',$idDetallePlan)
                            ->get();
    }

    public function planTemaPlanEvaluacionAsignar($idPlanEvaluacion)
    {
        return PlanTema::with([
                                'tema',
                                'detallePlan',
                                'detallePlan.tema'
                            ])
                            ->where('id_plan',$idPlanEvaluacion)
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
            'id_plan_evaluacion'=> 	'required|integer|max:999999999',
			'id_plan_detalle'   => 	'required|integer|max:999999999',
			'id_tema'           => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planTema = planTema::create($request->all());

        return [ 'msj' => 'PlanTema Agregado Correctamente', compact('planTema') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PlanTema  $planTema
     * @return \Illuminate\Http\Response
     */
    public function show(PlanTema $planTema)
    {
        return $planTema;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlanTema  $planTema
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PlanTema $planTema)
    {
        $validate = request()->validate([
            'id_plan_evaluacion'=> 	'required|integer|max:999999999',
			'id_plan_detalle'   => 	'required|integer|max:999999999',
			'id_tema'           => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planTema = $planTema->update($request->all());

        return [ 'msj' => 'PlanTema Editado' , compact('planTema')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PlanTema  $planTema
     * @return \Illuminate\Http\Response
     */
    public function destroy(PlanTema $planTema)
    {
        $planTema = $planTema->delete();
 
        return [ 'msj' => 'PlanTema Eliminado' , compact('planTema')];
    }
}
