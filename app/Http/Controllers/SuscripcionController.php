<?php

namespace App\Http\Controllers;

use App\Models\Suscripcion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SuscripcionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suscripcion = Suscripcion::with([])
                    ->get();
        
        return $suscripcion;
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
            'id_colegio'        => 	'required|integer',
			'aa_lectivo'        => 	'required|integer',
			'mo_cobro'          => 	'required|numeric|max:9',
			'mo_pagado'         => 	'required|numeric|max:9',
			'mo_saldo'          => 	'required|numeric|max:9',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $suscripcion = suscripcion::create($request->all());

        return [ 'msj' => 'Suscripcion Agregado Correctamente', compact('suscripcion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Suscripcion  $suscripcion
     * @return \Illuminate\Http\Response
     */
    public function show(Suscripcion $suscripcion)
    {
        return $suscripcion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Suscripcion  $suscripcion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Suscripcion $suscripcion)
    {
        $validate = request()->validate([
            'id_colegio'        => 	'required|integer',
			'aa_lectivo'        => 	'required|integer',
			'mo_cobro'          => 	'required|numeric|max:9',
			'mo_pagado'         => 	'required|numeric|max:9',
			'mo_saldo'          => 	'required|numeric|max:9',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $suscripcion = $suscripcion->update($request->all());

        return [ 'msj' => 'Suscripcion Editado' , compact('suscripcion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Suscripcion  $suscripcion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Suscripcion $suscripcion)
    {
        $suscripcion = $suscripcion->delete();
 
        return [ 'msj' => 'Suscripcion Eliminado' , compact('suscripcion')];
    }
}
