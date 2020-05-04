<?php

use Illuminate\Database\Seeder;

class CiudadSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        DB::table('ciudad')->insert([
            'id'                => '76',
            'co_ciudad'         => '76001',
            'nb_ciudad'         => 'Cali',
            'id_departamento'   => '76',
            'tx_latitud'        => '3.3950619',
            'tx_longitud'       => '-76.5957047',
            'tx_observaciones'  => '',
            'id_status'         => '1',
            'id_usuario'        => '1',
            'created_at'        => '2020-04-10 02:40:58'
        ]);    
    }

    //// php artisan db:seed --class=CiudadSeeder
}
