<?php

namespace App\Http\Controllers;

use App\Models\TipoContacto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoContactoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoContacto = TipoContacto::with([])
                    ->get();
        
        return $tipoContacto;
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
            'nb_tipo_contacto'  => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoContacto = tipoContacto::create($request->all());

        return [ 'msj' => 'TipoContacto Agregado Correctamente', compact('tipoContacto') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoContacto  $tipoContacto
     * @return \Illuminate\Http\Response
     */
    public function show(TipoContacto $tipoContacto)
    {
        return $tipoContacto;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoContacto  $tipoContacto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoContacto $tipoContacto)
    {
        $validate = request()->validate([
            'nb_tipo_contacto'  => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoContacto = $tipoContacto->update($request->all());

        return [ 'msj' => 'TipoContacto Editado' , compact('tipoContacto')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoContacto  $tipoContacto
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoContacto $tipoContacto)
    {
        $tipoContacto = $tipoContacto->delete();
 
        return [ 'msj' => 'TipoContacto Eliminado' , compact('tipoContacto')];
    }
}
