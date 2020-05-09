<?php

namespace App\Http\Controllers;

use App\Models\Directiva;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DirectivaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $directiva = Directiva::with(['cargo:id,nb_cargo','tipoDirectiva:id,nb_tipo_directiva'])
                    ->get();
        
        return $directiva;
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
            'id_colegio'        => 	'required|integer',
            'id_cargo'          => 	'required|integer',
			'nb_directiva'      => 	'required|string|max:80',
			'id_tipo_directiva' => 	'required|integer',
			'tx_documento'      => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $directiva = directiva::create($request->all());

        return [ 'msj' => 'Directiva Agregado Correctamente', compact('directiva') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Directiva  $directiva
     * @return \Illuminate\Http\Response
     */
    public function show(Directiva $directiva)
    {
        return $directiva;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Directiva  $directiva
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Directiva $directiva)
    {
        $validate = request()->validate([
            'id_colegio'        => 	'required|integer',
            'id_cargo'          => 	'required|integer',
			'nb_directiva'      => 	'required|string|max:80',
			'id_tipo_directiva' => 	'required|integer',
			'tx_documento'      => 	'required|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $directiva = $directiva->update($request->all());

        return [ 'msj' => 'Directiva Editado' , compact('directiva')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Directiva  $directiva
     * @return \Illuminate\Http\Response
     */
    public function destroy(Directiva $directiva)
    {
        $directiva = $directiva->delete();
 
        return [ 'msj' => 'Directiva Eliminado' , compact('directiva')];
    }
}
