<?php

namespace App\Http\Controllers;

use App\Models\Telefono;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TelefonoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $telefono = Telefono::with([])
                    ->get();
        
        return $telefono;
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
            'tx_telefono'       => 	'required|string|max:20',
			'id_tipo_telefono'  => 	'required|integer',
			'id_entidad'        => 	'required|integer',
			'bo_whatsapp'       => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $telefono = telefono::create($request->all());

        return [ 'msj' => 'Telefono Agregado Correctamente', compact('telefono') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Telefono  $telefono
     * @return \Illuminate\Http\Response
     */
    public function show(Telefono $telefono)
    {
        return $telefono;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Telefono  $telefono
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Telefono $telefono)
    {
        $validate = request()->validate([
            'tx_telefono'       => 	'required|string|max:20',
			'id_tipo_telefono'  => 	'required|integer',
			'id_entidad'        => 	'required|integer',
			'bo_whatsapp'       => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $telefono = $telefono->update($request->all());

        return [ 'msj' => 'Telefono Editado' , compact('telefono')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Telefono  $telefono
     * @return \Illuminate\Http\Response
     */
    public function destroy(Telefono $telefono)
    {
        $telefono = $telefono->delete();
 
        return [ 'msj' => 'Telefono Eliminado' , compact('telefono')];
    }
}
