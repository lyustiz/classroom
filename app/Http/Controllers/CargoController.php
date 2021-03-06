<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class CargoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cargo = Cargo::with([])
                    ->get();
        
        return $cargo;
    }

    public function list()
    {
        return Cargo::comboData()
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
            'nb_cargo'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $cargo = cargo::create($request->all());

        return [ 'msj' => 'Cargo Agregado Correctamente', compact('cargo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cargo  $cargo
     * @return \Illuminate\Http\Response
     */
    public function show(Cargo $cargo)
    {
        return $cargo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cargo  $cargo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cargo $cargo)
    {
        $validate = request()->validate([
            'nb_cargo'          => 	'required|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $cargo = $cargo->update($request->all());

        return [ 'msj' => 'Cargo Editado' , compact('cargo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cargo  $cargo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cargo $cargo)
    {
        
        if( count($cargo->directiva) > 0 )
        {
            throw ValidationException::withMessages(['poseeDirectiva' => "Posee Directiva asignada"]);
        }

        if( count($cargo->empleado) > 0 )
        {
            throw ValidationException::withMessages(['poseeEmpleado' => "Posee Empleado asignado"]);
        }
        
        $cargo = $cargo->delete();
 
        return [ 'msj' => 'Cargo Eliminado' , compact('cargo')];
    }
}
