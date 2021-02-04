<?php

namespace App\Http\Controllers;

use App\Models\EstadoCivil;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class EstadoCivilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $estadoCivil = EstadoCivil::with([])
                    ->get();
        
        return $estadoCivil;
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
            'nb_estado_civil'   => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $estadoCivil = estadoCivil::create($request->all());

        return [ 'msj' => 'EstadoCivil Agregado Correctamente', compact('estadoCivil') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\EstadoCivil  $estadoCivil
     * @return \Illuminate\Http\Response
     */
    public function show(EstadoCivil $estadoCivil)
    {
        return $estadoCivil;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EstadoCivil  $estadoCivil
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EstadoCivil $estadoCivil)
    {
        $validate = request()->validate([
            'nb_estado_civil'   => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $estadoCivil = $estadoCivil->update($request->all());

        return [ 'msj' => 'EstadoCivil Editado' , compact('estadoCivil')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EstadoCivil  $estadoCivil
     * @return \Illuminate\Http\Response
     */
    public function destroy(EstadoCivil $estadoCivil)
    {
        if( count($departamento->empleado) > 0 )
        {
            throw ValidationException::withMessages(['poseeEmpleado' => "Se ha asignado a Empleado(s)"]);
        }

        if( count($departamento->pariente) > 0 )
        {
            throw ValidationException::withMessages(['poseePariente' => "Se ha asignado a Acudiente(s)"]);
        }

        if( count($departamento->docente) > 0 )
        {
            throw ValidationException::withMessages(['poseeDocente' => "Se ha asignado a Docente(s)"]);
        }
        
        
        $estadoCivil = $estadoCivil->delete();
 
        return [ 'msj' => 'EstadoCivil Eliminado' , compact('estadoCivil')];
    }
}
