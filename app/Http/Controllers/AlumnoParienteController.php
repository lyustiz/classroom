<?php

namespace App\Http\Controllers;

use App\Models\AlumnoPariente;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AlumnoParienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alumnoPariente = AlumnoPariente::with([])
                    ->get();
        
        return $alumnoPariente;
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
            'id_alumno'         => 	'required|integer|max:999999999',
			'id_pariente'       => 	'required|integer|max:999999999',
			'bo_acudiente'      => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $alumnoPariente = alumnoPariente::create($request->all());

        return [ 'msj' => 'AlumnoPariente Agregado Correctamente', compact('alumnoPariente') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AlumnoPariente  $alumnoPariente
     * @return \Illuminate\Http\Response
     */
    public function show(AlumnoPariente $alumnoPariente)
    {
        return $alumnoPariente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AlumnoPariente  $alumnoPariente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AlumnoPariente $alumnoPariente)
    {
        $validate = request()->validate([
            'id_alumno'         => 	'required|integer|max:999999999',
			'id_pariente'       => 	'required|integer|max:999999999',
			'bo_acudiente'      => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $alumnoPariente = $alumnoPariente->update($request->all());

        return [ 'msj' => 'AlumnoPariente Editado' , compact('alumnoPariente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AlumnoPariente  $alumnoPariente
     * @return \Illuminate\Http\Response
     */
    public function destroy(AlumnoPariente $alumnoPariente)
    {
        $alumnoPariente = $alumnoPariente->delete();
 
        return [ 'msj' => 'AlumnoPariente Eliminado' , compact('alumnoPariente')];
    }
}
