<?php

namespace App\Http\Controllers;

use App\Models\Grado;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class GradoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grado = Grado::with(['nivel:id,nb_nivel'])
                    ->get();
        
        return $grado;
    }

    public function gradoPlanEvaluacion()
    {
        return Grado::with([
                        'grupo:grupo.id,nb_grupo,id_grado', 
                        'grupo.planEvaluacion:id,id_grupo,id_materia,id_periodo,id_docente,id_status', 
                        'grupo.planEvaluacion.docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2', 
                        'materia:materia.id,nb_materia',
                        'materia.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',                            
                        ])
                ->get();
    }

    public function gradoPlanEvaluacionDocente($idDocente)
    {
        return Grado::with([
                        'grupo' => function ($query) use($idDocente) {
                            $query->select('grupo.id','nb_grupo','id_grado')
                            ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('id_docente', $idDocente);
                            });
                        }, 
                        'grupo.planEvaluacion' => function ($query) use($idDocente) {
                            $query->select('plan_evaluacion.id','id_grupo','id_materia','id_periodo','id_docente','id_status')
                                  ->where('id_docente', $idDocente);
                        }, 
                        'grupo.planEvaluacion.materia'=> function ($query) use($idDocente) {
                            $query->select('materia.id','nb_materia')
                            ->whereHas('planEvaluacion', function (Builder $query) use($idDocente) {
                                $query->where('id_docente', $idDocente);
                            });
                        }, 
                        ])
                ->whereHas('grupo.planEvaluacion', function (Builder $query) use($idDocente) {
                    $query->where('id_docente', $idDocente);
                })
                ->get();
    }

    public function gradoPlanEvaluacionDocentePeriodo($idDocente, $idPeriodo)
    {
        return Grado::with([
                        'grupo:grupo.id,nb_grupo,id_grado', 
                        'grupo.planEvaluacion' => function ($query) use($idDocente,$idPeriodo) {
                            $query->select('id','id_grupo','id_materia','id_periodo','id_docente','id_status')
                                  ->where('id_periodo', $idPeriodo)
                                  ->where('id_docente', $idDocente);
                        }, 
                        'grupo.planEvaluacion.materia:id,nb_materia',
                        'materia.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',                            
                        ])
                ->get();

               /*  'detalleHorario' => function ($query) use($idDocente) {
                    $query->select('id','id_horario','id_materia','id_docente','id_dia_semana','id_aula','hh_inicio','hh_fin','nu_carga_horaria')
                          ->where('id_docente', $idDocente);
                }, */
    }


    public function grupoGrado($idGrado)
    {
        return Grado::select('id', 'nb_grado')
                    ->where('id_grado', $idGrado)
                    ->where('id_status', 1)
                    ->get();
    }

    public function list()
    {
        return Grado::select('id', 'nb_grado')
                    ->where('id_status', 1)
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
            'nb_grado'          => 	'required|string|max:30',
			'nu_grado'          => 	'required|integer|max:99',
			'id_nivel'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grado = grado::create($request->all());

        return [ 'msj' => 'Grado Agregado Correctamente', compact('grado') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function show(Grado $grado)
    {
        return $grado;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grado $grado)
    {
        $validate = request()->validate([
            'nb_grado'          => 	'required|string|max:30',
			'nu_grado'          => 	'required|integer|max:999999999',
			'id_nivel'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grado = $grado->update($request->all());

        return [ 'msj' => 'Grado Editado' , compact('grado')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grado  $grado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Grado $grado)
    {
        $grado = $grado->delete();
 
        return [ 'msj' => 'Grado Eliminado' , compact('grado')];
    }
}
