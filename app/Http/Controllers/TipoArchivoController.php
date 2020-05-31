<?php

namespace App\Http\Controllers;

use App\Models\TipoArchivo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TipoArchivoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipoArchivo = TipoArchivo::with([])
                    ->get();
        
        return $tipoArchivo;
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
            'nb_tipo_archivo'   => 	'required|string|max:20',
			'tx_origen'         => 	'required|string|max:20',
			'tx_storage'        => 	'required|string|max:50',
			'tx_base_path'      => 	'required|string|max:80',
			'tx_grupo'          => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoArchivo = tipoArchivo::create($request->all());

        return [ 'msj' => 'Tipo Archivo Agregado Correctamente', compact('tipoArchivo') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TipoArchivo  $tipoArchivo
     * @return \Illuminate\Http\Response
     */
    public function show(TipoArchivo $tipoArchivo)
    {
        return $tipoArchivo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TipoArchivo  $tipoArchivo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TipoArchivo $tipoArchivo)
    {
        $validate = request()->validate([
            'nb_tipo_archivo' => 	'required|string|max:20',
			'tx_origen'         => 	'required|string|max:20',
			'tx_storage'        => 	'required|string|max:50',
			'tx_base_path'      => 	'required|string|max:80',
			'tx_grupo'          => 	'nullable|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tipoArchivo = $tipoArchivo->update($request->all());

        return [ 'msj' => 'Tipo Archivo Actualizado' , compact('tipoArchivo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TipoArchivo  $tipoArchivo
     * @return \Illuminate\Http\Response
     */
    public function destroy(TipoArchivo $tipoArchivo)
    {
        $tipoArchivo = $tipoArchivo->delete();
 
        return [ 'msj' => 'Tipo Archivo Eliminado' , compact('tipoArchivo')];
    }
}
