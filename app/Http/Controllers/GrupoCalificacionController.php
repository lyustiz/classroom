<?php

namespace App\Http\Controllers;

use App\Models\GrupoCalificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class GrupoCalificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grupoCalificacion = GrupoCalificacion::with([])
                    ->get();
        
        return $grupoCalificacion;
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
            'nb_grupo_calificacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupoCalificacion = grupoCalificacion::create($request->all());

        return [ 'msj' => 'GrupoCalificacion Agregado Correctamente', compact('grupoCalificacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GrupoCalificacion  $grupoCalificacion
     * @return \Illuminate\Http\Response
     */
    public function show(GrupoCalificacion $grupoCalificacion)
    {
        return $grupoCalificacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GrupoCalificacion  $grupoCalificacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GrupoCalificacion $grupoCalificacion)
    {
        $validate = request()->validate([
            'nb_grupo_calificacion'=> 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupoCalificacion = $grupoCalificacion->update($request->all());

        return [ 'msj' => 'GrupoCalificacion Editado' , compact('grupoCalificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GrupoCalificacion  $grupoCalificacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(GrupoCalificacion $grupoCalificacion)
    {
        if( count($grupoCalificacion->calificacion) > 0 )
        {
            throw ValidationException::withMessages(['poseeCalificacion' => "Posee calificacion(es) asociada(s)"]);
        }
        
        $grupoCalificacion = $grupoCalificacion->delete();
 
        return [ 'msj' => 'GrupoCalificacion Eliminado' , compact('grupoCalificacion')];
    }
}
