<?php

namespace App\Http\Controllers;

use App\Models\Pago;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PagoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pago = Pago::with([])
                    ->get();
        
        return $pago;
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
            'id_subcripcion'    => 	'required|integer',
			'mo_pago'           => 	'required|numeric|max:9',
			'id_tipo_pago'      => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pago = pago::create($request->all());

        return [ 'msj' => 'Pago Agregado Correctamente', compact('pago') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pago  $pago
     * @return \Illuminate\Http\Response
     */
    public function show(Pago $pago)
    {
        return $pago;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pago  $pago
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pago $pago)
    {
        $validate = request()->validate([
            'id_subcripcion'    => 	'required|integer',
			'mo_pago'           => 	'required|numeric|max:9',
			'id_tipo_pago'      => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pago = $pago->update($request->all());

        return [ 'msj' => 'Pago Editado' , compact('pago')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pago  $pago
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pago $pago)
    {
        $pago = $pago->delete();
 
        return [ 'msj' => 'Pago Eliminado' , compact('pago')];
    }
}
