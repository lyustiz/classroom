<?php

namespace App\Http\Controllers;

use App\Models\Prueba;
use App\Models\PruebaAlumno;
use App\Models\EvaluacionAlumno;
use App\Models\Calificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;


class PruebaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Prueba::with([
                                'grado:id,nb_grado', 
                                'grupo:id,nb_grupo', 
                                'materia:id,nb_materia',
                                'docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2'
                            ])
                            ->get();
    }

    public function pruebaDocente($idDocente)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo','materia:id,nb_materia'])
                      ->where('id_docente', $idDocente)
                      ->get();
    }

    public function pruebaDocenteGradoMateria($idDocente, $idGrado, $idMateria)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo','materia:id,nb_materia', 'status:id,nb_status'])
                      ->where('id_docente', $idDocente)
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
                      ->orderBy('created_at', 'desc')
                      ->get();
    }

    public function pruebaDocenteGradoPendiente($idDocente, $idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo','materia:id,nb_materia'])
                      ->where('id_docente', $idDocente)
                      ->pendiente()
                      ->get();
    }

    public function pruebaDocenteGradoMateriaPendiente($idDocente, $idGrado, $idMateria)
    {
        return  Prueba::with([  'grado:id,nb_grado',
                                'materia:id,nb_materia',
                            ])
                      ->where('id_docente', $idDocente)
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
                      ->pendiente()
                      ->get();
    }

    public function pruebaDocenteGradoMateriaAsignada($idDocente, $idGrado, $idMateria)
    {
        return  Prueba::with([
                            'grado:grado.id,nb_grado', 
                            'grupo:grupo.id,nb_grupo',
                            'materia:materia.id,nb_materia', 
                            'evaluacion:id,id_tipo_evaluacion,tx_tema',
                            'evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion',
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento'
                       ])
                      ->where('id_docente', $idDocente)
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
                      ->whereHas('evaluacion.planEvaluacion', function (Builder $query) {
                            $query->has('periodoActivo');
                      })
                      ->asignada()
                      ->get();
    }

    public function pruebaDocenteEjecutar($idDocente)
    {
        return  Prueba::with([
                            'status:id,nb_status,tx_color,tx_icono',
                            'grado:grado.id,nb_grado', 
                            'grupo:grupo.id,nb_grupo',
                            'materia:materia.id,nb_materia', 
                            'pregunta:id,nb_pregunta',
                            'pregunta.tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color',
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento'
                       ])
                      ->where('id_docente', $idDocente)
                      ->ejecutar()
                      ->get();
    }

    public function pruebaDocenteEvaluar($idDocente)
    {
        return  Prueba::with([
                            'status:id,nb_status,tx_color,tx_icono',
                            'grado:grado.id,nb_grado',
                            'grupo:grupo.id,nb_grupo',
                            'materia:materia.id,nb_materia', 
                            'pregunta:id,nb_pregunta',
                            'pregunta.tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color',
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento'
                       ])
                      ->where('id_docente', $idDocente)
                      ->orderBy('fe_prueba', 'desc')
                      ->evaluar()
                      ->get();
    }

    public function pruebaGrado($idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                      ->where('id_grado', $idGrado)
                      ->get();
    }

    public function pruebaGradoImportar($idPrueba, $idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                      ->where('id_grado', $idGrado)
                      ->where('id', '<>', $idPrueba)
                      ->get();
    }

    //alumno
    public function pruebaAlumno($idAlumno)
    {
        return  Prueba::with([
                            'status:id,nb_status,tx_color,tx_icono',
                            'materia:materia.id,nb_materia', 
                            'pregunta:id,id_prueba,nu_orden',
                            'pregunta.respuestaAlumno:id,id_respuesta,id_pregunta',
                            'pruebaAlumno' => function($query) use ( $idAlumno ) {
                                $query->select('id', 'id_prueba', 'fe_prueba', 'hh_fin')
                                      ->where('id_alumno' , $idAlumno);
                            },
                        ])
                        ->whereHas('pruebaAlumno', function ($query) use ($idAlumno) {
                            $query->where('id_alumno', $idAlumno);
                        })
                        ->ejecucion()
                        ->get();
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
            'nb_prueba'        =>  'required|string|max:100',
            'id_grado'         =>  'required|integer|max:999999999',
            'id_grupo'         =>  'nullable|integer|max:999999999',
            'id_materia'       =>  'required|integer|max:999999999',
            'id_docente'       =>  'required|integer|max:999999999',
			'id_evaluacion'    =>  'nullable|integer|max:999999999',
			'bo_ver_resultado' =>  'required|boolean',
			'nu_minutos'       =>  'nullable|integer|max:999999999',
			'fe_prueba'        =>  'nullable|date',
			'hh_inicio'        =>  'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'           =>  'nullable|date_format:"H:i"',
			'nu_valor_total'   =>  'nullable|integer|max:999999999',
			'tx_observaciones' =>  'nullable|string|max:100',
			'id_status'        =>  'required|integer|max:999999999',
			'id_usuario'       =>  'required|integer|max:999999999',
        ]);

        $prueba = prueba::create($request->all());

        return [ 'msj' => 'Prueba Creada Correctamente', compact('prueba') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function show(Prueba $prueba)
    {
        return $prueba;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
            'nb_prueba'        =>  'required|string|max:100',
            'id_grado'         =>  'required|integer|max:999999999',
            'id_grupo'         =>  'nullable|integer|max:999999999',
            'id_materia'       =>  'required|integer|max:999999999',
            'id_docente'       =>  'required|integer|max:999999999',
			'id_evaluacion'    =>  'nullable|integer|max:999999999',
			'bo_ver_resultado' =>  'required|boolean',
			'nu_minutos'       =>  'nullable|integer|max:999999999',
			'fe_prueba'        =>  'nullable|date',
			'hh_inicio'        =>  'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'           =>  'nullable|date_format:"H:i"',
			'nu_valor_total'   =>  'nullable|integer|max:999999999',
			'tx_observaciones' =>  'nullable|string|max:100',
			'id_status'        =>  'required|integer|max:999999999',
			'id_usuario'       =>  'required|integer|max:999999999',
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Actualizada' , compact('prueba')];
    }

    public function asignar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
            'id_evaluacion' =>  'required|integer|max:999999999',
            'id_grupo'      =>  'required|integer|max:999999999',
			'id_usuario'    =>  'required|integer|max:999999999',
        ]);

        $request->merge(['id_status' => $prueba->asignada()]);
        
        $hasAsignados  = $this->asignarAlumnos($prueba, $request->id_evaluacion);
        
        if($hasAsignados)
        {
            $update  = $prueba->update($request->all());
        } else {
            throw ValidationException::withMessages(['noAsignable' => "La evaluacion seleccionada, tiene todos los alumnos asignados"]);
        }

        return [ 'msj' => 'Prueba Asignada' , compact('update')];
    }

    public function asignarAlumnos($prueba, $idEvaluacion)
    {
        $totalAlumnos =  $prueba->evaluacion->evaluacionAlumno->pluck('id_alumno')->toArray();

        $aignados = PruebaAlumno::whereHas('prueba', function (Builder $query) use($prueba, $idEvaluacion) {
                                        $query->where('id_evaluacion', $idEvaluacion)
                                              ->where('id','<>', $prueba->id);
                                    })
                                    ->get()->pluck('id_alumno')->toArray();

        $porAsignar = array_diff($totalAlumnos, $aignados);

        if(count($porAsignar) > 0)
        {
            $alumnos   = [];

            foreach ($porAsignar as $key => $idAlumno) {
               
                $alumnos[] = [
                    'id_prueba'  =>  $prueba->id,
                    'id_alumno'  =>  $idAlumno,
                    'id_usuario' =>  $prueba->id_usuario,
                    'id_status'  =>  1,
                ];
            }

            return PruebaAlumno::insert($alumnos);

        } else {
        
            return false;
        }
    }

    public function remover(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'id_usuario'    =>  'required|integer|max:999999999',
        ]);

        $request->merge(['id_status' => $prueba->pendiente()]);

        $delete = PruebaAlumno::where('id_prueba', $prueba->id)->delete();

        $update = $prueba->update($request->all());

        return [ 'msj' => 'Prueba pendiente por Asignacion' , compact('update', 'delete')];
    }

    public function ejecutar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'bo_ver_resultado'  => 	  'required|boolean',
			'nu_minutos'        => 	  'required|integer|max:999999999',
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);
        
        $date = Carbon::now();

        $request->merge([
            'fe_prueba'        => $date->toDateString(),
            'hh_inicio'        => $date->toTimeString(),
            'hh_fin'           => $date->addMinute($request->nu_minutos)->toTimeString(),
            'nu_valor_total'   => $prueba->pregunta()->sum('nu_valor'),
            'id_status'        => $prueba->ejecucion(),
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba en Ejecucion' , compact('prueba')];
    }

    public function cancelar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'id_usuario'      => 	  'required|integer|max:999999999',
        ]);
        
        $request->merge([
            'fe_prueba'       => null,
            'hh_inicio'       => null,
            'hh_fin'          => null,
            'nu_valor_total'  => null,
            'id_status'       => $prueba->asignada()
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Cancelada' , compact('prueba')];
    }

    public function reiniciar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);
        
        $request->merge([
            'fe_prueba'       => null,
            'hh_inicio'       => null,
            'hh_fin'          => null,
            'nu_valor_total'  => null,
            'id_status'       => $prueba->asignada()
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Reiniciada' , compact('prueba')];
    }

    public function cerrar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);
        
        $request->merge([
            'id_status'       => $prueba->cerrada()
        ]);

        $pruebasPendientes = PruebaAlumno::where('id_status', '<', 5)
                            ->where('id_prueba', $prueba->id)
                            ->count();

        if($pruebasPendientes > 0)
        {
            throw ValidationException::withMessages(['pendientes' => "Existe(n) $pruebasPendientes prueba(s) por evaluar"]);
        }
        
        $this->setEvaluacionAlumno($prueba);

        $update = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Cerrada' , compact('update')];
    }


    public function setEvaluacionAlumno($prueba)
    {
        $evaluaciones = [];

        $evaluacion      = $prueba->evaluacion;

        $maxCalificacion  = Calificacion::max('nu_calificacion');

        //todo  update
        foreach ($prueba->pruebaAlumno as $key => $pruebaAlumno) {
            $evaluaciones[] =   [
                                    'id_evaluacion'    => $prueba->id_evaluacion,
                                    'id_alumno'        => $pruebaAlumno->id_alumno,
                                    'nu_calificacion'  => $pruebaAlumno->nu_calificacion,
                                    'id_calificacion'  => $pruebaAlumno->id_calificacion,
                                    'id_status'        => 1,
                                    'id_usuario'       => $prueba->id_usuario
                                ];

            $calculo = $this->calcularCalificacion($evaluacion, $pruebaAlumno->calificacion, $maxCalificacion);

            $evaluaciones[] = EvaluacionAlumno::where('id_evaluacion', $prueba->id_evaluacion)
                                              ->where('id_alumno',     $pruebaAlumno->id_alumno)
                                              ->update([
                                                'nu_calificacion'  => $calculo['puntos'],
                                                'id_calificacion'  => $calculo['calificacion']->id
                                              ]);
                                
        }
        return $evaluaciones;
    }

    public function calcularCalificacion($evaluacion, $calificacion, $maxCalificacion) //TODO TRAIT
    {

        $calificacion     = $calificacion->nu_calificacion;

        $peso             = $evaluacion->nu_peso;

        //calculo   maxnota * %peso * %calificacion  eje: 20 * 25% * 50%  = 2.5  == 20 * (25/100) * (10/20) = 2.5

        $percPeso          = $peso / 100; 

        $percCalificacion  = $calificacion  / $maxCalificacion; 
        
        $puntos            = round(($maxCalificacion * $percPeso * $percCalificacion), 2, PHP_ROUND_HALF_UP);

        $calificacion      =  Calificacion::where('nu_calificacion', '>=', (round($puntos, 0, PHP_ROUND_HALF_UP )) )->first();
        
        return ['calificacion' => $calificacion, 'puntos' => $puntos];
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function destroy(Prueba $prueba)
    {
        if($prueba->alumno->count() > 0)
        {
            throw ValidationException::withMessages(['poseeAsignacion' => "Posee Alumnos asignados"]);
        }
        
        $prueba = $prueba->delete();
 
        return [ 'msj' => 'Prueba Eliminada' , compact('prueba')];
    }
}
