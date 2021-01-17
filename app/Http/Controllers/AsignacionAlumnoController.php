<?php

namespace App\Http\Controllers;

use App\Models\AsignacionAlumno;
use App\Models\EvaluacionAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class AsignacionAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return AsignacionAlumno::with([])
                    ->get();
    }

    public function asignacionAlumnoGrupo($idGrupo)  //TODO  Extraer Querys
    {
        $asignaciones = AsignacionAlumno::with([
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

        $evaluaciones = EvaluacionAlumno::with([
                                'alumno:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                'evaluacion:id,id_tipo_evaluacion,id_materia,id_tema,id_origen,tx_origen,fe_inicio,fe_fin',
                                'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion,tx_icono,tx_color',
                                'evaluacion.materia:id,nb_materia',
                                'evaluacion.tema:id,nb_tema',
                                'evaluacion.origen'
                            ])
                            ->whereHas('alumno.grupo', function (Builder $query) use($idGrupo) {
                                $query->where('grupo.id', $idGrupo);
                            })
                            ->get();                     
        
        return $this->formatDataAlumnos($asignaciones, $evaluaciones);
    }

    public function formatDataAlumnos($asignacionesAlumno, $evaluacionesAlumno)
    {
        $data = [];

        foreach ($evaluacionesAlumno as $evaluacionAlumno) //data[tipo][materia]
        { 
            $alumno         = $evaluacionAlumno->alumno->nb_alumno;
            $evaluacion     = $evaluacionAlumno->evaluacion;
            $tipoEvaluacion = $evaluacion->tipoEvaluacion->nb_tipo_evaluacion;
            $data[$alumno]['evaluacion'][$tipoEvaluacion][] = $evaluacionAlumno;
        }

        foreach ($asignacionesAlumno as $asignacionAlumno) //data[tipo][materia]
        { 
            $alumno         = $asignacionAlumno->alumno->nb_alumno;
            $asignacion     = $asignacionAlumno->asignacion;
            $tipoAsignacion = $asignacion->tipoAsignacion->nb_tipo_asignacion;
            $data[$alumno]['asignacion'][$tipoAsignacion][] = $asignacionAlumno;
        }

        return $data;
    }


    public function asignacionAlumnoAlumno($idAlumno)  //TODO  Extraer Querys
    {
        $asignaciones = AsignacionAlumno::with([
                                'asignacion:id,id_tipo_asignacion,id_materia,id_tema,id_origen,tx_origen,fe_inicio,fe_fin',
                                'asignacion.tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color,tx_criterio,nu_tiempo',
                                'asignacion.materia:id,nb_materia',
                                'asignacion.tema:id,nb_tema',
                                'asignacion.origen'
                            ])
                            ->where('id_alumno', $idAlumno)
                            ->get(); 

        return $this->formatData($asignaciones);
    }

    public function formatData($asignacionesAlumno)
    {
        $data = [];

        foreach ($asignacionesAlumno as $asignacionAlumno) //data[tipo][materia]
        { 
            $asignacion = $asignacionAlumno->asignacion;
            $data[$asignacion->tipoAsignacion->nb_tipo_asignacion][] = $asignacionAlumno;
        }

        return $data;
    }

    public function asignacionEvaluacionAlumno($idAlumno)  //TODO  Extraer Querys
    {
        $asignaciones = AsignacionAlumno::with([
                                'asignacion:id,id_tipo_asignacion,id_materia,id_tema,id_origen,tx_origen',
                                'asignacion.tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color',
                                'asignacion.origen'
                            ])
                            ->where('id_alumno', $idAlumno)
                            ->get(); 

        $evaluaciones = EvaluacionAlumno::with([
                                'evaluacion:id,id_tipo_evaluacion,id_materia,id_tema,id_origen,tx_origen',
                                'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion,tx_icono,tx_color',
                                'evaluacion.origen'
                            ])
                            ->where('id_alumno', $idAlumno)
                            ->get();

        return $this->formatResponse($asignaciones, $evaluaciones);
    }

    public function formatResponse($asignaciones, $evaluaciones)
    {
        $data = [];

        foreach ($asignaciones as $asignacion) 
        { 
            $data[$asignacion->asignacion->tipoAsignacion->nb_tipo_asignacion][] = $asignacion;
        }

        foreach ($evaluaciones as $evaluacion)
        { 
            $data[$evaluacion->evaluacion->tipoEvaluacion->nb_tipo_evaluacion][] = $evaluacion;
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
            'id_asignacion'     => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'fe_completado'     => 	'nullable|date',
			'nu_calificacion'   => 	'required|integer|max:999999999',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'fe_acceso'         => 	'nullable|integer|max:999999999',
			'nu_accesos'        => 	'nullable|integer|max:999999999',
			'nu_minutos'        => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asignacionAlumno = asignacionAlumno::create($request->all());

        return [ 'msj' => 'AsignacionAlumno Agregado Correctamente', compact('asignacionAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AsignacionAlumno  $asignacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(AsignacionAlumno $asignacionAlumno)
    {
        return $asignacionAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AsignacionAlumno  $asignacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AsignacionAlumno $asignacionAlumno)
    {
        $validate = request()->validate([
            'id_asignacion'     => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'fe_completado'     => 	'nullable|date',
			'nu_calificacion'   => 	'required|integer|max:999999999',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'fe_acceso'         => 	'nullable|integer|max:999999999',
			'nu_accesos'        => 	'nullable|integer|max:999999999',
			'nu_minutos'        => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asignacionAlumno = $asignacionAlumno->update($request->all());

        return [ 'msj' => 'AsignacionAlumno Editado' , compact('asignacionAlumno')];
    }

    public function acceso(Request $request, AsignacionAlumno $asignacionAlumno)
    {
        $validate = request()->validate([
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge(['fe_acceso' => date("Y-m-d H:i:s")]);

        $update = $asignacionAlumno->update($request->all());

        $asignacionAlumno->increment('nu_accesos');

        return [ 'msj' => 'Asignacion iniciada' , compact('update')];
    }

    public function completada(Request $request, AsignacionAlumno $asignacionAlumno)
    {
        $validate = request()->validate([
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge(['fe_completado' => date("Y-m-d H:i:s")]);

        $update = $asignacionAlumno->update($request->all());

        return [ 'msj' => 'Asignacion Completada' , compact('update')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AsignacionAlumno  $asignacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(AsignacionAlumno $asignacionAlumno)
    {
        $asignacionAlumno = $asignacionAlumno->delete();
 
        return [ 'msj' => 'AsignacionAlumno Eliminado' , compact('asignacionAlumno')];
    }
}
