<?php

namespace App\Http\Controllers;

use App\Models\CertificadoPlantilla;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CertificadoPlantillaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return CertificadoPlantilla::with([])
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
            'tx_linea1'         => 	'nullable|string|max:200',
			'tx_linea2'         => 	'nullable|string|max:200',
			'tx_linea3'         => 	'nullable|string|max:200',
			'tx_path'           => 	'nullable|string|max:80',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $certificadoPlantilla = certificadoPlantilla::create($request->all());

        return [ 'msj' => 'CertificadoPlantilla Agregado Correctamente', compact('certificadoPlantilla') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CertificadoPlantilla  $certificadoPlantilla
     * @return \Illuminate\Http\Response
     */
    public function show(CertificadoPlantilla $certificadoPlantilla)
    {
        return $certificadoPlantilla;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CertificadoPlantilla  $certificadoPlantilla
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CertificadoPlantilla $certificadoPlantilla)
    {
        $validate = request()->validate([
            'tx_linea1'         => 	'nullable|string|max:200',
			'tx_linea2'         => 	'nullable|string|max:200',
			'tx_linea3'         => 	'nullable|string|max:200',
			'tx_path'           => 	'nullable|string|max:80',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $certificadoPlantilla = $certificadoPlantilla->update($request->all());

        return [ 'msj' => 'CertificadoPlantilla Editado' , compact('certificadoPlantilla')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CertificadoPlantilla  $certificadoPlantilla
     * @return \Illuminate\Http\Response
     */
    public function destroy(CertificadoPlantilla $certificadoPlantilla)
    {
        $certificadoPlantilla = $certificadoPlantilla->delete();
 
        return [ 'msj' => 'CertificadoPlantilla Eliminado' , compact('certificadoPlantilla')];
    }
}
