<?php

namespace App\Http\Controllers;

use App\Models\GradoMateria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GradoMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gradoMateria = GradoMateria::with([
                                            'grado:id,nb_grado',
                                            'materia:id,nb_materia',
                                            ])
                    ->orderBy('id_grado', 'asc')
                    ->orderBy('id_materia', 'asc')
                    ->get();
        
        return $gradoMateria;
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
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $gradoMateria = gradoMateria::create($request->all());

        return [ 'msj' => 'GradoMateria Agregado Correctamente', compact('gradoMateria') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GradoMateria  $gradoMateria
     * @return \Illuminate\Http\Response
     */
    public function show(GradoMateria $gradoMateria)
    {
        return $gradoMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GradoMateria  $gradoMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GradoMateria $gradoMateria)
    {
        $validate = request()->validate([
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $gradoMateria = $gradoMateria->update($request->all());

        return [ 'msj' => 'GradoMateria Editado' , compact('gradoMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GradoMateria  $gradoMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(GradoMateria $gradoMateria)
    {
        $gradoMateria = $gradoMateria->delete();
 
        return [ 'msj' => 'GradoMateria Eliminado' , compact('gradoMateria')];
    }
}
