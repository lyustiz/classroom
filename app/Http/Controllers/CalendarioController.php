<?php

namespace App\Http\Controllers;

use App\Models\Calendario;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CalendarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $calendario = Calendario::with([])
                    ->get();
        
        return $calendario;
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
            'nb_calendario'     => 	'required|string|max:30',
            'aa_escolar'        => 	'required|integer',
            'fe_inicio'         => 	'required|date|before:fe_fin',
		    'fe_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $calendario = calendario::create($request->all());

        return [ 'msj' => 'Calendario Agregado Correctamente', compact('calendario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Calendario  $calendario
     * @return \Illuminate\Http\Response
     */
    public function show(Calendario $calendario)
    {
        return $calendario;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Calendario  $calendario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Calendario $calendario)
    {
        $validate = request()->validate([
            'nb_calendario'     => 	'required|string|max:30',
            'aa_escolar'        => 	'required|integer',
            'fe_inicio'         => 	'required|date|before:fe_fin',
		    'fe_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $calendario = $calendario->update($request->all());

        return [ 'msj' => 'Calendario Editado' , compact('calendario')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Calendario  $calendario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Calendario $calendario)
    {
        $calendario = $calendario->delete();
 
        return [ 'msj' => 'Calendario Eliminado' , compact('calendario')];
    }
}
