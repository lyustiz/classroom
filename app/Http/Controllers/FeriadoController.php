<?php

namespace App\Http\Controllers;

use App\Models\Feriado;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FeriadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $feriado = Feriado::with(['tipoFeriado:id,nb_tipo_feriado'])
                    ->get();
        
        return $feriado;
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
            'nb_feriado'        => 	'required|string|max:200',
			'id_tipo_feriado'   => 	'required|integer|max:999999999',
			'fe_feriado'        => 	'required|date',
			'aa_feriado'        => 	'required|integer|max:9999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $feriado = feriado::create($request->all());

        return [ 'msj' => 'Feriado Agregado Correctamente', compact('feriado') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Feriado  $feriado
     * @return \Illuminate\Http\Response
     */
    public function show(Feriado $feriado)
    {
        return $feriado;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Feriado  $feriado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Feriado $feriado)
    {
        $validate = request()->validate([
            'nb_feriado'        => 	'required|string|max:200',
			'id_tipo_feriado'   => 	'required|integer|max:999999999',
			'fe_feriado'        => 	'required|date',
			'aa_feriado'        => 	'required|integer|max:9999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $feriado = $feriado->update($request->all());

        return [ 'msj' => 'Feriado Editado' , compact('feriado')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Feriado  $feriado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Feriado $feriado)
    {
        $feriado = $feriado->delete();
 
        return [ 'msj' => 'Feriado Eliminado' , compact('feriado')];
    }
}
