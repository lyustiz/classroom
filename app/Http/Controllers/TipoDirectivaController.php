<?php

namespace App\Http\Controllers;

use App\Models\TipoDirectiva;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoDirectivaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoDirectiva = TipoDirectiva::with([])
                    ->get();
        
        return $tipoDirectiva;
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
            'nb_tipo_directiva' => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoDirectiva = tipoDirectiva::create($request->all());

        return [ 'msj' => 'TipoDirectiva Agregado Correctamente', compact('tipoDirectiva') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoDirectiva  $tipoDirectiva
     * @return \Illuminate\Http\Response
     */
    public function show(TipoDirectiva $tipoDirectiva)
    {
        return $tipoDirectiva;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoDirectiva  $tipoDirectiva
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoDirectiva $tipoDirectiva)
    {
        $validate = request()->validate([
            'nb_tipo_directiva' => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoDirectiva = $tipoDirectiva->update($request->all());

        return [ 'msj' => 'TipoDirectiva Editado' , compact('tipoDirectiva')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoDirectiva  $tipoDirectiva
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoDirectiva $tipoDirectiva)
    {
        $tipoDirectiva = $tipoDirectiva->delete();
 
        return [ 'msj' => 'TipoDirectiva Eliminado' , compact('tipoDirectiva')];
    }
}
