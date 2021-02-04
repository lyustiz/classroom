<?php

namespace App\Http\Controllers;

use App\Models\Respuesta;
use App\Models\Pregunta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class RespuestaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $respuesta = Respuesta::with([])
                    ->get();
        
        return $respuesta;
    }

    public function respuestaPregunta($idPregunta)
    {
       return Respuesta::with(['pregunta:id,nb_pregunta,id_tipo_pregunta'])
                    ->where('id_pregunta', $idPregunta)
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
            'nb_respuesta'      => 	'nullable|string|max:600',
			'id_pregunta'       => 	'required|integer|max:999999999',
			'bo_correcta'       => 	'required|boolean',
			'nu_valor'          => 	'nullable|numeric|max:8',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);
        

        /* if($request->bo_correcta == 1)
        {
            $this->removeRespuestasCorrectas($request->id_pregunta);
        }
        
        $respuesta = Respuesta::create($request->all());

        return [ 'msj' => 'Respuesta Agregado Correctamente', compact('respuesta') ]; */
        $this->validateCorecta($request->id_pregunta, $request->bo_correcta);
        
        $store      = Respuesta::create($request->all());

        $respuestas = $this->respuestaPregunta($request->id_pregunta);

        return [ 'msj' => 'Respuesta agregada correctamente', 'store' => $store, 'respuestas' => $respuestas ];
    }


    public function removeRespuestasCorrectas($idPregunta)
    {
        return   Respuesta::where('id_pregunta', $idPregunta)
                            ->whereHas('pregunta', function ($query)  use ($idPregunta){
                                $query->where('pregunta.id', $idPregunta)
                                    ->where('id_tipo_pregunta', 2);
                            })
                            ->update(['bo_correcta' => 0]);       
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Http\Response
     */
    public function show(Respuesta $respuesta)
    {
        return $respuesta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Respuesta $respuesta)
    {
        $validate = request()->validate([
            'nb_respuesta'      => 	'nullable|string|max:600',
			'id_pregunta'       => 	'required|integer|max:999999999',
			'bo_correcta'       => 	'required|boolean',
			'nu_valor'          => 	'nullable|numeric|max:8',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        if($request->bo_correcta == 1)
        {
            $this->removeRespuestasCorrectas($request->id_pregunta);
        }

        $respuesta = $respuesta->update($request->all());

        return [ 'msj' => 'Respuesta Editada' , compact('respuesta')];
    }

    public function updateNombre(Request $request, Respuesta $respuesta)
    {
        $validate = request()->validate([
            'nb_respuesta'  => 'required|string|max:600',
            'id_pregunta'   => 'required|integer|max:999999999',
            'id_usuario'    => 'required|integer|max:999999999',
        ]);

        $update     = $respuesta->update($validate);

        $respuestas = $this->respuestaPregunta($respuesta->id_pregunta);

        return [ 'msj' => 'Respuesta Actualizada' , 'update' => $update,'respuestas' => $respuestas ];
    }

    public function updateCorrecta(Request $request, Respuesta $respuesta)
    {
        $validate = request()->validate([
            'bo_correcta' => 	'required|boolean',
            'id_pregunta' => 	'required|integer|max:999999999',
            'id_usuario'  => 	'required|integer|max:999999999',
        ]);

        $this->validateCorecta($request->id_pregunta, $request->bo_correcta);
        
        $update     = $respuesta->update($validate);

        $respuestas = $this->respuestaPregunta($respuesta->id_pregunta);

        return [ 'msj' => 'Respuesta Actualizada' , 'update' => $update,'respuestas' => $respuestas];
    }

    public function validateCorecta($idPregunta, $boCorrecta)
    {
        if(Pregunta::find($idPregunta)->id_tipo_pregunta == 2 and $boCorrecta == 1)
        {
            Respuesta::where( ['id_pregunta' =>$idPregunta ])->update(['bo_correcta' => 0]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Respuesta  $respuesta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Respuesta $respuesta)
    {
        if( count($respuesta->docente) > 0 )
        {
            throw ValidationException::withMessages(['poseeRespuestasAlumnos' => "Existen alumnos que seleccionaron esta respuesta"]);
        }
        
        $respuesta = $respuesta->delete();
 
        return [ 'msj' => 'Respuesta Eliminada' , compact('respuesta')];
    }
}
