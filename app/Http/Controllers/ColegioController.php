<?php

namespace App\Http\Controllers;

use App\Models\Colegio;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ColegioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $colegio = Colegio::with(['tipoColegio'])
                    ->get();
        
        return $colegio;
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
            'nb_colegio'        => 	'required|string|max:50',
            'tx_codigo'         => 	'required|string|max:20',
			'id_tipo_colegio'   => 	'required|integer',
            'id_calendario'     => 	'required|integer',
            'id_jornada'        => 	'required|integer',
			'id_departamento'   => 	'required|integer',
			'id_ciudad'         => 	'required|integer',
			'id_zona'           => 	'required|integer',
			'id_comuna'         => 	'required|integer',
			'id_barrio'         => 	'required|integer',
			'tx_direccion'      => 	'required|string|max:80',
			'tx_telefono'       => 	'required|string|max:20',
            'nu_estudiantes'    => 	'required|integer',
            'tx_logo'           =>  'nullable|string|max:100',
			'nu_latitud'        => 	'nullable|string|max:20',
			'nu_longitud'       => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $colegio = colegio::create($request->all());

        return [ 'msj' => 'Colegio Agregado Correctamente', compact('colegio') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Colegio  $colegio
     * @return \Illuminate\Http\Response
     */
    public function show(Colegio $colegio)
    {
        return $colegio;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Colegio  $colegio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Colegio $colegio)
    {
        $validate = request()->validate([
            'nb_colegio'        => 	'required|string|max:50',
            'tx_codigo'         => 	'required|string|max:20',
			'id_tipo_colegio'   => 	'required|integer',
            'id_calendario'     => 	'required|integer',
            'id_jornada'        => 	'required|integer',
			'id_departamento'   => 	'required|integer',
			'id_ciudad'         => 	'required|integer',
			'id_zona'           => 	'required|integer',
			'id_comuna'         => 	'required|integer',
			'id_barrio'         => 	'required|integer',
			'tx_direccion'      => 	'required|string|max:80',
			'tx_telefono'       => 	'required|string|max:20',
            'nu_estudiantes'    => 	'required|integer',
            'tx_logo'           =>  'nullable|string|max:100',
			'nu_latitud'        => 	'nullable|string|max:20',
			'nu_longitud'       => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $colegio = $colegio->update($request->all());

        return [ 'msj' => 'Colegio Editado' , compact('colegio')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Colegio  $colegio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Colegio $colegio)
    {
        $colegio = $colegio->delete();
 
        return [ 'msj' => 'Colegio Eliminado' , compact('colegio')];
    }
}
