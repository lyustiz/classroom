<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categorias = Categoria::select(['id', 'nb_categoria', 'tx_icono', 'tx_foto', 'id_status'])  
                                ->where('id_status', 1)    
                                ->get();
        
        return $categorias;

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
            
            'nb_categoria'      => 'required',
            'tx_icono'          => 'required',
            'tx_foto'           => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);

        $categoria = Categoria::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('categoria') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function show(Categoria $categoria)
    {
        return $categoria;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Categoria $categoria)
    {
        $validate = request()->validate([

            'nb_categoria'      => 'required',
            'tx_icono'          => 'required',
            'tx_foto'           => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $categoria = $categoria->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('categoria')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function destroy(Categoria $categoria)
    {
        $categoria = $categoria->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('categoria')];

    }
}
