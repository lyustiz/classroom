<?php

namespace App\Http\Controllers;

use App\Models\TipoSancion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoSancionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoSancion = TipoSancion::with([])
                    ->get();
        
        return $tipoSancion;
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
            'nb_tipo_sancion'   => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoSancion = tipoSancion::create($request->all());

        return [ 'msj' => 'TipoSancion Agregado Correctamente', compact('tipoSancion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoSancion  $tipoSancion
     * @return \Illuminate\Http\Response
     */
    public function show(TipoSancion $tipoSancion)
    {
        return $tipoSancion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoSancion  $tipoSancion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoSancion $tipoSancion)
    {
        $validate = request()->validate([
            'nb_tipo_sancion'   => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoSancion = $tipoSancion->update($request->all());

        return [ 'msj' => 'TipoSancion Editado' , compact('tipoSancion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoSancion  $tipoSancion
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoSancion $tipoSancion)
    {
        $tipoSancion = $tipoSancion->delete();
 
        return [ 'msj' => 'TipoSancion Eliminado' , compact('tipoSancion')];
    }
}
