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
            'nb_apellido'       => 	'required|string|max:30',
			'nb_apellido2'      => 	'nullable|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'nullable|string|max:30',
			'tx_sexo'           => 	'required|string|max:1',
			'fe_nacimiento'     => 	'required|date|before:today',
			'id_tipo_documento' => 	'required|integer|max:999999999',
			'tx_documento'      => 	'required|string|max:12',
			'tx_lugar_nacimiento'=> 'nullable|string|max:30',
			'tx_nacionalidad'   => 	'nullable|string|max:30',
			'tx_direccion'      => 	'required|string|max:80',
			'id_departamento'   => 	'required|integer|max:999999999',
			'id_ciudad'         => 	'required|integer|max:999999999',
			'tx_email'          => 	'nullable|string|max:30',
			'tx_telefono'       => 	'nullable|string|max:15',
			'tx_telefono2'      => 	'nullable|string|max:15',
			'tx_telefono3'      => 	'nullable|string|max:15',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
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
            'nb_apellido'       => 	'required|string|max:30',
			'nb_apellido2'      => 	'nullable|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'nullable|string|max:30',
			'tx_sexo'           => 	'required|string|max:1',
			'fe_nacimiento'     => 	'required|date|before:today',
			'id_tipo_documento' => 	'required|integer|max:999999999',
			'tx_documento'      => 	'required|string|max:12',
			'tx_lugar_nacimiento'=> 'nullable|string|max:30',
			'tx_nacionalidad'   => 	'nullable|string|max:30',
			'tx_direccion'      => 	'required|string|max:80',
			'id_departamento'   => 	'required|integer|max:999999999',
			'id_ciudad'         => 	'required|integer|max:999999999',
			'tx_email'          => 	'nullable|string|max:30',
			'tx_telefono'       => 	'nullable|string|max:15',
			'tx_telefono2'      => 	'nullable|string|max:15',
			'tx_telefono3'      => 	'nullable|string|max:15',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
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
