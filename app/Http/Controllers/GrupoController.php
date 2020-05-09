<?php

namespace App\Http\Controllers;

use App\Models\Grupo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GrupoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grupo = Grupo::with([])
                    ->get();
        
        return $grupo;
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
            'nb_grupo'          => 	'required|string|max:30',
			'id_grado'          => 	'required|integer',
			'tx_director'       => 	'required|string|max:30',
			'nu_alumnos'        => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $grupo = grupo::create($request->all());

        return [ 'msj' => 'Grupo Agregado Correctamente', compact('grupo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Grupo  $grupo
     * @return \Illuminate\Http\Response
     */
    public function show(Grupo $grupo)
    {
        return $grupo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grupo  $grupo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grupo $grupo)
    {
        $validate = request()->validate([
            'nb_grupo'          => 	'required|string|max:30',
			'id_grado'          => 	'required|integer',
			'tx_director'       => 	'required|string|max:30',
			'nu_alumnos'        => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $grupo = $grupo->update($request->all());

        return [ 'msj' => 'Grupo Editado' , compact('grupo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grupo  $grupo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Grupo $grupo)
    {
        $grupo = $grupo->delete();
 
        return [ 'msj' => 'Grupo Eliminado' , compact('grupo')];
    }
}
