<?php

namespace App\Http\Controllers;

use App\Models\Tarea;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TareaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Tarea::with([])
                    ->get();
    }

    public function tareaEvaluacionAlumno($idEvaluacion, $idEvaluacionAlumno)
    {
        return  Tarea::with([
                                'materia:materia.id,nb_materia',
                                'tema:tema.id,nb_tema',
                                'evaluacion' => function($query) use ( $idEvaluacion ) {
                                    $query->find($idEvaluacion);
                                },
                                'evaluacion.evaluacionAlumno' => function($query) use ( $idEvaluacionAlumno ) {
                                    $query->find($idEvaluacionAlumno);
                                },
                                'evaluacion.evaluacionAlumno.archivo',
                                'archivo'
                            ])
                            ->whereHas('evaluacion.evaluacionAlumno', function ($query) use ($idEvaluacionAlumno) {
                                $query->where('id', $idEvaluacionAlumno);
                            })
                            ->first();
    }

    public function tareaTema($idTema)
    {
        return  Tarea::with(['grado:id,nb_grado', 'materia:id,nb_materia'])
                      ->where('id_tema', $idTema)
                      ->get();
    }

    public function tareaGradoMateria($idGrado, $idMateria)
    {
        return  Tarea::with(['grado:id,nb_grado', 'materia:id,nb_materia'])
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
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
            'nb_tarea'          => 	'required|string|max:100',
			'tx_descripcion'    => 	'nullable|string|max:3000',
			'id_tipo_tarea'     => 	'nullable|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_tema'           => 	'required|integer|max:999999999',
			'nu_peso'           => 	'nullable|numeric|max:11',
			'tx_observaciones'  => 	'nullable|string|max:2000',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tarea = tarea::create($request->all());

        return [ 'msj' => 'Tarea Agregada Correctamente', compact('tarea') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function show(Tarea $tarea)
    {
        return $tarea;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tarea $tarea)
    {
        $validate = request()->validate([
            'nb_tarea'          => 	'required|string|max:100',
			'tx_descripcion'    => 	'nullable|string|max:3000',
			'id_tipo_tarea'     => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_tema'           => 	'required|integer|max:999999999',
			'nu_peso'           => 	'nullable|numeric|max:11',
			'tx_observaciones'  => 	'nullable|string|max:2000',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tarea = $tarea->update($request->all());

        return [ 'msj' => 'Tarea Actualizada' , compact('tarea')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tarea  $tarea
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tarea $tarea)
    {
        $tarea = $tarea->delete();
 
        return [ 'msj' => 'Tarea Eliminada' , compact('tarea')];
    }
}
