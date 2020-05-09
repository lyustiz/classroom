<?php

namespace App\Http\Controllers;

use App\Models\Foto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FotoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $foto = Foto::with([])
                    ->get();
        
        return $foto;
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
            'nb_foto'           => 	'required|string|max:100',
			'tx_src'            => 	'required|string|max:100',
			'id_tipo_foto'      => 	'required|integer',
			'id_entidad'        => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $foto = foto::create($request->all());

        return [ 'msj' => 'Foto Agregado Correctamente', compact('foto') ];
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
            'nb_foto'           => 	'required|string|max:100',
			'tx_src'            => 	'required|string|max:100',
			'id_tipo_foto'      => 	'required|integer',
			'id_entidad'        => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $foto = $foto->update($request->all());

        return [ 'msj' => 'Foto Editado' , compact('foto')];
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
 
        return [ 'msj' => 'Foto Eliminado' , compact('foto')];
    }
}
