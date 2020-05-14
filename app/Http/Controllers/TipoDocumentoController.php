<?php

namespace App\Http\Controllers;

use App\Models\TipoDocumento;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoDocumentoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoDocumento = TipoDocumento::with([])
                    ->get();
        
        return $tipoDocumento;
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
            'nb_tipo_documento' => 	'required|string|max:20',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_path'           => 	'nullable|string|max:80',
			'tx_grupo'          => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoDocumento = tipoDocumento::create($request->all());

        return [ 'msj' => 'Tipo Documento Agregado Correctamente', compact('tipoDocumento') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoDocumento  $tipoDocumento
     * @return \Illuminate\Http\Response
     */
    public function show(TipoDocumento $tipoDocumento)
    {
        return $tipoDocumento;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoDocumento  $tipoDocumento
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoDocumento $tipoDocumento)
    {
        $validate = request()->validate([
            'nb_tipo_documento' => 	'required|string|max:20',
			'tx_icono'          => 	'nullable|string|max:35',
			'tx_path'           => 	'nullable|string|max:80',
			'tx_grupo'          => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoDocumento = $tipoDocumento->update($request->all());

        return [ 'msj' => 'TipoDocumento Editado' , compact('tipoDocumento')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoDocumento  $tipoDocumento
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoDocumento $tipoDocumento)
    {
        $tipoDocumento = $tipoDocumento->delete();
 
        return [ 'msj' => 'TipoDocumento Eliminado' , compact('tipoDocumento')];
    }
}
