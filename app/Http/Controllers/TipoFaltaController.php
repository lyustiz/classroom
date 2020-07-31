<?php

namespace App\Http\Controllers;

use App\Models\TipoFalta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoFaltaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoFalta = TipoFalta::with([])
                    ->get();
        
        return $tipoFalta;
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
            'nb_tipo_falta'     => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoFalta = tipoFalta::create($request->all());

        return [ 'msj' => 'TipoFalta Agregado Correctamente', compact('tipoFalta') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoFalta  $tipoFalta
     * @return \Illuminate\Http\Response
     */
    public function show(TipoFalta $tipoFalta)
    {
        return $tipoFalta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoFalta  $tipoFalta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoFalta $tipoFalta)
    {
        $validate = request()->validate([
            'nb_tipo_falta'     => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoFalta = $tipoFalta->update($request->all());

        return [ 'msj' => 'TipoFalta Editado' , compact('tipoFalta')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoFalta  $tipoFalta
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoFalta $tipoFalta)
    {
        $tipoFalta = $tipoFalta->delete();
 
        return [ 'msj' => 'TipoFalta Eliminado' , compact('tipoFalta')];
    }
}
