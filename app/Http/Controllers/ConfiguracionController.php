<?php

namespace App\Http\Controllers;

use App\Models\Configuracion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ConfiguracionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $configuracion = Configuracion::with([])
                    ->get();
        
        return $configuracion;
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
            'nb_configuracion'  => 	'nullable|string|max:50',
			'tx_valor'          => 	'nullable|string|max:30',
			'tx_modulo'         => 	'nullable|string|max:50',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $configuracion = configuracion::create($request->all());

        return [ 'msj' => 'Configuracion Agregado Correctamente', compact('configuracion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Configuracion  $configuracion
     * @return \Illuminate\Http\Response
     */
    public function show(Configuracion $configuracion)
    {
        return $configuracion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Configuracion  $configuracion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Configuracion $configuracion)
    {
        $validate = request()->validate([
            'nb_configuracion'  => 	'nullable|string|max:50',
			'tx_valor'          => 	'nullable|string|max:30',
			'tx_modulo'         => 	'nullable|string|max:50',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $configuracion = $configuracion->update($request->all());

        return [ 'msj' => 'Configuracion Editado' , compact('configuracion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Configuracion  $configuracion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Configuracion $configuracion)
    {
        $configuracion = $configuracion->delete();
 
        return [ 'msj' => 'Configuracion Eliminado' , compact('configuracion')];
    }
}
