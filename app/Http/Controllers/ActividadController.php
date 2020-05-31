<?php

namespace App\Http\Controllers;

use App\Models\Actividad;
use App\Models\CargaHoraria;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $actividad = Actividad::with([])
                    ->get();
        
        return $actividad;
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
            'nb_actividad'       => 	'nullable|string|max:100',
			'id_horario'         => 	'required|integer|max:999999999',
			'id_materia'         => 	'required|integer|max:999999999',
			'id_docente'         => 	'required|integer|max:999999999',
			'id_dia_semana'      => 	'required|integer|max:999999999',
			'id_aula'            => 	'required|integer|max:999999999',
			'hh_inicio'          => 	'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'             => 	'required|date_format:"H:i"',
            'id_carga_horaria'   => 	'required|integer|max:999999999',
            'id_hora_academica'  =>     'required|integer|max:999999999',
			'nu_carga_horaria'   => 	'required|integer|max:99',
			'tx_observaciones'   => 	'nullable|string|max:100',
			'id_status'          => 	'required|integer|max:999999999',
			'id_usuario'         => 	'required|integer|max:999999999',
        ]);

        $cargaHoraria = CargaHoraria::select('id', 'nu_orden', 'bo_receso', 'id_status')
                                    ->where('id_hora_academica', $request->id_hora_academica)
                                    ->where('id', '>=', $request->id_carga_horaria)
                                    ->where('bo_receso', 0)
                                    ->where('id_status', 1)
                                    ->orderBy('nu_orden', 'asc')
                                    ->get();
        
        $actividad = [];
                                    
        $nu_carga_horaria =  ( $request->nu_carga_horaria > count($cargaHoraria) ) ? count($cargaHoraria) : $request->nu_carga_horaria;

        $registros = $nu_carga_horaria;

        $nombreGrupo = Str::random(64); 

        foreach ($cargaHoraria as $key => $row) {
            
            if( $row->bo_receso == 1 )
            {
                $nu_carga_horaria = $registros;
                continue;
            }
            
            if( $registros < 1 )
            {
                break;
            }

            $actividad = Actividad::create([

                'nb_actividad'       => $nombreGrupo,
                'id_horario'         => $request->id_horario,
                'id_materia'         => $request->id_materia,
                'id_docente'         => $request->id_docente,
                'id_dia_semana'      => $request->id_dia_semana,
                'id_aula'            => $request->id_aula,
                'hh_inicio'          => $request->hh_inicio,
                'hh_fin'             => $request->hh_fin,
                'id_carga_horaria'   => $row->id,
                'nu_carga_horaria'   => $nu_carga_horaria,
                'id_status'          => $request->id_status,
                'id_usuario'         => $request->id_usuario,
            
            ]);
            $registros--;
            $nu_carga_horaria = 0;
        }

        return [ 'msj' => 'Actividad Agregada Correctamente', compact('actividad') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Actividad  $actividad
     * @return \Illuminate\Http\Response
     */
    public function show(Actividad $actividad)
    {
        return $actividad;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Actividad  $actividad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Actividad $actividad)
    {
        $validate = request()->validate([
            'nb_actividad'       => 	'nullable|string|max:100',
			'id_horario'         => 	'required|integer|max:999999999',
			'id_materia'         => 	'required|integer|max:999999999',
			'id_docente'         => 	'required|integer|max:999999999',
			'id_dia_semana'      => 	'required|integer|max:999999999',
			'id_aula'            => 	'required|integer|max:999999999',
			'hh_inicio'          => 	'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'             => 	'required|date_format:"H:i"',
            'id_carga_horaria'   => 	'required|integer|max:999999999',
            'id_hora_academica'  =>     'required|integer|max:999999999',
			'nu_carga_horaria'   => 	'required|integer|max:99',
			'tx_observaciones'   => 	'nullable|string|max:100',
			'id_status'          => 	'required|integer|max:999999999',
			'id_usuario'         => 	'required|integer|max:999999999',
        ]);


        $actividades = [];
        
        if($actividad->nu_carga_horaria == $request->nu_carga_horaria)
        {
           $actividades =  Actividad::where('nb_actividad', $actividad->nb_actividad)
                           ->update([
                            'id_materia'    => $request->id_materia,
                            'id_docente'    => $request->id_docente,
                            'id_aula'       => $request->id_aula,
                           ]);
        }

        return [ 'msj' => 'Actividad Actualizada' , compact('actividad')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Actividad  $actividad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Actividad $actividad)
    {
       
        $actividad = Actividad::where('nb_actividad', $actividad->nb_actividad)
                              ->delete();
 
        return [ 'msj' => 'Actividad Eliminada' , compact('actividad')];
    }
}
