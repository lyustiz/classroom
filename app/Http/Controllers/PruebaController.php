<?php

namespace App\Http\Controllers;

use App\Models\Prueba;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PruebaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $prueba = Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                    ->get();
        
        return $prueba;
    }

    public function pruebaGrado($idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                      ->where('id_grado', $idGrado)
                      ->get();
    }

    public function pruebaGradoImportar($id_prueba, $idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                      ->where('id_grado', $idGrado)
                      ->where('id', '<>', $id_prueba)
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
            'nb_prueba'         => 	  'required|string|max:100',
            'id_grado'          => 	  'required|integer|max:999999999',
			'id_grupo'          => 	  'nullable|integer|max:999999999',
			'id_evaluacion_detalle'=> 'nullable|integer|max:999999999',
			'bo_ver_resultado'  => 	  'required|boolean',
			'nu_minutos'        => 	  'nullable|integer|max:999999999',
			'fe_prueba'         => 	  'nullable|date',
			'hh_inicio'         =>    'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'            =>    'nullable|date_format:"H:i"',
			'nu_valor_total'    => 	  'nullable|integer|max:999999999',
			'tx_observaciones'  => 	  'nullable|string|max:100',
			'id_status'         => 	  'required|integer|max:999999999',
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);

        $prueba = prueba::create($request->all());

        return [ 'msj' => 'Prueba Agregado Correctamente', compact('prueba') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function show(Prueba $prueba)
    {
        return $prueba;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
            'nb_prueba'         => 	  'required|string|max:100',
            'id_grado'          => 	  'required|integer|max:999999999',
			'id_grupo'          => 	  'nullable|integer|max:999999999',
			'id_evaluacion_detalle'=> 'nullable|integer|max:999999999',
			'bo_ver_resultado'  => 	  'required|boolean',
			'nu_minutos'        => 	  'nullable|integer|max:999999999',
			'fe_prueba'         => 	  'nullable|date',
			'hh_inicio'         =>    'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'            =>    'nullable|date_format:"H:i"',
			'nu_valor_total'    => 	  'nullable|integer|max:999999999',
			'tx_observaciones'  => 	  'nullable|string|max:100',
			'id_status'         => 	  'required|integer|max:999999999',
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Editado' , compact('prueba')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function destroy(Prueba $prueba)
    {
        $prueba = $prueba->delete();
 
        return [ 'msj' => 'Prueba Eliminado' , compact('prueba')];
    }
}
