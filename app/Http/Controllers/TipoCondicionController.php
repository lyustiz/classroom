<?php

namespace App\Http\Controllers;

use App\Models\TipoCondicion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoCondicionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoCondicion = TipoCondicion::with([])
                    ->get();
        
        return $tipoCondicion;
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
            'nb_tipo_condicion' => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoCondicion = tipoCondicion::create($request->all());

        return [ 'msj' => 'TipoCondicion Agregado Correctamente', compact('tipoCondicion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoCondicion  $tipoCondicion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoCondicion $tipoCondicion)
    {
        return $tipoCondicion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoCondicion  $tipoCondicion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoCondicion $tipoCondicion)
    {
        $validate = request()->validate([
            'nb_tipo_condicion' => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoCondicion = $tipoCondicion->update($request->all());

        return [ 'msj' => 'TipoCondicion Editado' , compact('tipoCondicion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoCondicion  $tipoCondicion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoCondicion $tipoCondicion)
    {
        $tipoCondicion = $tipoCondicion->delete();
 
        return [ 'msj' => 'TipoCondicion Eliminado' , compact('tipoCondicion')];
    }
}
