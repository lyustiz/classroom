<?php

namespace App\Http\Controllers;

use App\Models\Pais;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PaisController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pais = Pais::with([])
                    ->get();
        
        return $pais;
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
            'nb_pais'           => 	'required|string|max:30',
			'co_pais'           => 	'required|integer|max:200',
			'tx_iso'            => 	'required|string|max:3',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pais = pais::create($request->all());

        return [ 'msj' => 'Pais Agregado Correctamente', compact('pais') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pais  $pais
     * @return \Illuminate\Http\Response
     */
    public function show(Pais $pais)
    {
        return $pais;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pais  $pais
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pais $pais)
    {
        $validate = request()->validate([
            'nb_pais'           => 	'required|string|max:30',
			'co_pais'           => 	'required|integer',
			'tx_iso'            => 	'required|string|max:3',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $pais = $pais->update($request->all());

        return [ 'msj' => 'Pais Editado' , compact('pais')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pais  $pais
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pais $pais)
    {
        $pais = $pais->delete();
 
        return [ 'msj' => 'Pais Eliminado' , compact('pais')];
    }
}
