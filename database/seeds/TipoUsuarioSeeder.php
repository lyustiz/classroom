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
                'id_usuario'         => '1',
            ],
            [
                'nb_tipo_usuario'    => 'Profesor',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '1',
            ],
            [
                'nb_tipo_usuario'    => 'Estudiante',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '1',
            ],
            [
                'nb_tipo_usuario'    => 'Representante',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '1',
            ],
            [
                'nb_tipo_usuario'    => 'Trabajador',
                'tx_observaciones'   => '',
                'id_status'          => '1',
                'id_usuario'         => '1',
            ],

        ]);

        //// php artisan db:seed --class=TipoUsuarioSeeder
    }
}
