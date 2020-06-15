<?php

namespace App\Http\Controllers;

use App\Models\Estructura;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EstructuraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $estructura = Estructura::with(['estructuraPadre:id,nb_estructura'])
                    ->get();
        
        return $estructura;
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
            'nb_estructura'     => 	'required|string|max:30',
			'id_colegio'        => 	'required|integer|max:999999999',
			'id_padre'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tx_path = $this->getPath($request->id_padre, $request->nb_estructura);

        $request-> merge (['tx_path' => $tx_path]);

        $estructura = estructura::create($request->all());

        return [ 'msj' => 'Estructura Agregado Correctamente', compact('estructura') ];
    }

    public function getPath($idPadre, $nbEstructura)
    {
        return Estructura::select('tx_path')
                          ->where('id', $idPadre)
                          ->first()
                          ->tx_path . '>' . $nbEstructura;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Estructura  $estructura
     * @return \Illuminate\Http\Response
     */
    public function show(Estructura $estructura)
    {
        return $estructura;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Estructura  $estructura
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Estructura $estructura)
    {
        $validate = request()->validate([
            'nb_estructura'     => 	'required|string|max:30',
			'id_colegio'        => 	'required|integer|max:999999999',
			'id_padre'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $estructura = $estructura->update($request->all());

        return [ 'msj' => 'Estructura Editado' , compact('estructura')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Estructura  $estructura
     * @return \Illuminate\Http\Response
     */
    public function destroy(Estructura $estructura)
    {
        $estructura = $estructura->delete();
 
        return [ 'msj' => 'Estructura Eliminado' , compact('estructura')];
    }
}
