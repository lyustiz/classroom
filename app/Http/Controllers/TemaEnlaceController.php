<?php

namespace App\Http\Controllers;

use App\Models\TemaEnlace;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TemaEnlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TemaEnlace::with([])
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
			'id_enlace'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $temaEnlace = temaEnlace::create($request->all());

        return [ 'msj' => 'TemaEnlace Agregado Correctamente', compact('temaEnlace') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TemaEnlace  $temaEnlace
     * @return \Illuminate\Http\Response
     */
    public function show(TemaEnlace $temaEnlace)
    {
        return $temaEnlace;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TemaEnlace  $temaEnlace
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TemaEnlace $temaEnlace)
    {
        $validate = request()->validate([
            'id_tema'           => 	'required|integer|max:999999999',
			'id_enlace'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $temaEnlace = $temaEnlace->update($request->all());

        return [ 'msj' => 'TemaEnlace Editado' , compact('temaEnlace')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TemaEnlace  $temaEnlace
     * @return \Illuminate\Http\Response
     */
    public function destroy(TemaEnlace $temaEnlace)
    {
        $temaEnlace = $temaEnlace->delete();
 
        return [ 'msj' => 'TemaEnlace Eliminado' , compact('temaEnlace')];
    }
}
