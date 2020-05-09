<?php

namespace App\Http\Controllers;

use App\Models\Parentesco;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ParentescoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $parentesco = Parentesco::with([])
                    ->get();
        
        return $parentesco;
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
            'nb_parentesco'     => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $parentesco = parentesco::create($request->all());

        return [ 'msj' => 'Parentesco Agregado Correctamente', compact('parentesco') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Parentesco  $parentesco
     * @return \Illuminate\Http\Response
     */
    public function show(Parentesco $parentesco)
    {
        return $parentesco;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Parentesco  $parentesco
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Parentesco $parentesco)
    {
        $validate = request()->validate([
            'nb_parentesco'     => 	'required|string|max:20',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $parentesco = $parentesco->update($request->all());

        return [ 'msj' => 'Parentesco Editado' , compact('parentesco')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Parentesco  $parentesco
     * @return \Illuminate\Http\Response
     */
    public function destroy(Parentesco $parentesco)
    {
        $parentesco = $parentesco->delete();
 
        return [ 'msj' => 'Parentesco Eliminado' , compact('parentesco')];
    }
}
