<?php

namespace App\Http\Controllers;

use App\Models\TipoPago;
use Illuminate\Http\Request;

class TipoPagoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoPagos = TipoPago::with(['status'])
                               ->get();
        
        return $tipoPagos;

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
            
            'nb_tipo_pago'     => 'required',
            'id_comercio'      => 'required',
            'tx_icono'         => 'required',
            'tx_observaciones' => 'required',
            'id_status'        => 'required',
            'id_usuario'       => 'required',
            
        ]);

        $tipoPago = TipoPago::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('tipoPago') ];
    
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
            
            'nb_tipo_pago'     => 'required',
            'id_comercio'      => 'required',
            'tx_icono'         => 'required',
            'tx_observaciones' => 'required',
            'id_status'        => 'required',
            'id_usuario'       => 'required',
            
        ]);
        
        $tipoPago = $tipoPago->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('tipoPago')];
    
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
 
        return [ 'msj' => 'Registro Eliminado' , compact('tipoPago')];

    }
}
