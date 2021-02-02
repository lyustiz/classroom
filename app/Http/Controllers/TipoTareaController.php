<?php

namespace App\Http\Controllers;

use App\Models\TipoTarea;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoTareaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TipoTarea::with([])
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
            'nb_tipo_tarea'     => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoTarea = tipoTarea::create($request->all());

        return [ 'msj' => 'Tipo Tarea Agregada Correctamente', compact('tipoTarea') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoTarea  $tipoTarea
     * @return \Illuminate\Http\Response
     */
    public function show(TipoTarea $tipoTarea)
    {
        return $tipoTarea;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoTarea  $tipoTarea
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoTarea $tipoTarea)
    {
        $validate = request()->validate([
            'nb_tipo_tarea'     => 	'required|string|max:30',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoTarea = $tipoTarea->update($request->all());

        return [ 'msj' => 'Tipo Tarea Editada' , compact('tipoTarea')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoTarea  $tipoTarea
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoTarea $tipoTarea)
    {
        $tipoTarea = $tipoTarea->delete();
 
        return [ 'msj' => 'Tipo Tarea Eliminada' , compact('tipoTarea')];
    }
}
