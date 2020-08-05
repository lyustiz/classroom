<?php

namespace App\Http\Controllers;

use App\Models\Pregunta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
                        'tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color,tx_observaciones'
                        ])
                    ->where('id_prueba', $idPrueba)
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
            'nb_pregunta'       => 	'required|string|max:100',
			'id_tipo_pregunta'  => 	'required|integer|max:999999999',
			'bo_opcional'       => 	'required|boolean',
			'nu_valor'          => 	'required|numeric|between:1,99.99',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $nuOrden = Pregunta::where('id_prueba', $request->id_prueba)->count();

        $request->merge(['nu_orden' => $nuOrden + 1]);

        $pregunta = Pregunta::create($request->all());

        return [ 'msj' => 'Pregunta Agregada Correctamente', compact('pregunta') ];
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
            'nb_pregunta'       => 	'required|string|max:100',
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
        $this->updateOrden($pregunta->id_prueba, $pregunta->id, 0);
        
        $pregunta = $pregunta->delete();
 
        return [ 'msj' => 'Pregunta Eliminada' , compact('pregunta')];
    }
}
