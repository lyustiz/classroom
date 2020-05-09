<?php

use Illuminate\Database\Seeder;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('usuario')->insert([
            'nb_nombres'       => 'Administrador',
            'nb_usuario'       => 'admin',
            'password'         => '123456',
            'tx_email'         => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
            'tx_foto'          => '',
            'id_tipo_usuario'  => 1, //administrador 
            'tx_observaciones' => null,
            'remember_token'   => null,
            'id_status'        => 1,
            'id_usuario'      => 1,
        ]);
        //// php artisan db:seed --class=UsuarioSeeder
    }
}
