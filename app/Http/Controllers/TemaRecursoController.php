<?php

namespace App\Http\Controllers;

use App\Models\TemaRecurso;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TemaRecursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TemaRecurso::with([])
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
            'id_tema'           => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'id_recurso_categoria'=> 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $temaRecurso = temaRecurso::create($request->all());

        return [ 'msj' => 'TemaRecurso Agregado Correctamente', compact('temaRecurso') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TemaRecurso  $temaRecurso
     * @return \Illuminate\Http\Response
     */
    public function show(TemaRecurso $temaRecurso)
    {
        return $temaRecurso;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TemaRecurso  $temaRecurso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TemaRecurso $temaRecurso)
    {
        $validate = request()->validate([
            'id_tema'           => 	'required|integer|max:999999999',
			'id_recurso'        => 	'required|integer|max:999999999',
			'id_recurso_categoria'=> 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $temaRecurso = $temaRecurso->update($request->all());

        return [ 'msj' => 'TemaRecurso Editado' , compact('temaRecurso')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TemaRecurso  $temaRecurso
     * @return \Illuminate\Http\Response
     */
    public function destroy(TemaRecurso $temaRecurso)
    {
        $temaRecurso = $temaRecurso->delete();
 
        return [ 'msj' => 'TemaRecurso Eliminado' , compact('temaRecurso')];
    }
}
