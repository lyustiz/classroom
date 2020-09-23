<?php

namespace App\Http\Controllers;

use App\Models\Aula;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class AulaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $aula = Aula::with(['estructura:id,nb_estructura,tx_path'])
                    ->get();
        
        return $aula;
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
            'nb_aula'           => 	'required|string|max:50',
			'id_estructura'     => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $aula = aula::create($request->all());

        return [ 'msj' => 'Aula Agregada Correctamente', compact('aula') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Aula  $aula
     * @return \Illuminate\Http\Response
     */
    public function show(Aula $aula)
    {
        return $aula;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Aula  $aula
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Aula $aula)
    {
        $validate = request()->validate([
            'nb_aula'           => 	'required|string|max:50',
			'id_estructura'     => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $aula = $aula->update($request->all());

        return [ 'msj' => 'Aula Editada' , compact('aula')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Aula  $aula
     * @return \Illuminate\Http\Response
     */
    public function destroy(Aula $aula)
    {
        if( count($aula->detalleHorario) > 0 )
        {
            throw ValidationException::withMessages(['poseeHorario' => "Posee Horario asignado"]);
        }
        
        $aula = $aula->delete();
 
        return [ 'msj' => 'Aula Eliminada' , compact('aula')];
    }
}
