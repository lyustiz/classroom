<?php

namespace App\Http\Controllers;

use App\Models\ActividadPregunta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadPreguntaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ActividadPregunta::with([])
                    ->get();
    }

    public function actividadPreguntaActividad($idActividad)
    {
        return ActividadPregunta::with(['tipoPregunta'])
                    ->where('id_actividad', $idActividad)
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
            'nb_pregunta'       => 	'required|string|max:100',
			'nb_descripcion'    => 	'nullable|string|max:300',
			'id_actividad'      => 	'required|integer|max:999999999',
			'id_tipo_pregunta'  => 	'required|integer|max:999999999',
			'bo_opcional'       => 	'required|boolean',
			'nu_valor'          => 	'required|numeric|max:8',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $nuOrden = ActividadPregunta::where('id_actividad', $request->id_actividad)->count();

        $request->merge( ['nu_orden' => $nuOrden] );

        $actividadPregunta = ActividadPregunta::create($request->all());

        return [ 'msj' => 'Pregunta Agregada Correctamente', compact('actividadPregunta') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ActividadPregunta  $actividadPregunta
     * @return \Illuminate\Http\Response
     */
    public function show(ActividadPregunta $actividadPregunta)
    {
        return $actividadPregunta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ActividadPregunta  $actividadPregunta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ActividadPregunta $actividadPregunta)
    {
        $validate = request()->validate([
            'nb_pregunta'       => 	'required|string|max:100',
			'nb_descripcion'    => 	'nullable|string|max:300',
			'id_actividad'      => 	'required|integer|max:999999999',
			'id_tipo_pregunta'  => 	'required|integer|max:999999999',
			'bo_opcional'       => 	'required|boolean',
			'nu_valor'          => 	'required|numeric|max:8',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividadPregunta = $actividadPregunta->update($request->all());

        return [ 'msj' => 'Pregunta Actualizada' , compact('actividadPregunta')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ActividadPregunta  $actividadPregunta
     * @return \Illuminate\Http\Response
     */
    public function destroy(ActividadPregunta $actividadPregunta)
    {       
        $respuestas = $actividadPregunta->actividadRespuesta()->delete();
        
        $actividadPregunta = $actividadPregunta->delete();
 
        return [ 'msj' => 'Pregunta Eliminada' , compact('actividadPregunta', 'respuestas')];
    }
}
