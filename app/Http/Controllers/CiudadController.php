<?php

namespace App\Http\Controllers;

use App\Models\Ciudad;
use Illuminate\Http\Request;

class CiudadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ciudads = Ciudad::with(['status'])
                        ->get();
        
        return $ciudads;

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

            'co_ciudad'         => 'required',
            'nb_ciudad'         => 'required',
            'id_departamento'   => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);

        $ciudad = Ciudad::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('ciudad') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function show(Ciudad $ciudad)
    {
        return $ciudad;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ciudad $ciudad)
    {
        $validate = request()->validate([

            'co_ciudad'         => 'required',
            'nb_ciudad'         => 'required',
            'id_departamento'   => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $ciudad = $ciudad->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('ciudad')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ciudad $ciudad)
    {
        $ciudad = $ciudad->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('ciudad')];

    }
}
