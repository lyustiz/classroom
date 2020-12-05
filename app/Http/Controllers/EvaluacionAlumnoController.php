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

    public function evaluacionAlumnoGrupo($idGrupo)  //TODO  Extraer Querys
    {
        $asignaciones = EvaluacionAlumno::with([
                                'alumno:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                'asignacion:id,id_tipo_asignacion,id_materia,id_tema,id_origen,tx_origen,fe_inicio,fe_fin',
                                'asignacion.tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color,tx_criterio,nu_tiempo',
                                'asignacion.materia:id,nb_materia',
                                'asignacion.tema:id,nb_tema',
                                'asignacion.origen'
                            ])
                            ->whereHas('alumno.grupo', function (Builder $query) use($idGrupo) {
                                $query->where('grupo.id', $idGrupo);
                            })
                            ->get(); 

        return $this->formatDataAlumnos($asignaciones);
    }

    public function formatDataAlumnos($evaluacionesAlumno)
    {
        $data = [];

        foreach ($evaluacionesAlumno as $evaluacionAlumno) //data[tipo][materia]
        { 
            $alumno         = $evaluacionAlumno->alumno->nb_alumno;
            $evaluacion     = $evaluacionAlumno->evaluacion;
            $tipoAsignacion = $evaluacion->tipoAsignacion->nb_tipo_evaluacion;
            $data[$alumno][$tipoAsignacion][] = $evaluacionAlumno;
        }

        return $data;
    }

    public function evaluacionAlumnoArchivo($idEvaluacionAlumno)  
    {
        return  EvaluacionAlumno::with([
                    'archivo'
                ])
                ->find($idEvaluacionAlumno); 
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EvaluacionAlumno  $evaluacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EvaluacionAlumno $evaluacionAlumno)
    {
        $validate = request()->validate([
			'nu_calificacion'   => 	'required|numeric|max:100',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);
        
        $evaluacion     = $evaluacionAlumno->evaluacion->origen;

        $idCafificacion = $this->calificar($evaluacion, $request->nu_calificacion);

        $request->merge( ['id_calificacion' => $idCafificacion, 'id_status' => 5] );

        $evaluacionAlumno = $evaluacionAlumno->update($request->all());

        return [ 'msj' => 'Evaluacion Actualizada' , compact('evaluacionAlumno')];
    }

    public function calificar($evaluacion, $nu_calificacion)
    {
        $maxCalificacion  = Calificacion::max('nu_hasta');

        $peso             = ($evaluacion->nu_peso == 0 ) ? 0.01 :  $evaluacion->nu_peso;

        $porcentaje       = $nu_calificacion * 100 / $peso ;
        
        $nu_calificacion  = round( ($maxCalificacion * $porcentaje / 100), 2, PHP_ROUND_HALF_UP);

        $calificacion     = Calificacion::where('nu_desde' ,'<=', $nu_calificacion )->where('nu_hasta' ,'>=', $nu_calificacion )->first();

        return $calificacion->id;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function iniciarPrueba(Request $request, EvaluacionAlumno $evaluacionAlumno)
    {
        $validate = request()->validate([
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge([  
                            'id_status'     => $evaluacionAlumno->ejecucion(), 
                            'fe_evaluacion' => date("Y-m-d") ,
                            'hh_inicio'     => date('H:i:s')
                        ]);

        $update = $evaluacionAlumno->update($request->all());

        return [ 'msj' => 'Cuestionario Iniciado', compact('update') ];
    }

    public function finalizarPrueba(Request $request, EvaluacionAlumno $evaluacionAlumno)
    {
        $validate = request()->validate([
			'id_usuario'   => 	'required|integer|max:999999999',
        ]);

        $request->merge([  
                            'id_status'  => $evaluacionAlumno->ejecutada(), 
                            'hh_fin'     => date('H:i:s')
                        ]);        
        
        $update = $evaluacionAlumno->update($request->all());

        return [ 'msj' => 'Cuestionario Finalizado', compact('update') ];
    }


    public function finalizarTarea(Request $request, EvaluacionAlumno $evaluacionAlumno)
    {
        $validate = request()->validate([
			'id_usuario'   => 	'required|integer|max:999999999',
        ]);

        $request->merge([  
                            'id_status'     => $evaluacionAlumno->ejecutada(), 
                            'fe_evaluacion' => date("Y-m-d") ,
                            'hh_fin'        => date('H:i:s')
                        ]);        
        
        $update = $evaluacionAlumno->update($request->all());

        return [ 'msj' => 'Tarea Entregada', compact('update') ];
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
