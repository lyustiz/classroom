<?php

namespace App\Http\Controllers;

use App\Models\Profesor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProfesorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $profesor = Profesor::with([])
                    ->get();
        
        return $profesor;
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
            'nb_nombre'         => 	'required|string|max:30',
			'nb_apellido'       => 	'required|string|max:30',
			'tx_documento'      => 	'required|string|max:30',
			'tx_tarjeta_prof'   => 	'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:50',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_foto'           => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $profesor = profesor::create($request->all());

        return [ 'msj' => 'Profesor Agregado Correctamente', compact('profesor') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Profesor  $profesor
     * @return \Illuminate\Http\Response
     */
    public function show(Profesor $profesor)
    {
        return $profesor;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Profesor  $profesor
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Profesor $profesor)
    {
        $validate = request()->validate([
            'nb_nombre'         => 	'required|string|max:30',
			'nb_apellido'       => 	'required|string|max:30',
			'tx_documento'      => 	'required|string|max:30',
			'tx_tarjeta_prof'   => 	'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:50',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_foto'           => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $profesor = $profesor->update($request->all());

        return [ 'msj' => 'Profesor Editado' , compact('profesor')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Profesor  $profesor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Profesor $profesor)
    {
        $profesor = $profesor->delete();
 
        return [ 'msj' => 'Profesor Eliminado' , compact('profesor')];
    }
}
