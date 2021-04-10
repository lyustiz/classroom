<?php

namespace App\Http\Controllers;

use App\Models\Barrio;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class BarrioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $barrio = Barrio::with([])
                    ->comuna($request->input('comuna', null))
                    ->orderBy('nb_barrio', 'ASC')
                    ->get();
        
        return $barrio;
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
            'co_barrio'         => 	'required|integer',
			'nb_barrio'         => 	'required|string|max:30',
			'id_comuna'         => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $barrio = barrio::create($request->all());

        return [ 'msj' => 'Barrio Agregado Correctamente', compact('barrio') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Barrio  $barrio
     * @return \Illuminate\Http\Response
     */
    public function show(Barrio $barrio)
    {
        return $barrio;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Barrio  $barrio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Barrio $barrio)
    {
        $validate = request()->validate([
            'co_barrio'         => 	'required|integer',
			'nb_barrio'         => 	'required|string|max:30',
			'id_comuna'         => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $barrio = $barrio->update($request->all());

        return [ 'msj' => 'Barrio Editado' , compact('barrio')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Barrio  $barrio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Barrio $barrio)
    {
        if( count($barrio->comuna) > 0 )
        {
            throw ValidationException::withMessages(['poseeComuna' => "Posee Comuna(s) asociadas"]);
        }
        
        if( count($barrio->colegio) > 0 )
        {
            throw ValidationException::withMessages(['poseeColegio' => "Esta Asociado al Colegio"]);
        }
        
        $barrio = $barrio->delete();
 
        return [ 'msj' => 'Barrio Eliminado' , compact('barrio')];
    }
}
