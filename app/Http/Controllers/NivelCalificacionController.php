<?php

namespace App\Http\Controllers;

use App\Models\NivelCalificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class NivelCalificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $nivelCalificacion = NivelCalificacion::with([])
                    ->get();
        
        return $nivelCalificacion;
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
            'nb_nivel_calificacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $nivelCalificacion = nivelCalificacion::create($request->all());

        return [ 'msj' => 'NivelCalificacion Agregado Correctamente', compact('nivelCalificacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NivelCalificacion  $nivelCalificacion
     * @return \Illuminate\Http\Response
     */
    public function show(NivelCalificacion $nivelCalificacion)
    {
        return $nivelCalificacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NivelCalificacion  $nivelCalificacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NivelCalificacion $nivelCalificacion)
    {
        $validate = request()->validate([
            'nb_nivel_calificacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $nivelCalificacion = $nivelCalificacion->update($request->all());

        return [ 'msj' => 'NivelCalificacion Editado' , compact('nivelCalificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NivelCalificacion  $nivelCalificacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(NivelCalificacion $nivelCalificacion)
    {
        if( count($nivelCalificacion->calificacion) > 0 )
        {
            throw ValidationException::withMessages(['poseeCalificacion' => "Posee Calificacion(es) asociada(s)"]);
        }
        
        $nivelCalificacion = $nivelCalificacion->delete();
 
        return [ 'msj' => 'NivelCalificacion Eliminado' , compact('nivelCalificacion')];
    }
}
