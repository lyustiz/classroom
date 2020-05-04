<?php

namespace App\Http\Controllers;

use App\Models\Zona;
use Illuminate\Http\Request;

class ZonaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $zonas = Zona::with(['status'])
                     ->select('id', 'nb_zona', 'tx_latitud', 'tx_longitud') 
                     ->where('id_status', 1)      
                     ->get();
        
        return $zonas;
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

            'co_zona'           => 'required',
            'nb_zona'           => 'required',
            'id_ciudad'         => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $zona = Zona::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('zona') ];    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Zona  $zona
     * @return \Illuminate\Http\Response
     */
    public function show(Zona $zona)
    {
        return $zona;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Zona  $zona
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Zona $zona)
    {
        $validate = request()->validate([
            
            'co_zona'           => 'required',
            'nb_zona'           => 'required',
            'id_ciudad'         => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $zona = $zona->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('zona')];    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Zona  $zona
     * @return \Illuminate\Http\Response
     */
    public function destroy(Zona $zona)
    {
        $zona = $zona->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('zona')];
    }
}
