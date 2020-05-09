<?php

namespace App\Http\Controllers;

use App\Models\TipoPago;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoPagoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoPago = TipoPago::with([])
                    ->get();
        
        return $tipoPago;
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
            'nb_tipo_pago'      => 	'required|string|max:30',
			'id_comercio'       => 	'required|integer',
			'tx_icono'          => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoPago = tipoPago::create($request->all());

        return [ 'msj' => 'TipoPago Agregado Correctamente', compact('tipoPago') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoPago  $tipoPago
     * @return \Illuminate\Http\Response
     */
    public function show(TipoPago $tipoPago)
    {
        return $tipoPago;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoPago  $tipoPago
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoPago $tipoPago)
    {
        $validate = request()->validate([
            'nb_tipo_pago'      => 	'required|string|max:30',
			'id_comercio'       => 	'required|integer',
			'tx_icono'          => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoPago = $tipoPago->update($request->all());

        return [ 'msj' => 'TipoPago Editado' , compact('tipoPago')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoPago  $tipoPago
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoPago $tipoPago)
    {
        $tipoPago = $tipoPago->delete();
 
        return [ 'msj' => 'TipoPago Eliminado' , compact('tipoPago')];
    }
}
