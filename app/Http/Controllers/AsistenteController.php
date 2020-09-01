<?php

namespace App\Http\Controllers;

use App\Models\Asistente;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AsistenteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $asistente = Asistente::with([])
                    ->get();
        
        return $asistente;
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
            'nb_asistente'      => 	'required|string|max:50',
			'id_menu'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'tx_color'          => 	'nullable|string|max:30',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_grupo'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asistente = asistente::create($request->all());

        return [ 'msj' => 'Asistente Agregado Correctamente', compact('asistente') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Asistente  $asistente
     * @return \Illuminate\Http\Response
     */
    public function show(Asistente $asistente)
    {
        return $asistente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Asistente  $asistente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Asistente $asistente)
    {
        $validate = request()->validate([
            'nb_asistente'      => 	'required|string|max:50',
			'id_menu'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'tx_color'          => 	'nullable|string|max:30',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_grupo'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asistente = $asistente->update($request->all());

        return [ 'msj' => 'Asistente Editado' , compact('asistente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Asistente  $asistente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Asistente $asistente)
    {
        $asistente = $asistente->delete();
 
        return [ 'msj' => 'Asistente Eliminado' , compact('asistente')];
    }
}
