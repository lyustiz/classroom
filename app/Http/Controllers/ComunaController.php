<?php

namespace App\Http\Controllers;

use App\Models\Comuna;
use Illuminate\Http\Request;

class ComunaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $comunas = Comuna::with(['status'])
                         ->get();
        
        return $comunas;

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

            'co_comuna'         => 'required',
            'nb_comuna'         => 'required',
            'id_zona'           => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $comuna = Comuna::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('comuna') ];
    
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
     * Listar Barrio por COmuna     
     *
     * @return \Illuminate\Http\Response
     */
    public function comunaZona($id_zona)
    {
        $barrios =  Comuna::select('id', 'nb_comuna', 'tx_latitud', 'tx_longitud')
                          ->where('id_zona', $id_zona)
                          ->where('id_status', 1)
                          ->get();

        return $barrios;
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

            'co_comuna'         => 'required',
            'nb_comuna'         => 'required',
            'id_zona'           => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $comuna = $comuna->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('comuna')];
    
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
 
        return [ 'msj' => 'Registro Eliminado' , compact('comuna')];

    }
}
