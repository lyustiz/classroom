<?php

namespace App\Http\Controllers;

use App\Models\Horario;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class HorarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $horario = Horario::with([ 
                                    'horaAcademica:id,nb_hora_academica',
                                    'grupo:id,nb_grupo,id_grado', 
                                    'grupo.grado:id,nb_grado',
                                    'grupo.grado.materia:materia.id,nb_materia',
                                ])
                                ->get();
        
        return $horario;
    }

    public function horarioGrupo($idGrupo)
    {
        $horario = Horario::with([ 
                                    'grupo:id,nb_grupo,id_grado', 
                                    'detalleHorario:id,id_horario,id_materia,id_docente,id_dia_semana,id_aula,hh_inicio,hh_fin,nu_carga_horaria',
                                    'detalleHorario.materia:id,nb_materia,id_area_estudio',
                                    'detalleHorario.materia.areaEstudio:id,tx_color',
                                    'detalleHorario.aula:id,nb_aula,id_estructura',
                                    'detalleHorario.aula.estructura:id,tx_path',
                                    'detalleHorario.docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                                ])
                                ->where('id_grupo', $idGrupo)
                                ->where('id_status', 1)
                                ->first();
        
        return $horario;
    }

    public function horarioDocente($idDocente)
    {
        $horario = Horario::with([ 
                                    'grupo:id,nb_grupo,id_grado', 
                                    'detalleHorario' => function ($query) use($idDocente) {
                                        $query->select('id','id_horario','id_materia','id_docente','id_dia_semana','id_aula','hh_inicio','hh_fin','nu_carga_horaria')
                                              ->where('id_docente', $idDocente);
                                    },
                                    'detalleHorario.materia:id,nb_materia,id_area_estudio',
                                    'detalleHorario.materia.areaEstudio:id,tx_color',
                                    'detalleHorario.aula:id,nb_aula,id_estructura',
                                    'detalleHorario.aula.estructura:id,tx_path',
                                    'detalleHorario.docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2'
                                ])
                                ->whereHas('detalleHorario.docente', function (Builder $query) use($idDocente) {
                                    $query->where('id', $idDocente);
                                })
                                ->where('id_status', 1)
                                ->get();
        
        return $horario;
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
            'nb_horario'        => 	'required|string|max:100',
			'id_grupo'          => 	'required|integer|max:999999999',
			'id_hora_academica' => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $horario = horario::create($request->all());

        return [ 'msj' => 'Horario Agregado Correctamente', compact('horario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function show(Horario $horario)
    {
        return $horario;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Horario $horario)
    {
        $validate = request()->validate([
            'nb_horario'        => 	'required|string|max:100',
			'id_grupo'          => 	'required|integer|max:999999999',
			'id_hora_academica' => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $horario = $horario->update($request->all());

        return [ 'msj' => 'Horario Editado' , compact('horario')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Horario $horario)
    {
        $horario = $horario->delete();
 
        return [ 'msj' => 'Horario Eliminado' , compact('horario')];
    }
}
