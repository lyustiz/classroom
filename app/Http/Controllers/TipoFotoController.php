<?php

namespace App\Http\Controllers;

use App\Models\TipoFoto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoFotoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoFoto = TipoFoto::with([])
                    ->get();
        
        return $tipoFoto;
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
            'nb_tipo_foto'      => 	'required|string|max:30',
            'tx_origen'        => 	'required|string|max:30',
			'tx_storage'        => 	'required|string|max:50',
			'tx_base_path'      => 	'required|string|max:80',
			'tx_grupo'          => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoFoto = tipoFoto::create($request->all());

        return [ 'msj' => 'TipoFoto Agregado Correctamente', compact('tipoFoto') ];
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
            'nb_tipo_foto'      => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:20',
			'tx_path'           => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoFoto = $tipoFoto->update($request->all());

        return [ 'msj' => 'TipoFoto Editado' , compact('tipoFoto')];
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
 
        return [ 'msj' => 'TipoFoto Eliminado' , compact('tipoFoto')];
    }
}
