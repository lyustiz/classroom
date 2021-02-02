<?php

namespace App\Http\Controllers;

use App\Models\Enlace;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EnlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Enlace::with(['tipoEnlace:id,nb_tipo_enlace', 'tema:id,nb_tema'])
                    ->get();
    }

    public function enlaceTipoEnlaceTema($idTipoEnlace,$idTema)
    {
        return Enlace::with(['tipoEnlace:id,nb_tipo_enlace', 'tema:id,nb_tema'])
                    ->where('id_tipo_enlace', $idTipoEnlace)
                    ->where('id_tema', $idTema)
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
            'nb_enlace'         => 	'required|string|max:80',
            'id_tipo_enlace'    => 	'required|integer|max:999999999',
            'id_tema'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:100',
			'tx_url'            => 	'required|string|max:150',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $enlace = enlace::create($request->all());

        $tipo = ($request->id_tipo_enlace == 1) ? 'Enlace' : 'Video';

        return [ 'msj' => "$tipo Agregado Correctamente", compact('enlace') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Enlace  $enlace
     * @return \Illuminate\Http\Response
     */
    public function show(Enlace $enlace)
    {
        return $enlace;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Enlace  $enlace
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Enlace $enlace)
    {
        $validate = request()->validate([
            'nb_enlace'         => 	'required|string|max:80',
            'id_tipo_enlace'    => 	'required|integer|max:999999999',
            'id_tema'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:100',
			'tx_url'            => 	'required|string|max:150',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $enlace = $enlace->update($request->all());

        $tipo = ($request->id_tipo_enlace == 1) ? 'Enlace' : 'Video';

        return [ 'msj' => "$tipo Actualizado" , compact('enlace')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Enlace  $enlace
     * @return \Illuminate\Http\Response
     */
    public function destroy(Enlace $enlace)
    {
        $tipo = ($enlace->id_tipo_enlace == 1) ? 'Enlace' : 'Video';
        
        $enlace = $enlace->delete();
 
        return [ 'msj' => "$tipo Eliminado" , compact('enlace')];
    }
}
