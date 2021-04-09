<?php

namespace App\Http\Controllers;

use App\Models\RespuestaAlumno;
use App\Models\Pregunta;
use App\Models\Respuesta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RespuestaAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $respuestaAlumno = RespuestaAlumno::with([])
                    ->get();
        
        return $respuestaAlumno;
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
            'id_prueba'            => 'required|integer|max:999999999',
            'id_evaluacion_alumno' => 'required|integer|max:999999999',
            'id_pregunta'          => 'required|integer|max:999999999',
            'id_alumno'            => 'required|integer|max:999999999',
            'id_usuario'           => 'required|integer|max:999999999',
        ]);

        $request->merge(['id_status'   => 1]);

        $pregunta = Pregunta::find($request->id_pregunta);

        $respuestaAlumno = null;

        if($pregunta->id_tipo_pregunta == 1)
        {
            $respuestaAlumno =  $this->storeDesarrollo($pregunta, $request);
        }

        if($pregunta->id_tipo_pregunta == 2)
        {
            $respuestaAlumno =  $this->storeSeleccion($pregunta, $request);
        }

        if($pregunta->id_tipo_pregunta == 3)
        {
            $respuestaAlumno = $this->storeMultiple($pregunta, $request);
        }
        
        return [ 'msj' => 'Respuesta Guardada', compact('respuestaAlumno') ];
    }

    public function storeDesarrollo($pregunta, $request)
    {
        $validate = request()->validate([
			'tx_respuesta'      => 	'required|string|max:600',
        ]);

        $request->merge([
            'bo_correcta' => false,
        ]);

        return RespuestaAlumno::create($request->all());
    }

    public function storeSeleccion($pregunta, $request)
    {
        $validate = request()->validate([
            'id_respuesta'       => 	'required|integer|max:999999999',
        ]);

        $respuesta   = Respuesta::find($request->id_respuesta);

        $correcta    = $respuesta->bo_correcta;
        
        $valor       =  ($correcta) ?  $pregunta->nu_valor : 0;

        $request->merge([
            'bo_correcta' => $correcta,
            'nu_valor'    => $valor,
        ]);
            
        return RespuestaAlumno::create($request->all());
    }

    public function storeMultiple($pregunta, $request)
    {
        $validate = request()->validate([
            'id_respuesta'       => 	'required|array',
        ]);

        $respuestasAlumno = [];

        $data = $request->all();

        $pregunta->load('respuesta');

        $nroRespuestas = $this->nroRespuestasCorrectas($pregunta->respuesta); ;

        $valorCorrecta = $pregunta->nu_valor / $nroRespuestas;

        foreach ($pregunta->respuesta as $key => $respuesta) {

            $hasRespuesta = in_array($respuesta->id, $request->id_respuesta);

            if($hasRespuesta)
            {
                $data['id_respuesta'] = $respuesta->id;
                $data['bo_correcta']  = $respuesta->bo_correcta;
                $data['nu_valor']     = ($respuesta->bo_correcta) ? $valorCorrecta : 0 ;
                $respuestasAlumno[]   =  $data;
            }
        }
        return RespuestaAlumno::insert($respuestasAlumno);
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RespuestaAlumno  $respuestaAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(RespuestaAlumno $respuestaAlumno)
    {
        return $respuestaAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RespuestaAlumno  $respuestaAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $validate = request()->validate([
            'id_prueba'            => 'required|integer|max:999999999',
            'id_evaluacion_alumno' => 'required|integer|max:999999999',
            'id_pregunta'          => 'required|integer|max:999999999',
            'id_alumno'            => 'required|integer|max:999999999',
            'id_usuario'           => 'required|integer|max:999999999',
        ]);

        $pregunta = Pregunta::find($request->id_pregunta);

        $respuestaAlumno = null;

        if($pregunta->id_tipo_pregunta == 1)
        {
            $respuestaAlumno =  $this->updateDesarrollo($pregunta, $request);
        }

        if($pregunta->id_tipo_pregunta == 2)
        {
            $respuestaAlumno = $this->updateSeleccion($pregunta, $request);
        }

        if($pregunta->id_tipo_pregunta == 3)
        {
            $respuestaAlumno = $this->updateMultiple($pregunta, $request);
        }
        
        return [ 'msj' => 'Respuesta Actualizada' , compact('respuestaAlumno')];
    }

    public function updateDesarrollo($pregunta, $request)
    {
        $validate = request()->validate([
            'id'            => 'required|integer|max:999999999',
            'tx_respuesta'  => 'required|string|max:600',
        ]);

        return RespuestaAlumno::where( 'id', $request->id)->update($request->only('tx_respuesta'));
    }

    public function updateSeleccion($pregunta, $request)
    {
        $validate = request()->validate([
            'id'                 => 'required|integer|max:999999999',
            'id_respuesta'       => 'required|integer|max:999999999',
        ]);

        $respuesta   = Respuesta::find($request->id_respuesta);

        $correcta    = $respuesta->bo_correcta;
        
        $valor       =  ($correcta) ?  $pregunta->nu_valor : 0;

        $data = [
            'bo_correcta'   => $correcta,
            'nu_valor'      => $valor,
            'id_respuesta'  => $request->id_respuesta
        ];

        return RespuestaAlumno::where( 'id', $request->id)->update($data);
    }

    public function updateMultiple($pregunta, $request)
    {
        $validate = request()->validate([
            'id'            => 	'required|array',
            'id_respuesta'  => 	'required|array',
            'id_respuesta'  => 	'required|array',
        ]);
        
        RespuestaAlumno::where('id_prueba',   $request->id_prueba)
                       ->where('id_pregunta', $request->id_pregunta)
                       ->where('id_alumno',   $request->id_alumno)
                       ->delete();

        $respuestasAlumno = [];

        $data = $request->only([ 'id_evaluacion_alumno', 'id_prueba', 'id_pregunta', 'id_alumno', 'id_usuario']);

        $pregunta->load('respuesta');

        $nroRespuestas = $this->nroRespuestasCorrectas($pregunta->respuesta); 

        $valorCorrecta = $pregunta->nu_valor / $nroRespuestas;

        foreach ($pregunta->respuesta as $key => $respuesta) {

            $hasRespuesta = in_array($respuesta->id, $request->id_respuesta);

            if($hasRespuesta)
            {
                $data['id_respuesta'] = $respuesta->id;
                $data['bo_correcta']  = $respuesta->bo_correcta;
                $data['nu_valor']     = ($respuesta->bo_correcta) ? $valorCorrecta : 0 ;
                $data['id_status']    = 1;
                $respuestasAlumno[]   =  $data;
            }
        }
        return RespuestaAlumno::insert($respuestasAlumno);
    }

    public function nroRespuestasCorrectas($respuestas)
    {
        $nroRespuestasCorrectas = 0;
        foreach ($respuestas as $key => $respuesta) {
            $nroRespuestasCorrectas += $respuesta->bo_correcta;
        }
        return $nroRespuestasCorrectas;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RespuestaAlumno  $respuestaAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(RespuestaAlumno $respuestaAlumno)
    {
        $respuestaAlumno = $respuestaAlumno->delete();
 
        return [ 'msj' => 'RespuestaAlumno Eliminado' , compact('respuestaAlumno')];
    }
}