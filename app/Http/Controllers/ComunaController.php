<?php

namespace App\Http\Controllers;

use App\Models\Comuna;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ComunaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $comuna = Comuna::with([])
                    ->get();
        
        return $comuna;
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
            'co_comuna'         => 	'required|integer',
			'nb_comuna'         => 	'required|string|max:30',
			'id_zona'           => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $comuna = comuna::create($request->all());

        return [ 'msj' => 'Comuna Agregado Correctamente', compact('comuna') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Comuna  $comuna
     * @return \Illuminate\Http\Response
     */
    public function show(Comuna $comuna)
    {
        return $comuna;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Comuna  $comuna
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Comuna $comuna)
    {
        $validate = request()->validate([
            'co_comuna'         => 	'required|integer',
			'nb_comuna'         => 	'required|string|max:30',
			'id_zona'           => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $comuna = $comuna->update($request->all());

        return [ 'msj' => 'Comuna Editado' , compact('comuna')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Comuna  $comuna
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comuna $comuna)
    {
        $comuna = $comuna->delete();
 
        return [ 'msj' => 'Comuna Eliminado' , compact('comuna')];
    }
}
