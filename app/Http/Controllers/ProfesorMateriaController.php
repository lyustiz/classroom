<?php

namespace App\Http\Controllers;

use App\Models\ProfesorMateria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProfesorMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $profesorMateria = ProfesorMateria::with([])
                    ->get();
        
        return $profesorMateria;
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
            'id_profesor'       => 	'required|integer',
			'id_materia'        => 	'required|integer',
			'id_grado'          => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $profesorMateria = profesorMateria::create($request->all());

        return [ 'msj' => 'ProfesorMateria Agregado Correctamente', compact('profesorMateria') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ProfesorMateria  $profesorMateria
     * @return \Illuminate\Http\Response
     */
    public function show(ProfesorMateria $profesorMateria)
    {
        return $profesorMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ProfesorMateria  $profesorMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProfesorMateria $profesorMateria)
    {
        $validate = request()->validate([
            'id_profesor'       => 	'required|integer',
			'id_materia'        => 	'required|integer',
			'id_grado'          => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $profesorMateria = $profesorMateria->update($request->all());

        return [ 'msj' => 'ProfesorMateria Editado' , compact('profesorMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProfesorMateria  $profesorMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProfesorMateria $profesorMateria)
    {
        $profesorMateria = $profesorMateria->delete();
 
        return [ 'msj' => 'ProfesorMateria Eliminado' , compact('profesorMateria')];
    }
}
