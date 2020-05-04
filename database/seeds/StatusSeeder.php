<?php

use Illuminate\Database\Seeder;

class StatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('status')->insert([
            'nb_status'         => 'activo',
            'nb_secundario'     => 'enable',
            'co_status'         => 'ACT',
            'co_grupo'          => 'GRAL',
            'id_padre'          => null,
            'tx_observaciones'  => '',
            'bo_activo'         => 1,
            'id_usuario'        => 1,

        ]);

        DB::table('status')->insert([
            'nb_status'         => 'inactivo',
            'nb_secundario'     => 'disable',
            'co_status'         => 'INA',
            'co_grupo'          => 'GRAL',
            'id_padre'          => null,
            'tx_observaciones'  => '',
            'bo_activo'         => 1,
            'id_usuario'        => 1,

        ]);
    }
}
