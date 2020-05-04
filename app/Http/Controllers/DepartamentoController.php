<?php

namespace App\Http\Controllers;

use App\Models\Departamento;
use Illuminate\Http\Request;

class DepartamentoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $departamentos = Departamento::with(['status'])
                        ->get();
        
        return $departamentos;

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
            
            'co_departamento'   => 'required',
            'nb_departamento'   => 'required',
            'id_pais'           => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $departamento = Departamento::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('departamento') ];
    
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

            'co_departamento'   => 'required',
            'nb_departamento'   => 'required',
            'id_pais'           => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $departamento = $departamento->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('departamento')];
    
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
 
        return [ 'msj' => 'Registro Eliminado' , compact('departamento')];

    }
}
