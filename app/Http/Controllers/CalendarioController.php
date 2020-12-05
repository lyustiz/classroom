<?php

namespace App\Http\Controllers;

use App\Models\Calendario;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class CalendarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $calendario = Calendario::with(['periodo:id,nb_periodo,id_calendario',
                                        'periodoActivo:id,nb_periodo,id_calendario'
                                        ])
                                    ->get();
        
        return $calendario;
    }

    public function list()
    {
        return Calendario::comboData()
                         ->activo()
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
            'nb_calendario'     => 	'required|string|max:30',
            'aa_escolar'        => 	'required|integer',
            'fe_inicio'         => 	'required|date|before:fe_fin',
		    'fe_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $calendario = calendario::create($request->all());

        $calendarioActivo = $this->setCalendarioActivo($calendario, 'ins');

        return [ 'msj' => 'Calendario Agregado Correctamente', compact('calendario') ];
    }

    public function setCalendarioActivo($calendario, $method)
    {
        $calendarioActivo = Calendario::where('id', '<>', $calendario->id)->where('id_status', 1)->first();

        $hasActivo     = ($calendarioActivo) ? true : false;
                
        if($method == 'ins' or $method == 'upd')
        {
            if($calendario->id_status == 1 and $hasActivo){

                return $calendarioActivo->update(['id_status' => 2]);

            }elseif($calendario->id_status == 2 and !$hasActivo){
                
                \Cache::put('calendarioActivo', $calendario);
                return $calendario->fill(['id_status' => 1]);
            }
        }

        if($method == 'del')
        {
            if($calendario->id_status == 1){

                $calendarioActivo =  Calendario::where('id', '<>', $calendario->id)
                                    ->latest()
                                    ->first();

                \Cache::put('calendarioActivo', $calendarioActivo);     

                return $calendarioActivo->update(['id_status' => 1]);

            }
        }

        return false;
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

        $calendarioActivo = $this->setCalendarioActivo($calendario, 'upd');

        return [ 'msj' => 'Calendario Editado' , compact('calendario')];
    }

    public function updateStatus(Request $request, Calendario $calendario)
    {
        $validate = request()->validate([
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $update = $calendario->update($request->only('id_status', 'id_usuario'));

        $calendarioActivo = $this->setCalendarioActivo($calendario, 'upd');

        return [ 'msj' => 'Status del Calendario actualizado' , compact('update','calendarioActivo')];
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Calendario  $calendario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Calendario $calendario)
    {
        if( count($calendario->periodo) > 0 )
        {
            throw ValidationException::withMessages(['poseePeriodo' => "Posee Periodo asignado"]);
        }

        $calendarioActivo = $this->setCalendarioActivo($calendario, 'del');

        $calendario = $calendario->delete();
        
        return [ 'msj' => 'Calendario Eliminado' , compact('calendario')];
    }
}
