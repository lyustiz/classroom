<?php

namespace App\Http\Controllers;

use App\Models\Subcripcion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SubcripcionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subcripcion = Subcripcion::with([])
                    ->get();
        
        return $subcripcion;
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

        $subcripcion = subcripcion::create($request->all());

        return [ 'msj' => 'Subcripcion Agregado Correctamente', compact('subcripcion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Subcripcion  $subcripcion
     * @return \Illuminate\Http\Response
     */
    public function show(Subcripcion $subcripcion)
    {
        return $subcripcion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Subcripcion  $subcripcion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Subcripcion $subcripcion)
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

        $subcripcion = $subcripcion->update($request->all());

        return [ 'msj' => 'Subcripcion Editado' , compact('subcripcion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Subcripcion  $subcripcion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subcripcion $subcripcion)
    {
        $subcripcion = $subcripcion->delete();
 
        return [ 'msj' => 'Subcripcion Eliminado' , compact('subcripcion')];
    }
}
