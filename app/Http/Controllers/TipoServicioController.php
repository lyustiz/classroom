<?php

namespace App\Http\Controllers;

use App\Models\TipoServicio;
use Illuminate\Http\Request;

class TipoServicioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoServicios = TipoServicio::with(['status'])
                        ->get();
        
        return $tipoServicios;

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

            'nb_tipo_servicio'  => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $tipoServicio = TipoServicio::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('tipoServicio') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoServicio  $tipoServicio
     * @return \Illuminate\Http\Response
     */
    public function show(TipoServicio $tipoServicio)
    {
        return $tipoServicio;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoServicio  $tipoServicio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoServicio $tipoServicio)
    {
        $validate = request()->validate([

            'nb_tipo_servicio'  => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);
        
        $tipoServicio = $tipoServicio->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('tipoServicio')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoServicio  $tipoServicio
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoServicio $tipoServicio)
    {
        $tipoServicio = $tipoServicio->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('tipoServicio')];

    }
}
