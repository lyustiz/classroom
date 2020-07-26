<?php

namespace App\Http\Controllers;

use App\Models\TipoDestinatario;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoDestinatarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoDestinatario = TipoDestinatario::with([])
                    ->get();
        
        return $tipoDestinatario;
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
            'nb_tipo_destinatario'=> 	'required|string|max:30',
            'tx_origen'         => 	'required|string|max:80',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoDestinatario = tipoDestinatario::create($request->all());

        return [ 'msj' => 'TipoDestinatario Agregado Correctamente', compact('tipoDestinatario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoDestinatario  $tipoDestinatario
     * @return \Illuminate\Http\Response
     */
    public function show(TipoDestinatario $tipoDestinatario)
    {
        return $tipoDestinatario;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoDestinatario  $tipoDestinatario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoDestinatario $tipoDestinatario)
    {
        $validate = request()->validate([
            'nb_tipo_destinatario'=> 	'required|string|max:30',
            'tx_origen'         => 	'required|string|max:80',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoDestinatario = $tipoDestinatario->update($request->all());

        return [ 'msj' => 'TipoDestinatario Editado' , compact('tipoDestinatario')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoDestinatario  $tipoDestinatario
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoDestinatario $tipoDestinatario)
    {
        $tipoDestinatario = $tipoDestinatario->delete();
 
        return [ 'msj' => 'TipoDestinatario Eliminado' , compact('tipoDestinatario')];
    }
}
