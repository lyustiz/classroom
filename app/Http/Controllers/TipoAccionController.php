<?php

namespace App\Http\Controllers;

use App\Models\TipoAccion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoAccionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TipoAccion::with([])
                    ->get();
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
            'nb_tipo_accion'    => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoAccion = tipoAccion::create($request->all());

        return [ 'msj' => 'TipoAccion Agregado Correctamente', compact('tipoAccion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoAccion  $tipoAccion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoAccion $tipoAccion)
    {
        return $tipoAccion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoAccion  $tipoAccion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoAccion $tipoAccion)
    {
        $validate = request()->validate([
            'nb_tipo_accion'    => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoAccion = $tipoAccion->update($request->all());

        return [ 'msj' => 'TipoAccion Editado' , compact('tipoAccion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoAccion  $tipoAccion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoAccion $tipoAccion)
    {
        $tipoAccion = $tipoAccion->delete();
 
        return [ 'msj' => 'TipoAccion Eliminado' , compact('tipoAccion')];
    }
}
