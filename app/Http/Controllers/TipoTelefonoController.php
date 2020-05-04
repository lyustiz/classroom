<?php

namespace App\Http\Controllers;

use App\Models\TipoTelefono;
use Illuminate\Http\Request;

class TipoTelefonoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoTelefonos = TipoTelefono::with(['status'])
                        ->get();
        
        return $tipoTelefonos;

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

            'nb_tipo_telefono'  => 'required',
            'tx_icono'          => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $tipoTelefono = TipoTelefono::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('tipoTelefono') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoTelefono  $tipoTelefono
     * @return \Illuminate\Http\Response
     */
    public function show(TipoTelefono $tipoTelefono)
    {
        return $tipoTelefono;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoTelefono  $tipoTelefono
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoTelefono $tipoTelefono)
    {
        $validate = request()->validate([

            'nb_tipo_telefono'  => 'required',
            'tx_icono'          => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $tipoTelefono = $tipoTelefono->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('tipoTelefono')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoTelefono  $tipoTelefono
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoTelefono $tipoTelefono)
    {
        $tipoTelefono = $tipoTelefono->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('tipoTelefono')];

    }
}
