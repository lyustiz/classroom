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
        $gradoMateria = GradoMateria::with([])
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
            'id_materia'        => 	'required|integer',
			'nb_director'       => 	'required|string|max:30',
			'tx_libro'          => 	'required|string|max:30',
			'id_profesor'       => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
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
            'id_materia'        => 	'required|integer',
			'nb_director'       => 	'required|string|max:30',
			'tx_libro'          => 	'required|string|max:30',
			'id_profesor'       => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
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
