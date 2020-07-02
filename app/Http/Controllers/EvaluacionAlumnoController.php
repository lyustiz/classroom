<?php

namespace App\Http\Controllers;

use App\Models\EvaluacionAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EvaluacionAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $evaluacionAlumno = EvaluacionAlumno::with([])
                    ->get();
        
        return $evaluacionAlumno;
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
            'id_evaluacion'     => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacionAlumno = evaluacionAlumno::create($request->all());

        return [ 'msj' => 'EvaluacionAlumno Agregado Correctamente', compact('evaluacionAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\EvaluacionAlumno  $evaluacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(EvaluacionAlumno $evaluacionAlumno)
    {
        return $evaluacionAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EvaluacionAlumno  $evaluacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EvaluacionAlumno $evaluacionAlumno)
    {
        $validate = request()->validate([
            'id_evaluacion'     => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacionAlumno = $evaluacionAlumno->update($request->all());

        return [ 'msj' => 'EvaluacionAlumno Editado' , compact('evaluacionAlumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EvaluacionAlumno  $evaluacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(EvaluacionAlumno $evaluacionAlumno)
    {
        $evaluacionAlumno = $evaluacionAlumno->delete();
 
        return [ 'msj' => 'EvaluacionAlumno Eliminado' , compact('evaluacionAlumno')];
    }
}
