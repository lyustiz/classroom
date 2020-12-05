<?php

namespace App\Http\Controllers;

use App\Models\Asignacion;
use App\Models\TipoAsignacion;
use App\Models\Alumno;
use App\Models\AsignacionAlumno;
use App\Models\Evaluacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use App\Http\Controllers\Traits\NotificacionTrait;

class AsignacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Asignacion::with([])
                    ->get();
    }

    public function asignacionGrupo($idGrupo)  //TODO  Extraer Querys
    {
        $asignacion =   Asignacion::with([
                                    'tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color',
                                    'materia:id,nb_materia',
                                    'tema:id,nb_tema',
                                    'origen'
                            ])
                            ->where('id_grupo', $idGrupo)
                            ->orderBy('fe_inicio', 'asc')
                            ->get(); 
                            
        $evaluacion = Evaluacion::with([
                                'tipoEvaluacion:id,nb_tipo_evaluacion',
                                'materia:id,nb_materia',
                                'origen',
                        ])
                        ->where('id_grupo',$idGrupo)
                        ->orderBy('fe_inicio', 'asc')
                        ->get();

                        return [
                            'plan'   => $this->formatData($asignacion, $evaluacion),
                        ];
    }

    public function asignacionGrupoAlumnos($idGrupo)  //TODO  Extraer Querys
    {
        $asignacion =   Asignacion::with([
                                    'asignacionAlumno:asignacion_alumno.id,id_alumno,fe_completado,fe_acceso,nu_accesos',
                                    'asignacionAlumno.alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                    'tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color',
                                    'materia:id,nb_materia',
                                    'tema:id,nb_tema',
                                    'origen'
                            ])
                            ->where('id_grupo', $idGrupo)
                            ->orderBy('fe_inicio', 'asc')
                            ->get();

                            
        $evaluacion = Evaluacion::with([
                                'evaluacionAlumno:evaluacion_alumno.id,id_alumno,fe_evaluacion',
                                'evaluacionAlumno.alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                'tipoEvaluacion:id,nb_tipo_evaluacion',
                                'materia:id,nb_materia',
                                'origen',
                        ])
                        ->where('id_grupo',$idGrupo)
                        ->orderBy('fe_inicio', 'asc')
                        ->get();

                        return [
                            'plan'   => $this->formatData($asignacion, $evaluacion),
                        ];
    }

    public function asignacionAlumno($idAlumno)  //TODO  Extraer Querys
    {
        $asignacion =   Asignacion::with([
                                    'tipoAsignacion:tipo_asignacion.id,nb_tipo_asignacion,tx_icono,tx_color',
                                    'asignacionAlumno' => function($query) use ( $idAlumno ){
                                        $query->where('asignacion_alumno.id_alumno' , $idAlumno);
                                    },
                                    'materia:materia.id,nb_materia',
                                    'tema:tema.id,nb_tema',
                                    'origen' => function (MorphTo $morphTo) {
                                        $morphTo->morphWith([
                                            Enlace::class    => ['enlace:id:nb_enlace'],
                                            Recurso::class   => ['recurso:recurso.id'],
                                            Actividad::class => ['actividad:actividad.id']
                                        ]);
                                    }
                            ])
                            ->whereHas('grupo.alumno', function (Builder $query) use($idAlumno) {
                                $query->where('alumno.id', $idAlumno);
                            })
                            ->orderBy('fe_inicio', 'asc')
                            ->get(); 
                            
        $evaluacion = Evaluacion::with([
                                'tipoEvaluacion:tipo_evaluacion.id,nb_tipo_evaluacion',
                                'evaluacionAlumno' => function($query) use ( $idAlumno ){
                                    $query->where('evaluacion_alumno.id_alumno' , $idAlumno);
                                },
                                'materia:materia.id,nb_materia',
                                'origen' => function (MorphTo $morphTo) {
                                    $morphTo->morphWith([
                                        Prueba::class => ['prueba:id:nb_prueba'],
                                    ]);
                                }
                        ])
                        ->whereHas('grupo.alumno', function (Builder $query) use($idAlumno) {
                            $query->where('alumno.id', $idAlumno);
                        })
                        ->orderBy('fe_inicio', 'asc')
                        ->get();

                        return [
                            'plan'   => $this->formatData($asignacion, $evaluacion),
                        ];
    }

    public function formatData($asignaciones, $evaluaciones)
    {
        $data = [];

        foreach ($evaluaciones as $evaluacion) //data[dia][tipo][materia]
        { 
            $data[$evaluacion->fe_inicio][$evaluacion->tipoEvaluacion->nb_tipo_evaluacion][$evaluacion->materia->nb_materia][] = $evaluacion;
        }

        foreach ($asignaciones as $asignacion) //data[dia][tipo][materia]
        { 
            $data[$asignacion->fe_inicio][$asignacion->tipoAsignacion->nb_tipo_asignacion][$asignacion->materia->nb_materia][] = $asignacion;
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
            'id_grupo'           => 'required|integer|max:999999999',
			'id_tipo_asignacion' => 'required|integer|max:999999999',
			'id_materia'         => 'required|integer|max:999999999',
			'id_tema'            => 'required|integer|max:999999999',
			'id_origen'          => 'required|array',
			'tx_origen'          => 'required|string|max:80',
			'fe_inicio'          => 'required|date|before_or_equal:fe_fin',
            'fe_fin'             => 'nullable|date',
			'tx_observaciones'   => 'nullable|string|max:100',
			'id_status'          => 'required|integer|max:999999999',
            'id_usuario'         => 'required|integer|max:999999999',
        ]);

        $asignaciones        = [];
        $asignacionesAlumnos = [];
        $notificacion        = [];
        
        foreach ($validate['id_origen'] as $id_origen) {
            $data = $validate;
            $data['id_origen']   = $id_origen;
            $asignacion          = Asignacion::create($data);
            $asignaciones[]      = $asignacion;
            $asignacionesAlumnos = $this->asignacionAlumnos($asignacion);

            $notificacion = NotificacionTrait::asignacion([ 
                'id_tipo_asignacion' => $request->id_tipo_asignacion, 
                'tx_origen'          => $request->tx_origen,
                'alumnos'            => $asignacionesAlumnos['alumnos'],
                'id_materia'         => $request->id_materia,
                'fe_inicio'          => $request->fe_inicio,
                'id_usuario'         => $request->id_usuario
            ]);
        }

        return [ 'msj' => 'Asignacion Agregada Correctamente', compact('asignaciones') ];
    }

    public function asignacionAlumnos(Asignacion $asignacion)
    {
        $alumnos  = Alumno::select('id')
                            ->whereHas('matricula', function (Builder $query) use($asignacion) {
                                $query->where('id_grupo', $asignacion->id_grupo);
                            })
                            ->activo()
                            ->get();
        
        $asignacionAlumnos = [];

        foreach ($alumnos as $alumno) 
        {
            $asignacionAlumnos[] = [
                                    'id_asignacion' => $asignacion->id,
                                    'id_alumno'     => $alumno->id,
                                    'id_usuario'    => $asignacion->id_usuario,
                                    'id_status'     => 1,
                                    'created_at'    => date('Y-m-d H:i:s'),
                                ];
        }

        return [ 'asignacionAlumno' => AsignacionAlumno::insert($asignacionAlumnos), 'alumnos' => $alumnos ] ;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Asignacion  $asignacion
     * @return \Illuminate\Http\Response
     */
    public function show(Asignacion $asignacion)
    {
        return $asignacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Asignacion  $asignacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Asignacion $asignacion)
    {
        $validate = request()->validate([
            'id_grupo'          => 	'required|integer|max:999999999',
			'id_tipo_asignacion'=> 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_tema'           => 	'required|integer|max:999999999',
			'id_origen'         => 	'required|integer|max:999999999',
			'tx_origen'         => 	'required|string|max:80',
			'fe_inicio'         =>  'required|date|before_or_equal:fe_fin',
            'fe_fin'            =>  'nullable|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asignacion = $asignacion->update($request->all());

        return [ 'msj' => 'Asignacion Editado' , compact('asignacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Asignacion  $asignacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Asignacion $asignacion)
    {
        $completado = AsignacionAlumno::where('id_asignacion',$asignacion->id )->whereNotNull('fe_completado')->exists();

        if($completado)
        {
            throw ValidationException::withMessages(['poseeCompletados' => "Existen Alumnos que Completaron la Actividad"]);

        } else
        {
            $delAlumnos = AsignacionAlumno::where('id_asignacion', $asignacion->id )->delete();
        }
        
        $asignacion = $asignacion->delete();
 
        return [ 'msj' => 'Asignacion Eliminada' , compact('asignacion', 'delAlumnos')];
    }
}
