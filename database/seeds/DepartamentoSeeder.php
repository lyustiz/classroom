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
            ['id' => 5 , 'co_departamento' =>'05','nb_departamento' => 'ANTIOQUIA',                 'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 8 , 'co_departamento' =>'08','nb_departamento' => 'ATLÁNTICO',                 'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 11, 'co_departamento' => 11, 'nb_departamento' => 'BOGOTÁ, D.C.',              'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 13, 'co_departamento' => 13, 'nb_departamento' => 'BOLÍVAR',                   'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 15, 'co_departamento' => 15, 'nb_departamento' => 'BOYACÁ',                    'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 17, 'co_departamento' => 17, 'nb_departamento' => 'CALDAS',                    'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 18, 'co_departamento' => 18, 'nb_departamento' => 'CAQUETÁ',                   'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 19, 'co_departamento' => 19, 'nb_departamento' => 'CAUCA',                     'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 20, 'co_departamento' => 20, 'nb_departamento' => 'CESAR',                     'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 23, 'co_departamento' => 23, 'nb_departamento' => 'CÓRDOBA',                   'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 25, 'co_departamento' => 25, 'nb_departamento' => 'CUNDINAMARCA',              'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 27, 'co_departamento' => 27, 'nb_departamento' => 'CHOCÓ',                     'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 41, 'co_departamento' => 41, 'nb_departamento' => 'HUILA',                     'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 44, 'co_departamento' => 44, 'nb_departamento' => 'LA GUAJIRA',                'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 47, 'co_departamento' => 47, 'nb_departamento' => 'MAGDALENA',                 'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 50, 'co_departamento' => 50, 'nb_departamento' => 'META',                      'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 52, 'co_departamento' => 52, 'nb_departamento' => 'NARIÑO',                    'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 54, 'co_departamento' => 54, 'nb_departamento' => 'NORTE DE SANTANDER',        'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 63, 'co_departamento' => 63, 'nb_departamento' => 'QUINDÍO',                   'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 66, 'co_departamento' => 66, 'nb_departamento' => 'RISARALDA',                 'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 68, 'co_departamento' => 68, 'nb_departamento' => 'SANTANDER',                 'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 70, 'co_departamento' => 70, 'nb_departamento' => 'SUCRE',                     'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 73, 'co_departamento' => 73, 'nb_departamento' => 'TOLIMA',                    'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 76, 'co_departamento' => 76, 'nb_departamento' => 'VALLE DEL CAUCA',           'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 81, 'co_departamento' => 81, 'nb_departamento' => 'ARAUCA',                    'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 85, 'co_departamento' => 85, 'nb_departamento' => 'CASANARE',                  'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 86, 'co_departamento' => 86, 'nb_departamento' => 'PUTUMAYO',                  'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 88, 'co_departamento' => 88, 'nb_departamento' => 'ARCHIPIÉLAGO DE SAN ANDRÉ', 'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 91, 'co_departamento' => 91, 'nb_departamento' => 'AMAZONAS',                  'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 94, 'co_departamento' => 94, 'nb_departamento' => 'GUAINÍA',                   'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 95, 'co_departamento' => 95, 'nb_departamento' => 'GUAVIARE',                  'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 97, 'co_departamento' => 97, 'nb_departamento' => 'VAUPÉS',                    'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
            ['id' => 99, 'co_departamento' => 99, 'nb_departamento' => 'VICHADA',                   'id_pais' => 57, 'id_status' =>	1, 'id_usuario' => 1, 'created_at' => '2020-04-10' ],
        ]);

        //// php artisan db:seed --class=DepartamentoSeeder
    }
    
}

