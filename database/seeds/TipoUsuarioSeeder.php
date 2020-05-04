<?php

use Illuminate\Database\Seeder;

class TipoUsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_usuario')->insert([
            [
                'nb_tipo_usuario'    => 'Administrador',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '0',
            ],
            [
                'nb_tipo_usuario'    => 'Usuario',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '0',
            ],
            [
                'nb_tipo_usuario'    => 'Comercio',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '0',
            ],

        ]);

        //// php artisan db:seed --class=TipoUsuarioSeeder
    }
}
