<?php

namespace App\Http\Controllers;

use App\Models\Inasistencia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class InasistenciaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $inasistencia = Inasistencia::with([])
                    ->get();
        
        return $inasistencia;
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
            'id_estudiante'     => 	'required|integer',
			'id_grado_materia'  => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'fe_inasistencia'   => 	'required|string|max:0',
			'bo_justificado'    => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $inasistencia = inasistencia::create($request->all());

        return [ 'msj' => 'Inasistencia Agregado Correctamente', compact('inasistencia') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Inasistencia  $inasistencia
     * @return \Illuminate\Http\Response
     */
    public function show(Inasistencia $inasistencia)
    {
        return $inasistencia;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Inasistencia  $inasistencia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Inasistencia $inasistencia)
    {
        $validate = request()->validate([
            'id_estudiante'     => 	'required|integer',
			'id_grado_materia'  => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'fe_inasistencia'   => 	'required|string|max:0',
			'bo_justificado'    => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $inasistencia = $inasistencia->update($request->all());

        return [ 'msj' => 'Inasistencia Editado' , compact('inasistencia')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Inasistencia  $inasistencia
     * @return \Illuminate\Http\Response
     */
    public function destroy(Inasistencia $inasistencia)
    {
        $inasistencia = $inasistencia->delete();
 
        return [ 'msj' => 'Inasistencia Eliminado' , compact('inasistencia')];
    }
}
