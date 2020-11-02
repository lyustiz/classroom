<?php

namespace App\Http\Controllers;

use App\Models\ActividadRespuesta;
use App\Models\ActividadPregunta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadRespuestaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ActividadRespuesta::with([])
                    ->get();
    }

    public function actividadRespuestaPregunta($idPregunta)
    {
        return ActividadRespuesta::where('id_actividad_pregunta', $idPregunta)
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
            'nb_respuesta'          => 	'required|string|max:600',
			'id_actividad_pregunta' => 	'required|integer|max:999999999',
			'bo_correcta'           => 	'required|boolean',
			'nu_valor'              => 	'nullable|numeric|max:8',
			'tx_observaciones'      => 	'nullable|string|max:100',
			'id_status'             => 	'required|integer|max:999999999',
			'id_usuario'            => 	'required|integer|max:999999999',
        ]);

        $this->validateCorecta($request->id_actividad_pregunta, $request->bo_correcta);
        
        $store      = ActividadRespuesta::create($request->all());

        $respuestas = $this->actividadRespuestaPregunta($request->id_actividad_pregunta);

        return [ 'msj' => 'Respuesta agregada correctamente', 'store' => $store, 'respuestas' => $respuestas ];
    }

    public function validateCorecta($idActividadPregunta, $boCorrecta)
    {
        if(ActividadPregunta::find($idActividadPregunta)->id_tipo_pregunta == 2 and $boCorrecta == 1)
        {
            ActividadRespuesta::where( ['id_actividad_pregunta' =>$idActividadPregunta ])->update(['bo_correcta' => 0]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ActividadRespuesta  $actividadRespuesta
     * @return \Illuminate\Http\Response
     */
    public function show(ActividadRespuesta $actividadRespuesta)
    {
        return $actividadRespuesta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ActividadRespuesta  $actividadRespuesta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ActividadRespuesta $actividadRespuesta)
    {
        $validate = request()->validate([
            'nb_respuesta'      => 	'nullable|string|max:600',
			'id_actividad_pregunta'=> 	'required|integer|max:999999999',
			'bo_correcta'       => 	'required|boolean',
			'nu_valor'          => 	'nullable|numeric|max:8',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $update     = $actividadRespuesta->update($request->all());

        $respuestas = $this->actividadRespuestaPregunta($actividadRespuesta->id_actividad_pregunta);

        return [ 'msj' => 'Respuesta Actualizada' , 'update' => $update,'respuestas' => $respuestas ];
    }

    public function updateNombre(Request $request, ActividadRespuesta $actividadRespuesta)
    {
        $validate = request()->validate([
            'nb_respuesta'         => 'required|string|max:600',
            'id_actividad_pregunta'=> 'required|integer|max:999999999',
            'id_usuario'           => 'required|integer|max:999999999',
        ]);

        $update     = $actividadRespuesta->update($validate);

        $respuestas = $this->actividadRespuestaPregunta($actividadRespuesta->id_actividad_pregunta);

        return [ 'msj' => 'Respuesta Actualizada' , 'update' => $update,'respuestas' => $respuestas ];
    }

    public function updateCorrecta(Request $request, ActividadRespuesta $actividadRespuesta)
    {
        $validate = request()->validate([
            'bo_correcta'           => 	'required|boolean',
            'id_actividad_pregunta' => 	'required|integer|max:999999999',
            'id_usuario'            => 	'required|integer|max:999999999',
        ]);

        $this->validateCorecta($request->id_actividad_pregunta, $request->bo_correcta);
        
        $update     = $actividadRespuesta->update($validate);

        $respuestas = $this->actividadRespuestaPregunta($actividadRespuesta->id_actividad_pregunta);

        return [ 'msj' => 'Respuesta Actualizada' , 'update' => $update,'respuestas' => $respuestas];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ActividadRespuesta  $actividadRespuesta
     * @return \Illuminate\Http\Response
     */
    public function destroy(ActividadRespuesta $actividadRespuesta)
    {      
        $id_actividad_pregunta = $actividadRespuesta->id_actividad_pregunta;

        $delete     = $actividadRespuesta->delete();

        $respuestas = $this->actividadRespuestaPregunta($id_actividad_pregunta);
 
        return [ 'msj' => 'Respuesta Eliminada' , 'delete' => $delete, 'respuestas' => $respuestas];
    }
}
