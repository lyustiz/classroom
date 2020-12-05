<?php

namespace App\Http\Controllers;

use App\Models\Agenda;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\AgendaResource;

class AgendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $agenda = Agenda::with([
                            'tipoAgenda:id,nb_tipo_agenda,tx_color', 
                            'agendaActividad:id,nb_agenda_actividad,tx_icono'
                            ])->get();
    
        return AgendaResource::collection($agenda);
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
            'nb_agenda'           => 'required|string|max:200',
			'id_calendario'       => 'required|integer|max:999999999',
            'id_tipo_agenda'      => 'required|integer|max:999999999',
            'id_agenda_actividad' => 'required|integer|max:999999999',
			'fe_agenda'           => 'required|date',
			'hh_inicio'           => 'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'              => 'required|date_format:"H:i"',
			'id_origen'           => 'required|integer|max:999999999',
			'tx_observaciones'    => 'nullable|string|max:100',
			'id_status'           => 'required|integer|max:999999999',
			'id_usuario'          => 'required|integer|max:999999999',
        ]);

        $agenda = agenda::create($request->all());

        return [ 'msj' => 'Actividad Agregada Correctamente', compact('agenda') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Agenda  $agenda
     * @return \Illuminate\Http\Response
     */
    public function show(Agenda $agenda)
    {
        return $agenda;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Agenda  $agenda
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Agenda $agenda)
    {
        $validate = request()->validate([
            'nb_agenda'           => 'required|string|max:200',
			'id_calendario'       => 'required|integer|max:999999999',
            'id_tipo_agenda'      => 'required|integer|max:999999999',
            'id_agenda_actividad' => 'required|integer|max:999999999',
			'fe_agenda'           => 'required|date',
			'hh_inicio'           => 'required|date_format:"H:i"|before:hh_fin"',
            'hh_fin'              => 'required|date_format:"H:i"',
			'id_origen'           => 'required|integer|max:999999999',
			'tx_observaciones'    => 'nullable|string|max:100',
			'id_status'           => 'required|integer|max:999999999',
			'id_usuario'          => 'required|integer|max:999999999',
        ]);

        $agenda = $agenda->update($request->all());

        return [ 'msj' => 'Actividad Editada' , compact('agenda')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Agenda  $agenda
     * @return \Illuminate\Http\Response
     */
    public function destroy(Agenda $agenda)
    {
        $agenda = $agenda->delete();
 
        return [ 'msj' => 'Evento Eliminado' , compact('agenda')];
    }
}
