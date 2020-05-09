<?php

namespace App\Http\Controllers;

use App\Models\Departamento;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DepartamentoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $departamento = Departamento::with([])
                    ->get();
        
        return $departamento;
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
            'co_departamento'   => 	'required|integer',
			'nb_departamento'   => 	'required|string|max:30',
			'id_pais'           => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $departamento = departamento::create($request->all());

        return [ 'msj' => 'Departamento Agregado Correctamente', compact('departamento') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Departamento  $departamento
     * @return \Illuminate\Http\Response
     */
    public function show(Departamento $departamento)
    {
        return $departamento;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Departamento  $departamento
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Departamento $departamento)
    {
        $validate = request()->validate([
            'co_departamento'   => 	'required|integer',
			'nb_departamento'   => 	'required|string|max:30',
			'id_pais'           => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $departamento = $departamento->update($request->all());

        return [ 'msj' => 'Departamento Editado' , compact('departamento')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Departamento  $departamento
     * @return \Illuminate\Http\Response
     */
    public function destroy(Departamento $departamento)
    {
        $departamento = $departamento->delete();
 
        return [ 'msj' => 'Departamento Eliminado' , compact('departamento')];
    }
}
