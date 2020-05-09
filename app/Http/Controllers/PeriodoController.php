<?php

namespace App\Http\Controllers;

use App\Models\Periodo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PeriodoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $periodo = Periodo::with([])
                    ->get();
        
        return $periodo;
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
            'nb_periodo'        => 	'required|string|max:30',
			'fe_inicio'         => 	'required|string|max:0',
			'fe_fin'            => 	'required|string|max:0',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $periodo = periodo::create($request->all());

        return [ 'msj' => 'Periodo Agregado Correctamente', compact('periodo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Periodo  $periodo
     * @return \Illuminate\Http\Response
     */
    public function show(Periodo $periodo)
    {
        return $periodo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Periodo  $periodo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Periodo $periodo)
    {
        $validate = request()->validate([
            'nb_periodo'        => 	'required|string|max:30',
			'fe_inicio'         => 	'required|string|max:0',
			'fe_fin'            => 	'required|string|max:0',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $periodo = $periodo->update($request->all());

        return [ 'msj' => 'Periodo Editado' , compact('periodo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Periodo  $periodo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Periodo $periodo)
    {
        $periodo = $periodo->delete();
 
        return [ 'msj' => 'Periodo Eliminado' , compact('periodo')];
    }
}
