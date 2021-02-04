<?php

namespace App\Http\Controllers;

use App\Models\AgendaActividad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class AgendaActividadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return AgendaActividad::with([])
                    ->get();
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
            'nb_agenda_actividad'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:45',
			'tx_color'          => 	'nullable|string|max:40',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $agendaActividad = agendaActividad::create($request->all());

        return [ 'msj' => 'AgendaActividad Agregado Correctamente', compact('agendaActividad') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AgendaActividad  $agendaActividad
     * @return \Illuminate\Http\Response
     */
    public function show(AgendaActividad $agendaActividad)
    {
        return $agendaActividad;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AgendaActividad  $agendaActividad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AgendaActividad $agendaActividad)
    {
        $validate = request()->validate([
            'nb_agenda_actividad'=> 	'required|string|max:30',
			'tx_icono'          => 	'required|string|max:45',
			'tx_color'          => 	'nullable|string|max:40',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $agendaActividad = $agendaActividad->update($request->all());

        return [ 'msj' => 'AgendaActividad Editado' , compact('agendaActividad')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AgendaActividad  $agendaActividad
     * @return \Illuminate\Http\Response
     */
    public function destroy(AgendaActividad $agendaActividad)
    {
        if( count($agendaActividad->agenda) > 0 )
        {
            throw ValidationException::withMessages(['poseeAgenda' => "Ha sido asignada a una agenda"]);
        }
        
        $agendaActividad = $agendaActividad->delete();
 
        return [ 'msj' => 'AgendaActividad Eliminado' , compact('agendaActividad')];
    }
}
