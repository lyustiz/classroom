<?php

namespace App\Http\Controllers;

use App\Models\Materia;
use App\Models\Periodo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $materia = Materia::with(['areaEstudio:id,nb_area_estudio'])
                    ->orderBy('nb_materia', 'asc')
                    ->get();
        
        return $materia;
    }


    public function materiaAreaEstudio($idAreaEstudio)
    {
        $materia = Materia::select('id', 'nb_materia')
                ->where('id_area_estudio',  $idAreaEstudio)
                ->orderBY('nb_materia', 'asc')
                ->get();

                return $materia;
    }

    public function materiaGrado($idGrado)
    {
        $materia = Materia::select('id', 'nb_materia')
                    ->whereHas('grado', function ($query) use ($idGrado) {
                        $query->where('grado.id', $idGrado);
                    }) 
                    ->orderBY('nb_materia')
                    ->get();

                return $materia;
    }

    public function materiaGrupo($idGrupo)
    {
        $materia = Materia::select('id', 'nb_materia')
                    ->whereHas('grupo', function ($query) use ($idGrupo) {
                        $query->where('grupo.id', $idGrupo);
                    }) 
                    ->orderBY('nb_materia')
                    ->get();

                return $materia;
    }

    public function materiaGrupoDocente($idGrupo, $idDocente)
    {
        $materia = Materia::select('id', 'nb_materia')
                    ->whereHas('grupo', function ($query) use ($idGrupo) {
                        $query->where('grupo.id', $idGrupo);
                    }) 
                    ->whereHas('docente', function ($query) use ($idDocente) {
                        $query->where('docente.id', $idDocente);
                    })
                    ->orderBY('nb_materia')
                    ->get();

                return $materia;
    }

    public function materiaGrupoAlumnoDocente($idDocente)
    {
        $materia = Materia::with([
                            'grupo' => function($query) use ( $idDocente ){
                                $query->whereHas('planEvaluacion', function ($query) use ( $idDocente) {
                                    $query->where('id_docente', $idDocente)
                                          ->has('periodoActivo');
                                })
                                ->has('calendarioActivo')
                                ->orderBy('id_grado', 'asc')
                                ->orderBy('nu_orden', 'asc');
                            },
                            'grupo.alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento',
                            'grupo.alumno.foto:id,tx_src,id_tipo_foto,id_origen',
                            'grupo.alumno.foto.tipoFoto:id,tx_base_path',
                            'grupo.alumno.usuarioAlumno:id,nb_usuario,id_origen'
                        ])
                        ->select('id', 'nb_materia')
                        ->whereHas('docente', function ($query) use ($idDocente) {
                            $query->where('docente.id', $idDocente);
                        })
                        ->orderBY('nb_materia')
                        ->get();

                return $materia;
    }

    public function materiaAlumno($idAlumno)
    {
        $materia = Materia::with(['areaEstudio:id,tx_color'])
                    ->select('id', 'nb_materia', 'id_area_estudio')
                    ->whereHas('alumno', function ($query) use ($idAlumno) {
                        $query->where('alumno.id', $idAlumno);
                    }) 
                    ->orderBY('nb_materia')
                    ->get();

                return $materia;
    }

    public function materiaDocenteAlumno($idAlumno)
    {
        
        return  Materia::with([
                    'planEvaluacion' => function($query) use ( $idAlumno ){
                        $query->whereHas('grupo.alumno', function ($query) use ( $idAlumno) {
                            $query->where('alumno.id', $idAlumno);
                        })
                        ->has('periodoActivo');
                    },
                    'planEvaluacion.materia'=> function($query) use ( $idAlumno ){
                        $query->has('alumno');
                    },
                    'planEvaluacion.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                    'planEvaluacion.docente.foto:id,tx_src,id_tipo_foto,id_origen',
                    'planEvaluacion.docente.foto.tipoFoto:id,tx_base_path',
                ])
                ->comboData()
                ->whereHas('alumno', function ($query) use ($idAlumno) {
                    $query->where('alumno.id', $idAlumno);
                }) 
                ->has('planEvaluacion')
                ->orderBY('nb_materia')
                ->get();
    }

    public function materiaEvaluacionAlumno($idAlumno)
    {
      
        return  Materia::with([
                        'planEvaluacion' => function($query) use ( $idAlumno ){
                            $query->whereHas('grupo.alumno', function ($query) use ($idAlumno) {
                                $query->where('alumno.id', $idAlumno);
                            })->has('periodoActivo')
                            ->activo();
                        },
                        'planEvaluacion.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                        'planEvaluacion.evaluacion',
                        'planEvaluacion.evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion',
                        'planEvaluacion.evaluacion.evaluacionMetodo:id,nb_evaluacion_metodo,tx_icono,tx_color',
                        'planEvaluacion.evaluacion.archivo',
                        'planEvaluacion.evaluacion.archivo.tipoArchivo:id,tx_base_path',
                        'planEvaluacion.evaluacion.evaluacionAlumno'=> function($query) use ( $idAlumno ){
                            $query->where('id_alumno', $idAlumno);
                        },
                        'planEvaluacion.evaluacion.evaluacionAlumno.archivo',
                        'planEvaluacion.evaluacion.evaluacionAlumno.calificacion',
                        'planEvaluacion.evaluacion.status:id,nb_status,tx_icono,tx_color'
                    ])
                    ->comboData()
                    ->whereHas('alumno', function ($query) use ($idAlumno) {
                        $query->where('alumno.id', $idAlumno);
                    }) 
                    ->has('planEvaluacion')
                    ->orderBY('nb_materia')
                    ->get();
    }

    public function materiaEvaluacionGrupoDocente($idGrupo, $idDocente)
    {
      
        return  Materia::with([
                        'planEvaluacion' => function($query) use ( $idGrupo, $idDocente ){
                            $query->where('id_grupo', $idGrupo)->where('id_docente', $idDocente)->has('periodoActivo')->activo();
                        },
                        'planEvaluacion.evaluacion',
                        'planEvaluacion.evaluacion.tipoEvaluacion:id,nb_tipo_evaluacion',
                        'planEvaluacion.evaluacionAlumno',
                    ])
                    ->comboData()
                    ->whereHas('planEvaluacion', function ($query) use ($idGrupo, $idDocente) {
                        $query->where('id_grupo', $idGrupo)->where('id_docente', $idDocente)->has('periodoActivo')->activo();
                    }) 
                    ->orderBY('nb_materia')
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
            'nb_materia'        => 	'required|string|max:40',
			'co_materia'        => 	'nullable|string|max:20',
			'id_area_estudio'   => 	'required|integer|max:999999999',
			'tx_icono'          => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $materia = materia::create($request->all());

        return [ 'msj' => 'Materia Agregada Correctamente', compact('materia') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Materia  $materia
     * @return \Illuminate\Http\Response
     */
    public function show(Materia $materia)
    {
        return $materia;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Materia  $materia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Materia $materia)
    {
        $validate = request()->validate([
            'nb_materia'        => 	'required|string|max:40',
			'co_materia'        => 	'nullable|string|max:20',
			'id_area_estudio'   => 	'required|integer|max:999999999',
			'tx_icono'          => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $materia = $materia->update($request->all());

        return [ 'msj' => 'Materia Editada' , compact('materia')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Materia  $materia
     * @return \Illuminate\Http\Response
     */
    public function destroy(Materia $materia)
    {
        $materia = $materia->delete();
 
        return [ 'msj' => 'Materia Eliminado' , compact('materia')];
    }
}
