<?php

namespace App\Http\Controllers;

use App\Models\PruebaAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PruebaAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pruebaAlumno = PruebaAlumno::with([])
                    ->get();
        
        return $pruebaAlumno;
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
            'id_prueba'         => 	'required|integer|max:999999999',
			'fe_prueba'         => 	'required|string|max:0',
			'hh_inicio'         => 	'required|string|max:0',
			'hh_fin'            => 	'required|string|max:0',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $pruebaAlumno = pruebaAlumno::create($request->all());

        return [ 'msj' => 'PruebaAlumno Agregado Correctamente', compact('pruebaAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PruebaAlumno  $pruebaAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(PruebaAlumno $pruebaAlumno)
    {
        return $pruebaAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PruebaAlumno  $pruebaAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PruebaAlumno $pruebaAlumno)
    {
        $validate = request()->validate([
            'id_prueba'         => 	'required|integer|max:999999999',
			'fe_prueba'         => 	'required|string|max:0',
			'hh_inicio'         => 	'required|string|max:0',
			'hh_fin'            => 	'required|string|max:0',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $pruebaAlumno = $pruebaAlumno->update($request->all());

        return [ 'msj' => 'PruebaAlumno Editado' , compact('pruebaAlumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PruebaAlumno  $pruebaAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(PruebaAlumno $pruebaAlumno)
    {
        $pruebaAlumno = $pruebaAlumno->delete();
 
        return [ 'msj' => 'PruebaAlumno Eliminado' , compact('pruebaAlumno')];
    }
}
