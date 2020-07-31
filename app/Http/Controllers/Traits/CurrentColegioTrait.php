<?php

namespace App\Http\Controllers\Traits;
use App\Models\ComercioDespacho;

trait CurrentColegioTrait
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


}
