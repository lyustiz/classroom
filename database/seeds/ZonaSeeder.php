<?php

use Illuminate\Database\Seeder;

class ZonaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('zona')->truncate();
        
        DB::table('zona')->insert([
            ['co_zona' => '7600101', 'nb_zona' => 'Nor–Occidental', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1'],
            ['co_zona' => '7600102', 'nb_zona' => 'Nor–Oriente', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1'],
            ['co_zona' => '7600103', 'nb_zona' => 'Dtto. Agua Blanca', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1'],
            ['co_zona' => '7600104', 'nb_zona' => 'Oriente', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1'],
            ['co_zona' => '7600105', 'nb_zona' => 'Sur', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1'],
            ['co_zona' => '7600106', 'nb_zona' => 'Rural', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1'],
            ['co_zona' => '7600199', 'nb_zona' => 'Todo Cali', 'id_ciudad' => '76001', 'id_status' => '1', 'id_usuario' => '1']
        ]);
    }

    //// php artisan db:seed --class=ZonaSeeder
}
