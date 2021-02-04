<?php

namespace App\Http\Controllers;

use App\Models\HoraAcademica;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class HoraAcademicaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $horaAcademica = HoraAcademica::with(['nivel:id,nb_nivel', 'cargaHoraria:id,nb_carga_horaria,id_hora_academica'])
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
            'nb_hora_academica' => 	'required|string|max:80',
            'id_nivel'          => 	'nullable|integer|max:999999999',
            'bo_receso'         => 	'nullable|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        if (!$request->filled('id_nivel')) {
            $request->merge(['id_nivel' => 0]);
        }

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
            'nb_hora_academica' => 	'required|string|max:80',
            'id_nivel'          => 	'nullable|integer|max:999999999',
            'bo_receso'         => 	'nullable|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        if (!$request->filled('id_nivel')) {
            $request->merge(['id_nivel' => 0]);
        }

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
        if( count($horaAcademica->cargaHoraria) > 0 )
        {
            throw ValidationException::withMessages(['poseeCargaHoraria' =>  "Posee Carga Horaria(s) asociada(s)"]);
        }
        
        $horaAcademica = $horaAcademica->delete();
 
        return [ 'msj' => 'Hora Academica Eliminada' , compact('horaAcademica')];
    }
}
