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
        return Periodo::with(['calendario:id,nb_calendario'])
                          ->get();
    }

    public function list()
    {
        return Periodo::select('id','nb_periodo')
                          ->activo()
                          ->get();
    }

    public function periodoCalendario($idCalendario)
    {
        return Periodo::with(['calendario:id,nb_calendario'])
                    ->where('id_calendario', $idCalendario)
                    ->activo()
                    ->get();
    }

    public function periodoActivo()
    {
        return Periodo::with(['calendario:id,nb_calendario'])
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
            'nb_periodo'        => 	'required|string|max:30',
            'nu_periodo'        => 	'required|integer|max:999999999',
            'id_calendario'     => 	'required|integer|max:999999999',
			'fe_inicio'         => 	'required|date|before:fe_fin',
		    'fe_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $periodo       = Periodo::create($request->all());

        $periodoActivo = $this->setPeriodoActivo($periodo, 'ins');

        return [ 'msj' => 'Periodo Agregado Correctamente', compact('periodo', 'periodoActivo') ];
    }

    public function setPeriodoActivo($periodo, $method)
    {
        $periodoActivo = Periodo::where('id', '<>', $periodo->id)->where('id_status', 1)->first();

        $hasActivo     = ($periodoActivo) ? true : false;
                
        if($method == 'ins' or $method == 'upd')
        {
            if($periodo->id_status == 1 and $hasActivo){

                return $periodoActivo->update(['id_status' => 2]);

            }elseif($periodo->id_status == 2 and !$hasActivo){

                return $periodo->fill(['id_status' => 1]);
            }
        }

        if($method == 'del')
        {
            if($periodo->id_status == 1){

                return Periodo::where('id', '<>', $periodo->id)
                              ->latest()
                              ->first()
                              ->update(['id_status' => 1]);

            }
        }

        return false;
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
            'nu_periodo'        => 	'required|integer|max:999999999',
			'fe_inicio'         => 	'required|date|before:fe_fin',
		    'fe_fin'            => 	'required|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $update = $periodo->update($request->all());

        $periodoActivo = $this->setPeriodoActivo($periodo, 'upd');

        return [ 'msj' => 'Periodo Editado' , compact('update','periodoActivo')];
    }

    public function updateStatus(Request $request, Periodo $periodo)
    {
        $validate = request()->validate([
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $update = $periodo->update($request->only('id_status', 'id_usuario'));

        $periodoActivo = $this->setPeriodoActivo($periodo, 'upd');

        return [ 'msj' => 'Status actualizado' , compact('update','periodoActivo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Periodo  $periodo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Periodo $periodo)
    {
        $periodoActivo = $this->setPeriodoActivo($periodo, 'del');
        
        $periodo       = $periodo->delete();
        
        return [ 'msj' => 'Periodo Eliminado' , compact('periodo')];
    }
}
