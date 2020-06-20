<?php

namespace App\Http\Controllers;

use App\Models\TipoFeriado;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoFeriadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoFeriado = TipoFeriado::with([])
                    ->get();
        
        return $tipoFeriado;
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
            'nb_tipo_feriado'   => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoFeriado = tipoFeriado::create($request->all());

        return [ 'msj' => 'TipoFeriado Agregado Correctamente', compact('tipoFeriado') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoFeriado  $tipoFeriado
     * @return \Illuminate\Http\Response
     */
    public function show(TipoFeriado $tipoFeriado)
    {
        return $tipoFeriado;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoFeriado  $tipoFeriado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoFeriado $tipoFeriado)
    {
        $validate = request()->validate([
            'nb_tipo_feriado'   => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoFeriado = $tipoFeriado->update($request->all());

        return [ 'msj' => 'TipoFeriado Editado' , compact('tipoFeriado')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoFeriado  $tipoFeriado
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoFeriado $tipoFeriado)
    {
        $tipoFeriado = $tipoFeriado->delete();
 
        return [ 'msj' => 'TipoFeriado Eliminado' , compact('tipoFeriado')];
    }
}
