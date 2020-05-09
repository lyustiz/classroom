<?php

namespace App\Http\Controllers;

use App\Models\TipoTelefono;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoTelefonoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoTelefono = TipoTelefono::with([])
                    ->get();
        
        return $tipoTelefono;
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
            'nb_tipo_telefono'  => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoTelefono = tipoTelefono::create($request->all());

        return [ 'msj' => 'TipoTelefono Agregado Correctamente', compact('tipoTelefono') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoTelefono  $tipoTelefono
     * @return \Illuminate\Http\Response
     */
    public function show(TipoTelefono $tipoTelefono)
    {
        return $tipoTelefono;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoTelefono  $tipoTelefono
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoTelefono $tipoTelefono)
    {
        $validate = request()->validate([
            'nb_tipo_telefono'  => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoTelefono = $tipoTelefono->update($request->all());

        return [ 'msj' => 'TipoTelefono Editado' , compact('tipoTelefono')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoTelefono  $tipoTelefono
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoTelefono $tipoTelefono)
    {
        $tipoTelefono = $tipoTelefono->delete();
 
        return [ 'msj' => 'TipoTelefono Eliminado' , compact('tipoTelefono')];
    }
}
