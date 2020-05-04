<?php

namespace App\Http\Controllers;

use App\Models\Pais;
use Illuminate\Http\Request;

class PaisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $paises = Pais::with(['status'])
                      ->get();
        
        return $paises;

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

           'nb_pais'            => 'required',
           'co_pais'            => 'required',
           'tx_iso'             => 'required',
           'tx_observaciones'   => 'required',
           'id_status'          => 'required',
           'id_usuario'         => 'required',
            
        ]);

        $pais = Pais::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('pais') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pais  $pais
     * @return \Illuminate\Http\Response
     */
    public function show(Pais $pais)
    {
        return $pais;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pais  $pais
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pais $pais)
    {
        $validate = request()->validate([

           'nb_pais'            => 'required',
           'co_pais'            => 'required',
           'tx_iso'             => 'required',
           'tx_observaciones'   => 'required',
           'id_status'          => 'required',
           'id_usuario'         => 'required',

        ]);
        
        $pais = $pais->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('pais')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pais  $pais
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pais $pais)
    {
        $pais = $pais->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('pais')];

    }
}
