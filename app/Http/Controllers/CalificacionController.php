<?php

namespace App\Http\Controllers;

use App\Models\Calificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CalificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $calificacion = Calificacion::with(['grupoCalificacion:id,nb_grupo_calificacion', 
                                            'tipoCalificacion:id,nb_tipo_calificacion', 
                                            'nivelCalificacion:id,nb_nivel_calificacion'
                                            ])
                                            ->orderBy('nu_orden', 'asc')
                                        ->get();
        
        return $calificacion;
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
            'nb_calificacion'       => 'nullable|string|max:30',
            'nu_calificacion'       => 'required|numeric',
            'co_calificacion'       => 'nullable|string|max:20',
            'bo_aprobado'           => 'required|boolean',
            'nu_orden'              => 'required|integer',
            'id_grupo_calificacion' => 'required|integer',
            'id_tipo_calificacion'  => 'required|integer',
            'id_nivel_calificacion' => 'required|integer',
            'tx_observaciones'      => 'nullable|string|max:100',
            'id_status'             => 'required|integer',
            'id_usuario'            => 'required|integer',
        ]);

        $calificacion = calificacion::create($request->all());

        return [ 'msj' => 'Calificacion Agregado Correctamente', compact('calificacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Calificacion  $calificacion
     * @return \Illuminate\Http\Response
     */
    public function show(Calificacion $calificacion)
    {
        return $calificacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Calificacion  $calificacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Calificacion $calificacion)
    {
        $validate = request()->validate([
            'nb_calificacion'       => 'nullable|string|max:30',
            'nu_calificacion'       => 'required|numeric',
            'co_calificacion'       => 'nullable|string|max:20',
            'bo_aprobado'           => 'required|boolean',
            'nu_orden'              => 'required|integer',
            'id_grupo_calificacion' => 'required|integer',
            'id_tipo_calificacion'  => 'required|integer',
            'id_nivel_calificacion' => 'required|integer',
            'tx_observaciones'      => 'nullable|string|max:100',
            'id_status'             => 'required|integer',
            'id_usuario'            => 'required|integer',
        ]);

        $calificacion = $calificacion->update($request->all());

        return [ 'msj' => 'Calificacion Editado' , compact('calificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Calificacion  $calificacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Calificacion $calificacion)
    {
        $calificacion = $calificacion->delete();
 
        return [ 'msj' => 'Calificacion Eliminado' , compact('calificacion')];
    }
}
