<?php

namespace App\Http\Controllers;

use App\Models\AreaEstudio;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AreaEstudioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $areaEstudio = AreaEstudio::with([])
                    ->get();
        
        return $areaEstudio;
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
            'nb_area_estudio'   => 	'required|string|max:50',
            'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $areaEstudio = areaEstudio::create($request->all());

        return [ 'msj' => 'AreaEstudio Agregado Correctamente', compact('areaEstudio') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AreaEstudio  $areaEstudio
     * @return \Illuminate\Http\Response
     */
    public function show(AreaEstudio $areaEstudio)
    {
        return $areaEstudio;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AreaEstudio  $areaEstudio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AreaEstudio $areaEstudio)
    {
        $validate = request()->validate([
            'nb_area_estudio'   => 	'required|string|max:50',
            'tx_color'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $areaEstudio = $areaEstudio->update($request->all());

        return [ 'msj' => 'AreaEstudio Editado' , compact('areaEstudio')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AreaEstudio  $areaEstudio
     * @return \Illuminate\Http\Response
     */
    public function destroy(AreaEstudio $areaEstudio)
    {
        $areaEstudio = $areaEstudio->delete();
 
        return [ 'msj' => 'AreaEstudio Eliminado' , compact('areaEstudio')];
    }
}
