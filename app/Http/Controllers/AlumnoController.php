<?php

namespace App\Http\Controllers;

use App\Models\Alumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alumno = Alumno::with([])
                    ->get();
        
        return $alumno;
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
			'tx_tarjeta_profesional'=> 	'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_telefono3'      => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $alumno = alumno::create($request->all());

        return [ 'msj' => 'Alumno Agregado Correctamente', compact('alumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Alumno  $alumno
     * @return \Illuminate\Http\Response
     */
    public function show(Alumno $alumno)
    {
        return $alumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Alumno  $alumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Alumno $alumno)
    {
        $validate = request()->validate([
            'nb_nombre'         => 	'required|string|max:30',
			'nb_apellido'       => 	'required|string|max:30',
			'tx_documento'      => 	'required|string|max:30',
			'tx_tarjeta_profesional'=> 	'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:20',
			'tx_telefono2'      => 	'required|string|max:20',
			'tx_telefono3'      => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $alumno = $alumno->update($request->all());

        return [ 'msj' => 'Alumno Editado' , compact('alumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Alumno  $alumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(Alumno $alumno)
    {
        $alumno = $alumno->delete();
 
        return [ 'msj' => 'Alumno Eliminado' , compact('alumno')];
    }
}
