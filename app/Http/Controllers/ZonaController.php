<?php

namespace App\Http\Controllers;

use App\Models\Zona;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class ZonaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $zona = Zona::with([])
                    ->get();
        
        return $zona;
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
            'co_zona'           => 	'required|integer',
			'nb_zona'           => 	'required|string|max:30',
			'id_ciudad'         => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $zona = zona::create($request->all());

        return [ 'msj' => 'Zona Agregado Correctamente', compact('zona') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Zona  $zona
     * @return \Illuminate\Http\Response
     */
    public function show(Zona $zona)
    {
        return $zona;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Zona  $zona
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Zona $zona)
    {
        $validate = request()->validate([
            'co_zona'           => 	'required|integer',
			'nb_zona'           => 	'required|string|max:30',
			'id_ciudad'         => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $zona = $zona->update($request->all());

        return [ 'msj' => 'Zona Editado' , compact('zona')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Zona  $zona
     * @return \Illuminate\Http\Response
     */
    public function destroy(Zona $zona)
    {
        if( count($zona->comuna) > 0 )
        {
            throw ValidationException::withMessages(['poseeComuna' => "Posee Comuna(s) asociada(s)"]);
        }
        
        if( count($zona->colegio) > 0 )
        {
            throw ValidationException::withMessages(['poseeColegio' => "Esta Asociado al Colegio"]);
        }
        
        
        $zona = $zona->delete();
 
        return [ 'msj' => 'Zona Eliminado' , compact('zona')];
    }
}
