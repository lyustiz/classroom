<?php

namespace App\Http\Controllers;

use App\Models\Foto;
use Illuminate\Http\Request;

class FotoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fotos = Foto::with(['status'])
                     ->get();
        
        return $fotos;

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

            'nb_foto'           => 'required',
            'tx_src'            => 'required',
            'id_tipo_foto'      => 'required',
            'id_comercio'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $foto = Foto::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('foto') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Foto  $foto
     * @return \Illuminate\Http\Response
     */
    public function show(Foto $foto)
    {
        return $foto;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Foto  $foto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Foto $foto)
    {
        $validate = request()->validate([

            'nb_foto'           => 'required',
            'tx_src'            => 'required',
            'id_tipo_foto'      => 'required',
            'id_comercio'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $foto = $foto->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('foto')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Foto  $foto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Foto $foto)
    {
        $foto = $foto->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('foto')];

    }
}
