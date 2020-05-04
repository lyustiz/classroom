<?php

namespace App\Http\Controllers\Traits;
use App\Models\Horario;
use Illuminate\Support\Facades\Validator;

trait HorarioTrait
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

            'nb_horario'        => 'required|max:80',
            'id_comercio'       => 'required',
            'tx_entrada'        => 'nullable',
            'tx_salida'         => 'nullable',
            'tx_observaciones'  => 'nullable',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ])->validate();

        $horario = Horario::create($data);

        return [ 'msj' => 'Horario Agregado Correctamente', 'horario' => $horario ];
    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    static public function storeAll(array $data)
    {
        $horarios = [];
        $horario  = [];

        foreach ($data['horarios'] as $nb_horario) {

            $horario = self::store([
                'nb_horario'        => $nb_horario,
                'id_comercio'       => $data['id_comercio'],
                'tx_entrada'        => null,
                'tx_salida'         => null,
                'tx_observaciones'  => null,
                'id_status'         => 1,
                'id_usuario'        => $data['id_usuario'],
            ]);

            $horarios[] = $horario['horario'];
        }

        return $horarios;
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Horario $horario)
    {
        $validate = request()->validate([

            'nb_horario'      => 'required|max:80',
            'tx_icono'          => 'required',
            'tx_foto'           => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $horario = $horario->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('Horario')];
    
    }

    static public function replaceAll(array $data)
    {
        $delHorarios = Horario::where('id_comercio', $data['id_comercio'])->delete();

        $horarios    = self::storeAll($data);

        return $horarios;
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Horario  $horario
     * @return \Illuminate\Http\Response
     */
    static public function destroy(Horario $horario)
    {
        $horario = $horario->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('horario')];

    }
}
