<?php

namespace App\Http\Controllers;

use App\Models\Evaluacion;
use App\Models\PlanDetalle;
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

    public function evaluacionGrupo($idGrupo)
    {
        $evaluaciones = PlanDetalle:: with([
                                            'evaluacion', 
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = request()->validate([
            'id_plan_detalle'  =>  'required|integer|max:999999999',
			'fe_evaluacion'    =>  'required|string|max:0',
			'hh_inicio'        =>  'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'           =>  'required|date_format:"H:i"',
			'nu_peso'          =>  'required|integer|max:999999999',
			'tx_observaciones' =>  'nullable|string|max:100',
			'id_status'        =>  'required|integer|max:999999999',
			'id_usuario'       =>  'required|integer|max:999999999',
        ]);

        $evaluacion = evaluacion::create($request->all());

        return [ 'msj' => 'Evaluacion Agregado Correctamente', compact('evaluacion') ];
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
            'id_plan_detalle'  => 'required|integer|max:999999999',
			'fe_evaluacion'    => 'required|string|max:0',
            'hh_inicio'        => 'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'           => 'required|date_format:"H:i"',
			'nu_peso'          => 'required|integer|max:999999999',
			'tx_observaciones' => 'nullable|string|max:100',
			'id_status'        => 'required|integer|max:999999999',
			'id_usuario'       => 'required|integer|max:999999999',
        ]);

        $evaluacion = $evaluacion->update($request->all());

        return [ 'msj' => 'Evaluacion Editado' , compact('evaluacion')];
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
 
        return [ 'msj' => 'Evaluacion Eliminado' , compact('evaluacion')];
    }
}
