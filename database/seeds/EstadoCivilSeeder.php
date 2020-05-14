<?php

use Illuminate\Database\Seeder;

class EstadoCivilSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('estado_civil')->truncate();
        
        DB::table('estado_civil')->insert([
            ['nb_estado_civil' => 'Soltero (a)',   'id_status' => '1', 'id_usuario' => '1'],
            ['nb_estado_civil' => 'Casado(a)',     'id_status' => '1', 'id_usuario' => '1'],
            ['nb_estado_civil' => 'Divorciado(a)', 'id_status' => '1', 'id_usuario' => '1'],
            ['nb_estado_civil' => 'Viudo(a)',      'id_status' => '1', 'id_usuario' => '1'],
        ]);
        //// php artisan db:seed --class=EstadoCivilSeeder
    }
}
