<?php

namespace App\Http\Controllers;

use App\Models\Pariente;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ParienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pariente = Pariente::with([])
                    ->get();
        
        return $pariente;
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
			'id_alumno'         => 	'required|integer',
			'id_parentesco'     => 	'required|integer',
			'tx_empresa'        => 	'required|string|max:30',
			'tx_cargo'          => 	'required|string|max:30',
			'tx_ocupacion'      => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_telefono3'      => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pariente = pariente::create($request->all());

        return [ 'msj' => 'Pariente Agregado Correctamente', compact('pariente') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function show(Pariente $pariente)
    {
        return $pariente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pariente $pariente)
    {
        $validate = request()->validate([
            'nb_nombre'         => 	'required|string|max:30',
			'nb_apellido'       => 	'required|string|max:30',
			'tx_documento'      => 	'required|string|max:30',
			'id_alumno'         => 	'required|integer',
			'id_parentesco'     => 	'required|integer',
			'tx_empresa'        => 	'required|string|max:30',
			'tx_cargo'          => 	'required|string|max:30',
			'tx_ocupacion'      => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_telefono3'      => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pariente = $pariente->update($request->all());

        return [ 'msj' => 'Pariente Editado' , compact('pariente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pariente $pariente)
    {
        $pariente = $pariente->delete();
 
        return [ 'msj' => 'Pariente Eliminado' , compact('pariente')];
    }
}
