<?php

namespace App\Http\Controllers;

use App\Models\Jornada;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class JornadaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jornada = Jornada::with([])
                    ->get();
        
        return $jornada;
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
            'nb_jornada'        => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:10',
			'id_usuario'        => 	'required|integer|max:10',
        ]);

        $jornada = jornada::create($request->all());

        return [ 'msj' => 'Jornada Agregado Correctamente', compact('jornada') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Jornada  $jornada
     * @return \Illuminate\Http\Response
     */
    public function show(Jornada $jornada)
    {
        return $jornada;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Jornada  $jornada
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Jornada $jornada)
    {
        $validate = request()->validate([
            'nb_jornada'        => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:10',
			'id_usuario'        => 	'required|integer|max:10',
        ]);

        $jornada = $jornada->update($request->all());

        return [ 'msj' => 'Jornada Editado' , compact('jornada')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Jornada  $jornada
     * @return \Illuminate\Http\Response
     */
    public function destroy(Jornada $jornada)
    {
        $jornada = $jornada->delete();
 
        return [ 'msj' => 'Jornada Eliminado' , compact('jornada')];
    }
}
