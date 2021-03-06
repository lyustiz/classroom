<?php

namespace App\Http\Controllers;

use App\Models\Turno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class TurnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $turno = Turno::with([])
                    ->get();
        
        return $turno;
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
            'nb_turno'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $turno = turno::create($request->all());

        return [ 'msj' => 'Turno Agregado Correctamente', compact('turno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Turno  $turno
     * @return \Illuminate\Http\Response
     */
    public function show(Turno $turno)
    {
        return $turno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Turno  $turno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Turno $turno)
    {
        $validate = request()->validate([
            'nb_turno'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $turno = $turno->update($request->all());

        return [ 'msj' => 'Turno Editado' , compact('turno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Turno  $turno
     * @return \Illuminate\Http\Response
     */
    public function destroy(Turno $turno)
    {
        if( count($turno->cargaHoraria) > 0 )
        {
            throw ValidationException::withMessages(['poseeCargaHoraria' => "Posee carga(s) horaria asociada(s)"]);
        }

        if( count($turno->grupo) > 0 )
        {
            throw ValidationException::withMessages(['poseeGrupo' => "Posee Grupo(s) asociado(s)"]);
        }
        
        $turno = $turno->delete();
 
        return [ 'msj' => 'Turno Eliminado' , compact('turno')];
    }
}
