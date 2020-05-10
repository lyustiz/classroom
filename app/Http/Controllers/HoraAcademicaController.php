<?php

namespace App\Http\Controllers;

use App\Models\HoraAcademica;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HoraAcademicaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $horaAcademica = HoraAcademica::with(['turno:id,nb_turno'])
                    ->get();
        
        return $horaAcademica;
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
            'nu_orden'          => 	'required|integer|max:10',
			'hh_inicio'         => 	'required|date_format:"H:i"|before:hh_fin',
			'hh_fin'            => 	'required|date_format:"H:i"',
			'id_turno'          => 	'required|integer|max:10',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:10',
			'id_usuario'        => 	'required|integer|max:10',
        ]);

        $horaAcademica = horaAcademica::create($request->all());

        return [ 'msj' => 'Hora Academica Agregada Correctamente', compact('horaAcademica') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\HoraAcademica  $horaAcademica
     * @return \Illuminate\Http\Response
     */
    public function show(HoraAcademica $horaAcademica)
    {
        return $horaAcademica;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\HoraAcademica  $horaAcademica
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, HoraAcademica $horaAcademica)
    {
        $validate = request()->validate([
            'nu_orden'          => 	'required|integer|max:10',
			'hh_inicio'         => 	'required|date_format:"H:i"|before:hh_fin',
			'hh_fin'            => 	'required|date_format:"H:i"',
			'id_turno'          => 	'required|integer|max:10',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:10',
			'id_usuario'        => 	'required|integer|max:10',
        ]);

        $horaAcademica = $horaAcademica->update($request->all());

        return [ 'msj' => 'Hora Academica Editada' , compact('horaAcademica')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\HoraAcademica  $horaAcademica
     * @return \Illuminate\Http\Response
     */
    public function destroy(HoraAcademica $horaAcademica)
    {
        $horaAcademica = $horaAcademica->delete();
 
        return [ 'msj' => 'Hora Academica Eliminada' , compact('horaAcademica')];
    }
}
