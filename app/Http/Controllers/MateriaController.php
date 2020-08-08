<?php

namespace App\Http\Controllers;

use App\Models\Materia;
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

    public function materiaAlumno($idAlumno)
    {
        $materia = Materia::select('id', 'nb_materia')
                    ->whereHas('alumno', function ($query) use ($idAlumno) {
                        $query->where('alumno.id', $idAlumno);
                    }) 
                    ->orderBY('nb_materia')
                    ->get();

                return $materia;
    }

    public function materiaDocenteAlumno($idAlumno)
    {
        $idPeriodo = 1; //TODO    = \Auth::user();//->colegio->calendario->periodoActivo->nb_periodo;
        
        $materia = Materia::with([
                        'planEvaluacion' => function($query) use ( $idPeriodo, $idAlumno ){
                            $query->whereHas('grupo.alumno', function ($query) use ($idPeriodo, $idAlumno) {
                                $query->where('alumno.id', $idAlumno);
                            })->where('id_periodo',$idPeriodo )->activo();
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
                    ->orderBY('nb_materia')
                    ->get();

                return $materia;
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
