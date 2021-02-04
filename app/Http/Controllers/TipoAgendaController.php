<?php

namespace App\Http\Controllers;

use App\Models\TipoAgenda;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class TipoAgendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoAgenda = TipoAgenda::with([])
                    ->get();
        
        return $tipoAgenda;
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
            'nb_tipo_agenda'    => 	'required|string|max:30',
            'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoAgenda = tipoAgenda::create($request->all());

        return [ 'msj' => 'TipoAgenda Agregado Correctamente', compact('tipoAgenda') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoAgenda  $tipoAgenda
     * @return \Illuminate\Http\Response
     */
    public function show(TipoAgenda $tipoAgenda)
    {
        return $tipoAgenda;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoAgenda  $tipoAgenda
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoAgenda $tipoAgenda)
    {
        $validate = request()->validate([
            'nb_tipo_agenda'    => 	'required|string|max:30',
            'tx_color'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoAgenda = $tipoAgenda->update($request->all());

        return [ 'msj' => 'TipoAgenda Editado' , compact('tipoAgenda')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoAgenda  $tipoAgenda
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoAgenda $tipoAgenda)
    {
        if( count($tipoAgenda->agenda) > 0 )
        {
            throw ValidationException::withMessages(['poseeAgenda' => "Posee actividad(es) en la Agenda asociada(s)"]);
        }
        
        $tipoAgenda = $tipoAgenda->delete();
 
        return [ 'msj' => 'TipoAgenda Eliminado' , compact('tipoAgenda')];
    }
}
