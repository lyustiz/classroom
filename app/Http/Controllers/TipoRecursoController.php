<?php

namespace App\Http\Controllers;

use App\Models\TipoRecurso;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoRecursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoRecurso = TipoRecurso::with(['tipoArchivo:id,nb_tipo_archivo'])
                    ->get();
        
        return $tipoRecurso;
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
            'nb_tipo_recurso'   => 	'required|string|max:30',
            'id_tipo_archivo'   => 	'required|integer|max:999999999',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoRecurso = tipoRecurso::create($request->all());

        return [ 'msj' => 'TipoRecurso Agregado Correctamente', compact('tipoRecurso') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoRecurso  $tipoRecurso
     * @return \Illuminate\Http\Response
     */
    public function show(TipoRecurso $tipoRecurso)
    {
        return $tipoRecurso;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoRecurso  $tipoRecurso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoRecurso $tipoRecurso)
    {
        $validate = request()->validate([
            'nb_tipo_recurso'   => 	'required|string|max:30',
            'id_tipo_archivo'   => 	'required|integer|max:999999999',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoRecurso = $tipoRecurso->update($request->all());

        return [ 'msj' => 'TipoRecurso Editado' , compact('tipoRecurso')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoRecurso  $tipoRecurso
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoRecurso $tipoRecurso)
    {
        $tipoRecurso = $tipoRecurso->delete();
 
        return [ 'msj' => 'TipoRecurso Eliminado' , compact('tipoRecurso')];
    }
}
