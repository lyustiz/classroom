<?php

namespace App\Http\Controllers;

use App\Models\RespuestaAlumno;
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
            'id_prueba'         => 	'required|integer|max:999999999',
			'id_respuesta'      => 	'required|string|max:0',
			'tx_respuesta'      => 	'nullable|string|max:600',
			'bo_correcta'       => 	'required|boolean',
			'nu_valor'          => 	'required|string|max:',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $respuestaAlumno = respuestaAlumno::create($request->all());

        return [ 'msj' => 'RespuestaAlumno Agregado Correctamente', compact('respuestaAlumno') ];
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
    public function update(Request $request, RespuestaAlumno $respuestaAlumno)
    {
        $validate = request()->validate([
            'id_prueba'         => 	'required|integer|max:999999999',
			'id_respuesta'      => 	'required|string|max:0',
			'tx_respuesta'      => 	'nullable|string|max:600',
			'bo_correcta'       => 	'required|boolean',
			'nu_valor'          => 	'required|string|max:',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $respuestaAlumno = $respuestaAlumno->update($request->all());

        return [ 'msj' => 'RespuestaAlumno Editado' , compact('respuestaAlumno')];
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
