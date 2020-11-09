<?php

namespace App\Http\Controllers;

use App\Models\EvaluacionAlumno;
use App\Models\Calificacion;
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

    public function evaluacionAlumnoEvaluacion($idEvaluacion)
    {
        return EvaluacionAlumno:: with([
                                    'alumno' ,
                                    'calificacion',
                                    'archivo',
                                    'archivo.tipoArchivo'
                                ])
                                ->where('id_evaluacion',$idEvaluacion)
                                ->get();
    }

    public function evaluacionAlumnoAlumno($idAlumno) 
    {

        $evaluaciones = EvaluacionAlumno::with([
                                    'evaluacion:id,id_tipo_evaluacion,tx_origen,id_origen,id_grupo,id_materia,id_tema,nu_peso,fe_inicio,fe_fin,hh_inicio,hh_fin,nu_minutos',
                                    'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion,tx_icono,tx_color',
                                    'evaluacion.materia:id,nb_materia',
                                    'evaluacion.tema:id,nb_tema',
                                    'evaluacion.origen'
                            ])
                            ->where('id_alumno', $idAlumno)
                            ->get(); 

        return $this->formatData($evaluaciones);
    }

    public function formatData($evaluacinesAlumno)
    {
        $data = [];

        foreach ($evaluacinesAlumno as $evaluacionAlumno) //data[tipo]
        { 
            $tipo          = $evaluacionAlumno->evaluacion->tipoEvaluacion->nb_tipo_evaluacion;

            $data[$tipo][] = $evaluacionAlumno;
        }

        return $data;
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
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge( ['id_status' => 1] );

        $evaluacionAlumno = evaluacionAlumno::create($request->all());

        return [ 'msj' => 'Evaluacion Agregada Correctamente', compact('evaluacionAlumno') ];
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
			'id_calificacion'   => 	'required|numeric|max:100',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $evaluacion   = $evaluacionAlumno->evaluacion;

        $cafificacion = $this->calcularCalificacion($evaluacion, $request->id_calificacion);

        $request->merge( ['nu_calificacion' => $cafificacion] );

        $evaluacionAlumno = $evaluacionAlumno->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('evaluacionAlumno')];
    }


    public function calcularCalificacion($evaluacion, $idCalificacion) //TODO TRAIT
    {
        //TODO: check grupo calificacion
        
        $calificacion     = Calificacion::find($idCalificacion);

        $maxCalificacion  = Calificacion::max('nu_calificacion');

        $calificacion     = $calificacion->nu_calificacion;

        $peso             = $evaluacion->nu_peso;

        //calculo   maxnota * %peso * %calificacion  eje: 20 * 25% * 50%  = 2.5  == 20 * (25/100) * (10/20) = 2.5

        $percPeso          = $peso / 100; 

        $percCalificacion  = $calificacion  / $maxCalificacion; 
        
        $puntos            = round(($maxCalificacion * $percPeso * $percCalificacion), 2, PHP_ROUND_HALF_UP);

        return $puntos;
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
