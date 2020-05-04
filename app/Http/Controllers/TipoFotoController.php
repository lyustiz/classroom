<?php

namespace App\Http\Controllers;

use App\Models\TipoFoto;
use Illuminate\Http\Request;

class TipoFotoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoFotos = TipoFoto::with(['status'])
                             ->get();
        
        return $tipoFotos;

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
            
            'nb_tipo_foto'     => 'required',
            'tx_icono'         => 'required',
            'tx_path'          => 'required',
            'tx_observaciones' => 'required',
            'id_status'        => 'required',
            'id_usuario'       => 'required',
            
        ]);

        $tipoFoto = TipoFoto::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('tipoFoto') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoFoto  $tipoFoto
     * @return \Illuminate\Http\Response
     */
    public function show(TipoFoto $tipoFoto)
    {
        return $tipoFoto;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoFoto  $tipoFoto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoFoto $tipoFoto)
    {
        $validate = request()->validate([
            
            'nb_tipo_foto'     => 'required',
            'tx_icono'         => 'required',
            'tx_path'          => 'required',
            'tx_observaciones' => 'required',
            'id_status'        => 'required',
            'id_usuario'       => 'required',

        ]);
        
        $tipoFoto = $tipoFoto->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('tipoFoto')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoFoto  $tipoFoto
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoFoto $tipoFoto)
    {
        $tipoFoto = $tipoFoto->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('tipoFoto')];

    }
}
