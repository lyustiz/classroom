<?php

namespace App\Http\Controllers;

use App\Models\CargaHoraria;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;
use App\Http\Controllers\Controller;

class CargaHorariaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cargaHoraria = CargaHoraria::with(['turno:id,nb_turno', 'horaAcademica:id,nb_hora_academica'])
                    ->get();
        
        return $cargaHoraria;
    }


    public function cargaHorariaHorario($idHorario)
    {
        $cargaHoraria = CargaHoraria::with([
                                        'detalleHorario'=> function($query) use ( $idHorario ){
                                            $query->select( 
                                                            'id',
                                                            'id_carga_horaria',
                                                            'nu_carga_horaria',
                                                            'id_dia_semana',
                                                            'id_horario',
                                                            'id_materia',
                                                            'id_docente',
                                                            'id_aula'
                                                           )
                                                  ->where('id_horario' , $idHorario);
                                        },
                                        'detalleHorario.materia:id,nb_materia,id_area_estudio',
                                        'detalleHorario.materia.areaEstudio:id,tx_color',
                                        'detalleHorario.docente:id,nb_nombre,nb_apellido',
                                        'detalleHorario.aula:id,nb_aula'
                                    ])
                                    ->get();

        return $cargaHoraria;
    }

    public function cargaHorariaAlumno($idAlumno)
    {
        $cargaHoraria = CargaHoraria::with([
                                        'detalleHorario'=> function($query) use ( $idHorario ){
                                            $query->select( 
                                                            'id',
                                                            'id_carga_horaria',
                                                            'nu_carga_horaria',
                                                            'id_dia_semana',
                                                            'id_horario',
                                                            'id_materia',
                                                            'id_docente',
                                                            'id_aula'
                                                           )
                                                  ->where('id_horario' , $idHorario);
                                        },
                                        'detalleHorario.materia:id,nb_materia,id_area_estudio',
                                        'detalleHorario.materia.areaEstudio:id,tx_color',
                                        'detalleHorario.docente:id,nb_nombre,nb_apellido',
                                        'detalleHorario.aula:id,nb_aula'
                                    ])
                                    ->get();

        return $cargaHoraria;
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
            'nb_carga_horaria'  => 	'required|string|max:80',
            'id_hora_academica' => 	'required|integer|max:999999999',
			'nu_orden'          => 	'required|integer|max:999999999',
			'hh_inicio'         => 	'required|date_format:"H:i"|before:hh_fin',
			'hh_fin'            => 	'required|date_format:"H:i"',
            'id_turno'          => 	'required|integer|max:999999999',
            'bo_receso'         => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $cargaHoraria = cargaHoraria::create($request->all());

        return [ 'msj' => 'Carga Horaria Agregada Correctamente', compact('cargaHoraria') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CargaHoraria  $cargaHoraria
     * @return \Illuminate\Http\Response
     */
    public function show(CargaHoraria $cargaHoraria)
    {
        return $cargaHoraria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CargaHoraria  $cargaHoraria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CargaHoraria $cargaHoraria)
    {
        $validate = request()->validate([
            'nb_carga_horaria'  => 	'required|string|max:80',
            'id_hora_academica' => 	'required|integer|max:999999999',
			'nu_orden'          => 	'required|integer|max:999999999',
			'hh_inicio'         => 	'required|date_format:"H:i"|before:hh_fin',
			'hh_fin'            => 	'required|date_format:"H:i"',
            'id_turno'          => 	'required|integer|max:999999999',
            'bo_receso'         => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $cargaHoraria = $cargaHoraria->update($request->all());

        return [ 'msj' => 'Carga Horaria Editado' , compact('cargaHoraria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CargaHoraria  $cargaHoraria
     * @return \Illuminate\Http\Response
     */
    public function destroy(CargaHoraria $cargaHoraria)
    {
        $cargaHoraria = $cargaHoraria->delete();
 
        return [ 'msj' => 'CargaHoraria Eliminado' , compact('cargaHoraria')];
    }
}
