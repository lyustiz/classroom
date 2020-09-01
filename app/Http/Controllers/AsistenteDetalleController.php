<?php

namespace App\Http\Controllers;

use App\Models\AsistenteDetalle;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AsistenteDetalleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $asistenteDetalle = AsistenteDetalle::with([])
                    ->get();
        
        return $asistenteDetalle;
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
            'tx_descripcion'    => 	'nullable|string|max:300',
			'tipo_detalle'      => 	'required|string|max:50',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asistenteDetalle = asistenteDetalle::create($request->all());

        return [ 'msj' => 'AsistenteDetalle Agregado Correctamente', compact('asistenteDetalle') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AsistenteDetalle  $asistenteDetalle
     * @return \Illuminate\Http\Response
     */
    public function show(AsistenteDetalle $asistenteDetalle)
    {
        return $asistenteDetalle;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AsistenteDetalle  $asistenteDetalle
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AsistenteDetalle $asistenteDetalle)
    {
        $validate = request()->validate([
            'tx_descripcion'    => 	'nullable|string|max:300',
			'tipo_detalle'      => 	'required|string|max:50',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asistenteDetalle = $asistenteDetalle->update($request->all());

        return [ 'msj' => 'AsistenteDetalle Editado' , compact('asistenteDetalle')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AsistenteDetalle  $asistenteDetalle
     * @return \Illuminate\Http\Response
     */
    public function destroy(AsistenteDetalle $asistenteDetalle)
    {
        $asistenteDetalle = $asistenteDetalle->delete();
 
        return [ 'msj' => 'AsistenteDetalle Eliminado' , compact('asistenteDetalle')];
    }
}
