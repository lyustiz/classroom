<?php

namespace App\Http\Controllers;

use App\Models\TipoColegio;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class TipoColegioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoColegio = TipoColegio::with([])
                    ->get();
        
        return $tipoColegio;
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
            'nb_tipo_colegio'   => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoColegio = tipoColegio::create($request->all());

        return [ 'msj' => 'TipoColegio Agregado Correctamente', compact('tipoColegio') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoColegio  $tipoColegio
     * @return \Illuminate\Http\Response
     */
    public function show(TipoColegio $tipoColegio)
    {
        return $tipoColegio;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoColegio  $tipoColegio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoColegio $tipoColegio)
    {
        $validate = request()->validate([
            'nb_tipo_colegio'   => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $tipoColegio = $tipoColegio->update($request->all());

        return [ 'msj' => 'TipoColegio Editado' , compact('tipoColegio')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoColegio  $tipoColegio
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoColegio $tipoColegio)
    {
        if( count($tipoColegio->colegio) > 0 )
        {
            throw ValidationException::withMessages(['poseeColegio' => "Posee Colegio asignado"]);
        }
        
        $tipoColegio = $tipoColegio->delete();
 
        return [ 'msj' => 'TipoColegio Eliminado' , compact('tipoColegio')];
    }
}
