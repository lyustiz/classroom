<?php

namespace App\Http\Controllers;

use App\Models\AccionPagina;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AccionPaginaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return AccionPagina::with([])
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
            'nb_accion_pagina'  => 	'required|string|max:100',
			'id_pagina'         => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'id_tipo_accion'    => 	'required|integer|max:999999999',
			'tx_x_posicion'     => 	'nullable|string|max:35',
			'tx_y_posicion'     => 	'nullable|string|max:35',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $accionPagina = accionPagina::create($request->all());

        return [ 'msj' => 'AccionPagina Agregado Correctamente', compact('accionPagina') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AccionPagina  $accionPagina
     * @return \Illuminate\Http\Response
     */
    public function show(AccionPagina $accionPagina)
    {
        return $accionPagina;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AccionPagina  $accionPagina
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AccionPagina $accionPagina)
    {
        $validate = request()->validate([
            'nb_accion_pagina'  => 	'required|string|max:100',
			'id_pagina'         => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'id_tipo_accion'    => 	'required|integer|max:999999999',
			'tx_x_posicion'     => 	'nullable|string|max:35',
			'tx_y_posicion'     => 	'nullable|string|max:35',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $accionPagina = $accionPagina->update($request->all());

        return [ 'msj' => 'AccionPagina Editado' , compact('accionPagina')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AccionPagina  $accionPagina
     * @return \Illuminate\Http\Response
     */
    public function destroy(AccionPagina $accionPagina)
    {
        $accionPagina = $accionPagina->delete();
 
        return [ 'msj' => 'AccionPagina Eliminado' , compact('accionPagina')];
    }
}
