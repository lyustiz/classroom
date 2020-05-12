<?php

use Illuminate\Database\Seeder;

class TipoCalificacionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_calificacion')->truncate();
        
        DB::table('tipo_calificacion')->insert([
            ['nb_tipo_calificacion' => 'Numerica (Real)',    'id_status' => '1', 'id_usuario' => '1'],
            ['nb_tipo_calificacion' => 'Numerica (Entero)',  'id_status' => '1', 'id_usuario' => '1'],
            ['nb_tipo_calificacion' => 'Porcentaje',         'id_status' => '1', 'id_usuario' => '1'],
            ['nb_tipo_calificacion' => 'Letra',              'id_status' => '1', 'id_usuario' => '1'],
        ]);
        //// php artisan db:seed --class=TipoCalificacionSeeder
    }
}
