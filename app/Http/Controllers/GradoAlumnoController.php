<?php

namespace App\Http\Controllers;

use App\Models\GradoAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GradoAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gradoAlumno = GradoAlumno::with([
                                            'alumno:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                            'grado:id,nb_grado',
                                        ])
                                        ->get();
        
        return $gradoAlumno;
    }



    public function gradoAlumnoAsignacion($idAlumno)
    {
        $gradoAlumno = GradoAlumno::with(['grado:id,nb_grado'])
                                   ->where('id_alumno','<>', $idAlumno)
                                   ->get();
        
        return $gradoAlumno;
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
            'id_grado'         => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $gradoAlumno = gradoAlumno::create($request->all());

        return [ 'msj' => 'Grado Agregado Correctamente', compact('gradoAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GradoAlumno  $gradoAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(GradoAlumno $gradoAlumno)
    {
        return $gradoAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GradoAlumno  $gradoAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GradoAlumno $gradoAlumno)
    {
        $validate = request()->validate([
            'id_grado'         => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $gradoAlumno = $gradoAlumno->update($request->all());

        return [ 'msj' => 'Grado Actualizado' , compact('gradoAlumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GradoAlumno  $gradoAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(GradoAlumno $gradoAlumno)
    {
        $gradoAlumno = $gradoAlumno->delete();
 
        return [ 'msj' => 'Grado Eliminado' , compact('gradoAlumno')];
    }
}
