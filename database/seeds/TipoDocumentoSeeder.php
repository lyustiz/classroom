<?php

use Illuminate\Database\Seeder;

class TipoDocumentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_documento')->truncate();
        
        DB::table('tipo_documento')->insert([
            ['nb_tipo_documento' => 'Cedula',    'tx_grupo' => 'ID', 'id_status' => '1', 'id_usuario' => '1'],
            ['nb_tipo_documento' => 'Pasaporte', 'tx_grupo' => 'ID', 'id_status' => '1', 'id_usuario' => '1'],
        ]);
        //// php artisan db:seed --class=TipoDocumentoSeeder
    }

}
