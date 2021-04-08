<?php

namespace App\Http\Controllers;

use App\Models\Ciudad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class CiudadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ciudad = Ciudad::with([])
                    ->get();
        
        return $ciudad;
    }

    public function ciudadDepartamento($idDepartamento)
    {
        return Ciudad::where('id_departamento', $idDepartamento)
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
            'co_ciudad'         => 	'required|integer',
			'nb_ciudad'         => 	'required|string|max:30',
			'id_departamento'   => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $ciudad = ciudad::create($request->all());

        return [ 'msj' => 'Ciudad Agregado Correctamente', compact('ciudad') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function show(Ciudad $ciudad)
    {
        return $ciudad;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ciudad $ciudad)
    {
        $validate = request()->validate([
            'co_ciudad'         => 	'required|integer',
			'nb_ciudad'         => 	'required|string|max:30',
			'id_departamento'   => 	'required|integer',
			'tx_latitud'        => 	'required|string|max:20',
			'tx_longitud'       => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $ciudad = $ciudad->update($request->all());

        return [ 'msj' => 'Ciudad Editado' , compact('ciudad')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ciudad  $ciudad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ciudad $ciudad)
    {
        if( count($ciudad->zona) > 0 )
        {
            throw ValidationException::withMessages(['poseeZona' => "Posee Zona(s) asociada(s)"]);
        }
        
        if( count($ciudad->colegio) > 0 )
        {
            throw ValidationException::withMessages(['poseeColegio' => "Esta Asociado al Colegio"]);
        }
        
        $ciudad = $ciudad->delete();
 
        return [ 'msj' => 'Ciudad Eliminado' , compact('ciudad')];
    }
}
