<?php

namespace App\Http\Controllers;

use App\Models\RecursoCategoria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RecursoCategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return RecursoCategoria::with([])
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
            'nb_recurso_categoria'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $recursoCategoria = recursoCategoria::create($request->all());

        return [ 'msj' => 'RecursoCategoria Agregado Correctamente', compact('recursoCategoria') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RecursoCategoria  $recursoCategoria
     * @return \Illuminate\Http\Response
     */
    public function show(RecursoCategoria $recursoCategoria)
    {
        return $recursoCategoria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RecursoCategoria  $recursoCategoria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RecursoCategoria $recursoCategoria)
    {
        $validate = request()->validate([
            'nb_recurso_categoria'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $recursoCategoria = $recursoCategoria->update($request->all());

        return [ 'msj' => 'RecursoCategoria Editado' , compact('recursoCategoria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RecursoCategoria  $recursoCategoria
     * @return \Illuminate\Http\Response
     */
    public function destroy(RecursoCategoria $recursoCategoria)
    {
        $recursoCategoria = $recursoCategoria->delete();
 
        return [ 'msj' => 'RecursoCategoria Eliminado' , compact('recursoCategoria')];
    }
}
