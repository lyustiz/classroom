<?php

namespace App\Http\Controllers;

use App\Models\Modulo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ModuloController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $modulo = Modulo::with([])
                    ->get();
        
        return $modulo;
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
            'nb_modulo'         => 	'required|string|max:50',
			'tx_grupo'          => 	'required|string|max:50',
			'nu_orden'          => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $modulo = modulo::create($request->all());

        return [ 'msj' => 'Modulo Agregado Correctamente', compact('modulo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Modulo  $modulo
     * @return \Illuminate\Http\Response
     */
    public function show(Modulo $modulo)
    {
        return $modulo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Modulo  $modulo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Modulo $modulo)
    {
        $validate = request()->validate([
            'nb_modulo'         => 	'required|string|max:50',
			'tx_grupo'          => 	'required|string|max:50',
			'nu_orden'          => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $modulo = $modulo->update($request->all());

        return [ 'msj' => 'Modulo Editado' , compact('modulo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Modulo  $modulo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Modulo $modulo)
    {
        $modulo = $modulo->delete();
 
        return [ 'msj' => 'Modulo Eliminado' , compact('modulo')];
    }
}
