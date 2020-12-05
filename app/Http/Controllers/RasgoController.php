<?php

namespace App\Http\Controllers;

use App\Models\Rasgo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RasgoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Rasgo::with([])
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
            'nb_rasgo'          => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $rasgo = rasgo::create($request->all());

        return [ 'msj' => 'Rasgo Agregado Correctamente', compact('rasgo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Rasgo  $rasgo
     * @return \Illuminate\Http\Response
     */
    public function show(Rasgo $rasgo)
    {
        return $rasgo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Rasgo  $rasgo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rasgo $rasgo)
    {
        $validate = request()->validate([
            'nb_rasgo'          => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $rasgo = $rasgo->update($request->all());

        return [ 'msj' => 'Rasgo Editado' , compact('rasgo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Rasgo  $rasgo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rasgo $rasgo)
    {
        $rasgo = $rasgo->delete();
 
        return [ 'msj' => 'Rasgo Eliminado' , compact('rasgo')];
    }
}
