<?php

namespace App\Http\Controllers;

use App\Models\Pagina;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PaginaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Pagina::with(['libro:id,nb_libro', 'tema:id,nb_tema'])
                    ->orderBy('nu_pagina', 'asc')
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
            'nb_pagina'         => 	'nullable|string|max:100',
            'id_libro'          => 	'required|integer|max:999999999',
            'id_tema'          => 	'required|integer|max:999999999',
			'nu_pagina'         => 	'required|integer|max:999999999',
			'tx_path'           => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $pagina = pagina::create($request->all());

        return [ 'msj' => 'Pagina Agregado Correctamente', compact('pagina') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pagina  $pagina
     * @return \Illuminate\Http\Response
     */
    public function show(Pagina $pagina)
    {
        return $pagina;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pagina  $pagina
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pagina $pagina)
    {
        $validate = request()->validate([
            'nb_pagina'         => 	'nullable|string|max:100',
            'id_libro'          => 	'required|integer|max:999999999',
            'id_tema'          => 	'required|integer|max:999999999',
			'nu_pagina'         => 	'required|integer|max:999999999',
			'tx_path'           => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $pagina = $pagina->update($request->all());

        return [ 'msj' => 'Pagina Editado' , compact('pagina')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pagina  $pagina
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pagina $pagina)
    {
        $pagina = $pagina->delete();
 
        return [ 'msj' => 'Pagina Eliminado' , compact('pagina')];
    }
}
