<?php

use Illuminate\Database\Seeder;

class CategoriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::table('categoria')->insert([
            ['nb_categoria' => 'Ropa', 'tx_icono' => "mdi-tshirt-crew", 'tx_foto' => "ropa.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Hogar', 'tx_icono' => "mdi-home-heart", 'tx_foto' => "hogar.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Restaurantes', 'tx_icono' => "mdi-silverware-variant", 'tx_foto' => "restaurantes.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Belleza', 'tx_icono' => "mdi-hair-dryer", 'tx_foto' => "belleza.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Mercado', 'tx_icono' => "mdi-cart", 'tx_foto' => "mercado.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Clasificados', 'tx_icono' => "mdi-toy-brick-search", 'tx_foto' => "clasificados.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Salud', 'tx_icono' => "mdi-needle", 'tx_foto' => "salud.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Ferreteria', 'tx_icono' => "mdi-hammer-screwdriver", 'tx_foto' => "ferreteria.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Mascotas', 'tx_icono' => "mdi-dog", 'tx_foto' => "mascotas.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Papeleria', 'tx_icono' => "mdi-bookshelf", 'tx_foto' => "papeleria.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Ventas Independientes', 'tx_icono' => "mdi-shopping", 'tx_foto' => "ventas.jpg", 'id_status' => 1, 'id_usuario' => 1],
            ['nb_categoria' => 'Tecnologia', 'tx_icono' => "mdi-monitor-cellphone", 'tx_foto' => "tecnologia.jpg", 'id_status' => 1, 'id_usuario' => 1],
        ]);

         //// php artisan db:seed --class=CategoriaSeeder
    }
}
