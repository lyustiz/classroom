<?php

namespace App\Http\Controllers\Traits;
use App\Models\ComercioCategoria;
use Illuminate\Support\Facades\Validator;

trait ComercioCategoriaTrait
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    static public function store(array $data)
    {
        $validate = Validator::make($data,[
            
            'id_comercio'       => 'required',
            'id_categoria'      => 'required',
            'tx_observaciones'  => 'nullable|max:100',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ])->validate();

        $categoria = ComercioCategoria::create($data);

        return [ 'msj' => 'Registro Agregado Correctamente', 'categoria' => $categoria ];
    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    static public function storeAll(array $data)
    {
        $categorias = [];
        $categoria  = [];

        foreach ($data['categorias'] as $id_categoria) {

            $categoria = self::store([
                'id_comercio'       => $data['id_comercio'],
                'id_categoria'      => $id_categoria,
                'tx_observaciones'  => null,
                'id_status'         => 1,
                'id_usuario'        => $data['id_usuario'],
            ]);

            $categorias[] = $categoria['categoria'];

        }

        return $categorias;
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

    static public function replaceAll(array $data)
    {
        
        $delCategoria = ComercioCategoria::where('id_comercio', $data['id_comercio'])->delete();

        $categorias  = self::storeAll($data);

        return $categorias;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    static public function destroy(ComercioCategoria $categoria)
    {
        $categoria = $categoria->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('categoria')];

    }
}
