<?php

namespace App\Http\Controllers;

use App\Models\Horario;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HorarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $horario = Horario::with([])
                    ->get();
        
        return $horario;
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
            'co_horario'        => 	'required|string|max:100',
			'id_grado_materia'  => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'id_dia_semana'     => 	'required|integer',
			'hh_inicio'         => 	'required|date',
			'hh_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $horario = horario::create($request->all());

        return [ 'msj' => 'Horario Agregado Correctamente', compact('horario') ];
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
            'co_horario'        => 	'required|string|max:100',
			'id_grado_materia'  => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'id_dia_semana'     => 	'required|integer',
			'hh_inicio'         => 	'required|date',
			'hh_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $horario = $horario->update($request->all());

        return [ 'msj' => 'Horario Editado' , compact('horario')];
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
 
        return [ 'msj' => 'Horario Eliminado' , compact('horario')];
    }
}
