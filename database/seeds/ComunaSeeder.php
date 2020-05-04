<?php

use Illuminate\Database\Seeder;

class ComunaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('comuna')->insert([
            ['co_comuna' =>	1,  'nb_comuna' => 'Comuna 1',  'id_zona' => 1, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.452904', 'tx_longitud' => '-76.565703'],
            ['co_comuna' =>	2,  'nb_comuna' => 'Comuna 2',  'id_zona' => 1, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.476199', 'tx_longitud' => '-76.528061'],
            ['co_comuna' =>	3,  'nb_comuna' => 'Comuna 3',  'id_zona' => 1, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.447175', 'tx_longitud' => '-76.536789'],
            ['co_comuna' =>	4,  'nb_comuna' => 'Comuna 4',  'id_zona' => 2, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.470139', 'tx_longitud' => '-76.510075'],
            ['co_comuna' =>	5,  'nb_comuna' => 'Comuna 5',  'id_zona' => 2, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.473208', 'tx_longitud' => '-76.494829'],
            ['co_comuna' =>	6,  'nb_comuna' => 'Comuna 6',  'id_zona' => 2, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.484017', 'tx_longitud' => '-76.485714'],
            ['co_comuna' =>	7,  'nb_comuna' => 'Comuna 7',  'id_zona' => 2, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.447147', 'tx_longitud' => '-76.486708'],
            ['co_comuna' =>	8,  'nb_comuna' => 'Comuna 8',  'id_zona' => 2, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.446542', 'tx_longitud' => '-76.506492'],
            ['co_comuna' =>	9,  'nb_comuna' => 'Comuna 9',  'id_zona' => 1, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.436488', 'tx_longitud' => '-76.522997'],
            ['co_comuna' =>	10, 'nb_comuna' => 'Comuna 10', 'id_zona' => 5, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.407796', 'tx_longitud' => '-76.528026'],
            ['co_comuna' =>	11, 'nb_comuna' => 'Comuna 11', 'id_zona' => 4, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.427384', 'tx_longitud' => '-76.515301'],
            ['co_comuna' =>	12, 'nb_comuna' => 'Comuna 12', 'id_zona' => 4, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.433679', 'tx_longitud' => '-76.50239'],
            ['co_comuna' =>	13, 'nb_comuna' => 'Comuna 13', 'id_zona' => 3, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.441777', 'tx_longitud' => '-76.485438'],
            ['co_comuna' =>	14, 'nb_comuna' => 'Comuna 14', 'id_zona' => 3, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.420235', 'tx_longitud' => '-76.47186'],
            ['co_comuna' =>	15, 'nb_comuna' => 'Comuna 15', 'id_zona' => 3, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.411713', 'tx_longitud' => '-76.496695'],
            ['co_comuna' =>	16, 'nb_comuna' => 'Comuna 16', 'id_zona' => 4, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.40474',  'tx_longitud' => '-76.516458'],
            ['co_comuna' =>	17, 'nb_comuna' => 'Comuna 17', 'id_zona' => 5, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.380512', 'tx_longitud' => '-76.521043'],
            ['co_comuna' =>	18, 'nb_comuna' => 'Comuna 18', 'id_zona' => 5, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.37676',  'tx_longitud' => '-76.542731'],
            ['co_comuna' =>	19, 'nb_comuna' => 'Comuna 19', 'id_zona' => 5, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.41745',  'tx_longitud' => '-76.55076'],
            ['co_comuna' =>	20, 'nb_comuna' => 'Comuna 20', 'id_zona' => 5, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.413092', 'tx_longitud' => '-76.557423'],
            ['co_comuna' =>	21, 'nb_comuna' => 'Comuna 21', 'id_zona' => 3, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.409215', 'tx_longitud' => '-76.468148'],
            ['co_comuna' =>	22, 'nb_comuna' => 'Comuna 22', 'id_zona' => 5, 'id_status' => 1, 'id_usuario' => 1, 'tx_latitud' => '3.359197', 'tx_longitud' => '-76.53823'],
        ]);

        //// php artisan db:seed --class=ComunaSeeder
    }
}


