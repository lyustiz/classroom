<?php

namespace App\Http\Controllers;

use App\Models\Horario;
use Illuminate\Http\Request;

class HorarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $horarios = Horario::with(['status'])
                           ->get();
        
        return $horarios;

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

            'nb_horario'        => 'required|60',
            'id_comercio'       => 'required',
            'tx_entrada'        => 'required',
            'tx_salida'         => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $horario = Horario::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('horario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function show(Horario $horario)
    {
        return $horario;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Horario $horario)
    {
        $validate = request()->validate([

            'nb_horario'        => 'required',
            'id_comercio'       => 'required',
            'tx_entrada'        => 'required',
            'tx_salida'         => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
            
        ]);
        
        $horario = $horario->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('horario')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Horario $horario)
    {
        $horario = $horario->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('horario')];

    }
}
