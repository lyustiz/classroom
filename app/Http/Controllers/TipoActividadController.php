<?php

namespace App\Http\Controllers;

use App\Models\TipoActividad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoActividadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoActividad = TipoActividad::with([])
                    ->get();
        
        return $tipoActividad;
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
            'nb_tipo_actividad' => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoActividad = tipoActividad::create($request->all());

        return [ 'msj' => 'TipoActividad Agregado Correctamente', compact('tipoActividad') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoActividad  $tipoActividad
     * @return \Illuminate\Http\Response
     */
    public function show(TipoActividad $tipoActividad)
    {
        return $tipoActividad;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoActividad  $tipoActividad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoActividad $tipoActividad)
    {
        $validate = request()->validate([
            'nb_tipo_actividad' => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoActividad = $tipoActividad->update($request->all());

        return [ 'msj' => 'TipoActividad Editado' , compact('tipoActividad')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoActividad  $tipoActividad
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoActividad $tipoActividad)
    {
        $tipoActividad = $tipoActividad->delete();
 
        return [ 'msj' => 'TipoActividad Eliminado' , compact('tipoActividad')];
    }
}
