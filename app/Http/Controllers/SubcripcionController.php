<?php

namespace App\Http\Controllers;

use App\Models\Subcripcion;
use Illuminate\Http\Request;

class SubcripcionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subcripcions = Subcripcion::with(['status'])
                                   ->get();
        
        return $subcripcions;

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

            'tx_observaciones' => 'required',
            'id_status' => 'required',
            'id_usuario' => 'required',
            
        ]);

        $subcripcion = Subcripcion::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('subcripcion') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Subcripcion  $subcripcion
     * @return \Illuminate\Http\Response
     */
    public function show(Subcripcion $subcripcion)
    {
        return $subcripcion;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Subcripcion  $subcripcion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Subcripcion $subcripcion)
    {
        $validate = request()->validate([
            
            'tx_observaciones' => 'required',
            'id_status' => 'required',
            'id_usuario' => 'required',

        ]);
        
        $subcripcion = $subcripcion->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('subcripcion')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Subcripcion  $subcripcion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subcripcion $subcripcion)
    {
        $subcripcion = $subcripcion->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('subcripcion')];

    }
}
