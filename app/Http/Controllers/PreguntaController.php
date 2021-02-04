<?php

namespace App\Http\Controllers;

use App\Models\Pregunta;
use App\Models\Prueba;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class PreguntaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pregunta = Pregunta::with([
                                    'tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color'
                                ])
                                ->get();
        
        return $pregunta;
    }

    public function preguntaPrueba($idPrueba)
    {
       return Pregunta::with([
                        'respuesta:id,nb_respuesta,bo_correcta,id_pregunta',
                        'tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color,tx_observaciones',
                        'foto:id,tx_src,id_tipo_foto,id_origen',
                        ])
                    ->where('id_prueba', $idPrueba)
                    ->get();
    }

    //alumno
    public function preguntaPruebaAlumnoPendiente($idPrueba, $idAlumno)
    {
        return Pregunta::with([
                        'respuesta:id,nb_respuesta,id_pregunta',
                        'respuestaAlumno:respuesta_alumno.id,id_pregunta,id_respuesta,tx_respuesta',
                        'tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color,tx_observaciones',
                        'foto:id,tx_src,id_tipo_foto,id_origen',
                        ])
                    ->where('id_prueba', $idPrueba)
                    ->whereDoesntHave('respuestaAlumno', function ($query) use ($idAlumno, $idPrueba) {
                        $query->where('id_alumno', $idAlumno)
                              ->where('id_prueba', $idPrueba);
                    })
                    ->orderBy('nu_orden', 'asc')
                    ->first();
    }

    public function preguntaOrdenPruebaAlumno($idOrden, $idPrueba, $idAlumno)
    {
        return Pregunta::with([
                        'respuesta:id,nb_respuesta,id_pregunta',
                        'respuestaAlumno:respuesta_alumno.id,id_pregunta,id_respuesta,tx_respuesta',
                        'tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color,tx_observaciones',
                        'foto:id,tx_src,id_tipo_foto,id_origen',
                        ])
                    ->where('id_prueba', $idPrueba)
                    ->where('nu_orden', $idOrden)
                    ->orderBy('nu_orden', 'asc')
                    ->first();
    }

    public function preguntaPruebaAlumnoEvaluacion($idPrueba, $idAlumno)
    {
        return Pregunta::with([
                        'respuestaAlumno:respuesta_alumno.id,id_pregunta,id_respuesta,tx_respuesta,bo_correcta,nu_valor',
                        'respuestaAlumno.respuesta:id,nb_respuesta,id_pregunta,bo_correcta',
                        'tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color,tx_observaciones',
                        'foto:id,tx_src,id_tipo_foto,id_origen',
                        ])
                    ->where('id_prueba', $idPrueba)
                    ->whereHas('respuestaAlumno', function ($query) use ($idAlumno, $idPrueba) {
                        $query->where('id_alumno', $idAlumno)
                              ->where('id_prueba', $idPrueba);
                    })
                    ->orderBy('nu_orden', 'asc')
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
            'id_prueba'         =>  'required|integer|max:999999999',
            'nb_pregunta'       => 	'required|string|max:300',
			'id_tipo_pregunta'  => 	'required|integer|max:999999999',
			'bo_opcional'       => 	'required|boolean',
			'nu_valor'          => 	'required|numeric|between:1,99.99',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $nuOrden = Pregunta::where('id_prueba', $request->id_prueba)->count();

        $request->merge(['nu_orden' => $nuOrden + 1]);

        $pregunta = Pregunta::create($request->all());

        $this->updatePesoPrueba($request->id_prueba);

        return [ 'msj' => 'Pregunta Agregada Correctamente', compact('pregunta') ];
    }

    public function updatePesoPrueba($idPrueba)
    {
        $nuValor = Pregunta::where('id_prueba', $idPrueba)->sum('nu_valor');
        Prueba::where('id', $idPrueba)->update(['nu_peso' => $nuValor]);
    }

    public function importar(Request $request)
    {
        $validate = request()->validate([
            'preguntas'         =>  'required|array',
			'id_prueba'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $preguntas   = Pregunta::with(['respuesta'])
                                ->find($request->preguntas);

        
        foreach ($preguntas as $key => $pregunta) 
        {
            $newPregunta = $pregunta->replicate()->fill(['id_prueba' => $request->id_prueba]);
            $newPregunta->save();
  
            foreach ($pregunta->respuesta as $key => $respuesta) 
            {
                $newRespuesta = $respuesta->replicate()->fill(['id_pregunta' => $newPregunta->id]);
                $newRespuesta->save();
            } 
        }
        return [ 'msj' => 'Preguntas Importadas Correctamente'];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pregunta  $pregunta
     * @return \Illuminate\Http\Response
     */
    public function show(Pregunta $pregunta)
    {
        return $pregunta;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pregunta  $pregunta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pregunta $pregunta)
    {
        $validate = request()->validate([
            'id_prueba'         =>  'required|integer|max:999999999',
            'nb_pregunta'       => 	'required|string|max:300',
			'id_tipo_pregunta'  => 	'required|integer|max:999999999',
			'bo_opcional'       => 	'required|boolean',
			'nu_valor'          => 	'required|numeric|between:1,999.99',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        if( $pregunta->nu_orden != $request->nu_orden )
        {
            $this->updateOrden($pregunta->id_prueba, $pregunta->id, $request->nu_orden);
        }

        $pregunta = $pregunta->update($request->all());

        $this->updatePesoPrueba($request->id_prueba);
                
        return [ 'msj' => 'Pregunta Actualizada' , compact('pregunta')];
    }


    public function updateOrden($idPrueba, $idPregunta, $nuevoOrden)
    {
        $preguntas = Pregunta::where('id_prueba', $idPrueba)->orderBy('nu_orden', 'asc')->get();

        $orden = 1;

        foreach ($preguntas as $key => $preguntaUpd) {
            
            if($preguntaUpd->id == $idPregunta)
            {
                continue;
            }
            
            if($orden == $nuevoOrden)
            {
                $orden++; 
            }

            $preguntaUpd->nu_orden = $orden; 
            $preguntaUpd->update(); 
            
            $orden++; 
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pregunta  $pregunta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pregunta $pregunta)
    {
        if( count($pregunta->respuesta) > 0 )
        {
            throw ValidationException::withMessages(['poseeRespuesta' => "Posee respuestas asociada(s)"]);
        }
        
        $this->updateOrden($pregunta->id_prueba, $pregunta->id, 0);
        
        $pregunta = $pregunta->delete();
 
        return [ 'msj' => 'Pregunta Eliminada' , compact('pregunta')];
    }
}
