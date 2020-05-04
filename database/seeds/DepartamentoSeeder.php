<?php

use Illuminate\Database\Seeder;

class DepartamentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('departamento')->insert([
        'id'                => '76',
        'co_departamento'   => '76',
        'nb_departamento'   => 'Valle del Cauca',
        'id_pais'           => '58',
        'tx_latitud'        => '4.0376295',
        'tx_longitud'       => '-77.750484',
        'tx_observaciones'  => '',
        'id_status'         => '1',
        'id_usuario'        => '1',
        'created_at'        => '2020-04-10 02:40:08',
        'updated_at'        => null
        ]);

        //// php artisan db:seed --class=DepartamentoSeeder
    }
    
}

