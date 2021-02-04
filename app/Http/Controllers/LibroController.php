<?php

namespace App\Http\Controllers;

use App\Models\Libro;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class LibroController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Libro::with(['materia:materia.id,nb_materia', 'grado:grado.id,nb_grado', 'pagina:id,nb_pagina,id_libro'  ])
                    ->get();
    }

    public function libroGrado($idGrado)
    {
        return Libro::with(['materia:id,nb_materia', 'pagina:id,nb_pagina,tx_path,id_libro','tema:tema.id,nb_tema' ])
                    ->where('id_grado', $idGrado)
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
            'nb_libro'          => 	'required|string|max:80',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'tx_portada'        => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $libro = libro::create($request->all());

        return [ 'msj' => 'Libro Agregado Correctamente', compact('libro') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */
    public function show(Libro $libro)
    {
        return $libro;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Libro $libro)
    {
        $validate = request()->validate([
            'nb_libro'          => 	'required|string|max:80',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'tx_portada'        => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $libro = $libro->update($request->all());

        return [ 'msj' => 'Libro Editado' , compact('libro')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Libro  $libro
     * @return \Illuminate\Http\Response
     */
    public function destroy(Libro $libro)
    {
        if( count($libro->pagina) > 0 )
        {
            throw ValidationException::withMessages(['poseePagina' => "Posee Pagina(s) asociada(s)"]);
        }
        
        $libro = $libro->delete();
 
        return [ 'msj' => 'Libro Eliminado' , compact('libro')];
    }
}
