<?php

namespace App\Http\Controllers;

use App\Models\AccionTema;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AccionTemaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return AccionTema::with([])
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
            'nb_accion_tema'    => 	'required|string|max:100',
			'id_tema'           => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'id_tipo_accion'    => 	'required|integer|max:999999999',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $accionTema = accionTema::create($request->all());

        return [ 'msj' => 'AccionTema Agregado Correctamente', compact('accionTema') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AccionTema  $accionTema
     * @return \Illuminate\Http\Response
     */
    public function show(AccionTema $accionTema)
    {
        return $accionTema;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AccionTema  $accionTema
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AccionTema $accionTema)
    {
        $validate = request()->validate([
            'nb_accion_tema'    => 	'required|string|max:100',
			'id_tema'           => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'id_tipo_accion'    => 	'required|integer|max:999999999',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $accionTema = $accionTema->update($request->all());

        return [ 'msj' => 'AccionTema Editado' , compact('accionTema')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AccionTema  $accionTema
     * @return \Illuminate\Http\Response
     */
    public function destroy(AccionTema $accionTema)
    {
        $accionTema = $accionTema->delete();
 
        return [ 'msj' => 'AccionTema Eliminado' , compact('accionTema')];
    }
}
