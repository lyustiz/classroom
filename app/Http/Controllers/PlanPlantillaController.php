<?php

namespace App\Http\Controllers;

use App\Models\PlanPlantilla;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PlanPlantillaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return PlanPlantilla::with([])
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
            'tx_origen'         => 	'nullable|string|max:50',
			'id_origen'         => 	'nullable|integer|max:999999999',
			'nu_peso'           => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planPlantilla = planPlantilla::create($request->all());

        return [ 'msj' => 'PlanPlantilla Agregado Correctamente', compact('planPlantilla') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PlanPlantilla  $planPlantilla
     * @return \Illuminate\Http\Response
     */
    public function show(PlanPlantilla $planPlantilla)
    {
        return $planPlantilla;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlanPlantilla  $planPlantilla
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PlanPlantilla $planPlantilla)
    {
        $validate = request()->validate([
            'tx_origen'         => 	'nullable|string|max:50',
			'id_origen'         => 	'nullable|integer|max:999999999',
			'nu_peso'           => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planPlantilla = $planPlantilla->update($request->all());

        return [ 'msj' => 'PlanPlantilla Editado' , compact('planPlantilla')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PlanPlantilla  $planPlantilla
     * @return \Illuminate\Http\Response
     */
    public function destroy(PlanPlantilla $planPlantilla)
    {
        $planPlantilla = $planPlantilla->delete();
 
        return [ 'msj' => 'PlanPlantilla Eliminado' , compact('planPlantilla')];
    }
}
