<?php

namespace App\Http\Controllers\Traits;
use App\Models\ComercioDespacho;
use Illuminate\Support\Facades\Validator;

trait ComercioDespachoTrait
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

            'id_comercio'       => 'required|integer',
            'id_zona'           => 'required|integer',
            'tx_observaciones'  => 'nullable',
            'id_status'         => 'required|integer',
            'id_usuario'        => 'required|integer',

        ])->validate();

        $comercioDespacho = ComercioDespacho::create($data);

        return [ 'msj' => 'Horario Agregado Correctamente', 'comercioDespacho' => $comercioDespacho ];
    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    static public function storeAll(array $data)
    {
        $despachos = [];
        $despacho  = [];

        foreach ($data['zonas'] as $id_zona) {

            $despacho = self::store([
                'id_comercio'       => $data['id_comercio'],
                'id_zona'           => $id_zona,
                'tx_observaciones'  => null,
                'id_status'         => 1,
                'id_usuario'        => $data['id_usuario'],
            ]);

            $despachos[] = $despacho['comercioDespacho'];
        }

        return $despachos;
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ComercioDespacho $comercioDespacho)
    {
        $validate = request()->validate([

            'id_comercio'       => 'required|integer',
            'id_zona'           => 'required|integer',
            'tx_observaciones'  => 'nullable',
            'id_status'         => 'required|integer',
            'id_usuario'        => 'required|integer',

        ]);
        
        $comercioDespacho = $comercioDespacho->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('comercioDespacho')];
    
    }

    static public function replaceAll(array $data)
    {
        $delDespachos = ComercioDespacho::where('id_comercio', $data['id_comercio'])->delete();

        $despachos    = self::storeAll($data);

        return $despachos;
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    static public function destroy(ComercioDespacho $comercioDespacho)
    {
        $comercioDespacho = $comercioDespacho->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('comercioDespacho')];

    }
}
