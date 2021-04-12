<?php

namespace App\Http\Controllers;

use App\Models\DetalleHorario;
use App\Models\CargaHoraria;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;

class DetalleHorarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $detalleHorario = DetalleHorario::with([])
                    ->get();
        
        return $detalleHorario;
    }

    public function detalleByHorarioId($idHorario)
    {
        $detalleHorario = DetalleHorario::with(['cargaHoraria:id,'])
                        ->where('id_horarrio', $idHorario)
                        ->get();
    }

    public function detalleHorarioAlumnoFecha(Request $request)
    {
        $fecha   = date_create_from_format('Y-m-d', $request->fecha);
        
        $weekday = ($fecha) ? date_format($fecha, 'w') : date("w");
      
        $horario = DetalleHorario::with([ 
                                    'materia:id,nb_materia,id_area_estudio',
                                    'materia.areaEstudio:id,tx_color',
                                    'aula:id,nb_aula,id_estructura',
                                    'aula.estructura:id,tx_path',
                                    'docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2'
                                ])
                                ->whereHas('horario', function (Builder $query) {
                                    $query->activo();
                                })
                                ->whereHas('horario.grupo.alumno', function (Builder $query) use($request) {
                                    $query->where('alumno.id', $request->id_alumno);
                                })
                                ->where('id_dia_semana', $weekday)
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
            'co_detalle_horario' =>  'nullable|string|max:100',
			'id_horario'         =>  'required|integer|max:999999999',
			'id_materia'         =>  'required|integer|max:999999999',
			'id_docente'         =>  'required|integer|max:999999999',
			'id_dia_semana'      =>  'required|integer|max:999999999',
			'id_aula'            =>  'required|integer|max:999999999',
			'hh_inicio'          =>  'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'             =>  'required|date_format:"H:i"',
            'id_carga_horaria'   =>  'required|integer|max:999999999',
            'id_hora_academica'  =>  'required|integer|max:999999999',
			'nu_carga_horaria'   =>  'required|integer|max:99',
			'tx_observaciones'   =>  'nullable|string|max:100',
			'id_status'          =>  'required|integer|max:999999999',
			'id_usuario'         =>  'required|integer|max:999999999',
        ]);

        $cargaHoraria = CargaHoraria::select('id', 'nu_orden', 'bo_receso', 'id_status', 'hh_inicio', 'hh_fin')
                                    ->where('id_hora_academica', $request->id_hora_academica)
                                    ->where('id', '>=', $request->id_carga_horaria)
                                    ->where('bo_receso', 0)
                                    ->where('id_status', 1)
                                    ->orderBy('nu_orden', 'asc')
                                    ->get();
        $detalleHorario = [];
                                    
        $nu_carga_horaria =  ( $request->nu_carga_horaria > count($cargaHoraria) ) ? count($cargaHoraria) : $request->nu_carga_horaria;

        $registros = $nu_carga_horaria;

        $coDetalleHorario = 'H' . $request->id_horario . 
                            'M' . $request->id_materia .  
                            'D' . $request->id_docente .
                            'S' . $request->id_dia_semana . 
                            'I' . $request->hh_inicio .
                            'F' . $request->hh_fin; 

        

        foreach ($cargaHoraria as $key => $row) {
            
            $this->comprobarDisponibilidad($request, $row->hh_inicio, $row->hh_fin);

            if( $row->bo_receso == 1 )
            {
                $nu_carga_horaria = $registros;
                continue;
            }
            
            if( $registros < 1 )
            {
                break;
            }
                
            $detalleHorario = DetalleHorario::create([

                'co_detalle_horario' => $coDetalleHorario,
                'id_horario'         => $request->id_horario,
                'id_materia'         => $request->id_materia,
                'id_docente'         => $request->id_docente,
                'id_dia_semana'      => $request->id_dia_semana,
                'id_aula'            => $request->id_aula,
                'hh_inicio'          => $row->hh_inicio,
                'hh_fin'             => $row->hh_fin,
                'id_hora_academica'  => $request->id_hora_academica,
                'id_carga_horaria'   => $row->id,
                'nu_carga_horaria'   => $nu_carga_horaria,
                'id_status'          => $request->id_status,
                'id_usuario'         => $request->id_usuario,
            
            ]);
            $registros--;
            $nu_carga_horaria = 0;
        }

        return [ 'msj' => 'Horario Actualizado', compact('detalleHorario') ];
    }

    public function comprobarDisponibilidad($detalleHorario, $hh_inicio, $hh_fin)
    {
        $horarios =  DetalleHorario::where('id_dia_semana', $detalleHorario->id_dia_semana)
                                   ->whereTime('hh_inicio', '>= ', $hh_inicio)
                                   ->whereTime('hh_fin', '<= ', $hh_fin)
                                   ->get();
       
        foreach ($horarios as $key => $horario) 
        {
           /*  if( $detalleHorario->id_docente == $horario->id_docente )
            {
                throw ValidationException::withMessages(['docenteAsignado' => "El docente ya tiene asignacion para esa Hora/Dia"]);
            }

            if( $detalleHorario->id_aula == $horario->id_aula )
            {
                throw ValidationException::withMessages(['aulaAsignada' => "El aula ya tiene asignacion para esa Hora/Dia"]);
            } */
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DetalleHorario  $detalleHorario
     * @return \Illuminate\Http\Response
     */
    public function show(DetalleHorario $detalleHorario)
    {
        return $detalleHorario;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DetalleHorario  $detalleHorario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DetalleHorario $detalleHorario)
    {
        $validate = request()->validate([
            'co_detalle_horario' =>  'nullable|string|max:100',
			'id_horario'         =>  'required|integer|max:999999999',
			'id_materia'         =>  'required|integer|max:999999999',
			'id_docente'         =>  'required|integer|max:999999999',
			'id_dia_semana'      =>  'required|integer|max:999999999',
			'id_aula'            =>  'required|integer|max:999999999',
			'hh_inicio'          =>  'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'             =>  'required|date_format:"H:i"',
            'id_carga_horaria'   =>  'required|integer|max:999999999',
            'id_hora_academica'  =>  'required|integer|max:999999999',
			'nu_carga_horaria'   =>  'required|integer|max:99',
			'tx_observaciones'   =>  'nullable|string|max:100',
			'id_status'          =>  'required|integer|max:999999999',
			'id_usuario'         =>  'required|integer|max:999999999',
        ]);

        $detalleHorario =  DetalleHorario::where('co_detalle_horario', $detalleHorario->co_detalle_horario)
                        ->update([
                            'id_materia'    => $request->id_materia,
                            'id_docente'    => $request->id_docente,
                            'id_aula'       => $request->id_aula,
                        ]);
        

        return [ 'msj' => 'Horario Actualizado' , compact('detalleHorario')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DetalleHorario  $detalleHorario
     * @return \Illuminate\Http\Response
     */
    public function destroy(DetalleHorario $detalleHorario)
    {
        $detalleHorario = DetalleHorario::where('co_detalle_horario', $detalleHorario->co_detalle_horario)
                            ->delete();
 
        return [ 'msj' => 'Horario Actualizado' , compact('detalleHorario')];
    }
}
