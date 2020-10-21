<?php

namespace App\Http\Controllers;

use App\Models\TipoEnlace;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoEnlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TipoEnlace::with([])
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
            'nb_tipo_enlace'    => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoEnlace = tipoEnlace::create($request->all());

        return [ 'msj' => 'TipoEnlace Agregado Correctamente', compact('tipoEnlace') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoEnlace  $tipoEnlace
     * @return \Illuminate\Http\Response
     */
    public function show(TipoEnlace $tipoEnlace)
    {
        return $tipoEnlace;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoEnlace  $tipoEnlace
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoEnlace $tipoEnlace)
    {
        $validate = request()->validate([
            'nb_tipo_enlace'    => 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:30',
			'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoEnlace = $tipoEnlace->update($request->all());

        return [ 'msj' => 'TipoEnlace Editado' , compact('tipoEnlace')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoEnlace  $tipoEnlace
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoEnlace $tipoEnlace)
    {
        $tipoEnlace = $tipoEnlace->delete();
 
        return [ 'msj' => 'TipoEnlace Eliminado' , compact('tipoEnlace')];
    }
}
