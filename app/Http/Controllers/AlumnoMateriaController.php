<?php

namespace App\Http\Controllers;

use App\Models\AlumnoMateria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AlumnoMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alumnoMateria = AlumnoMateria::with([])
                    ->get();
        
        return $alumnoMateria;
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
            'id_calendario'     => 	'required|integer|max:999999999',
            'id_alumno'         => 	'required|integer|max:999999999',
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $alumnoMateria = alumnoMateria::create($request->all());

        return [ 'msj' => 'AlumnoMateria Agregado Correctamente', compact('alumnoMateria') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AlumnoMateria  $alumnoMateria
     * @return \Illuminate\Http\Response
     */
    public function show(AlumnoMateria $alumnoMateria)
    {
        return $alumnoMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AlumnoMateria  $alumnoMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AlumnoMateria $alumnoMateria)
    {
        $validate = request()->validate([
            'id_calendario'     => 	'required|integer|max:999999999',
            'id_alumno'         => 	'required|integer|max:999999999',
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $alumnoMateria = $alumnoMateria->update($request->all());

        return [ 'msj' => 'AlumnoMateria Editado' , compact('alumnoMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AlumnoMateria  $alumnoMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(AlumnoMateria $alumnoMateria)
    {
        $alumnoMateria = $alumnoMateria->delete();
 
        return [ 'msj' => 'AlumnoMateria Eliminado' , compact('alumnoMateria')];
    }
}
