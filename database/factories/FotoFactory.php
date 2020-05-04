<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Foto;
use Faker\Generator as Faker;

$factory->define(Foto::class, function (Faker $faker) {

    static $number = 1;

    $categoria  = $faker->numberBetween($min = 1, $max = 8);

    switch ($categoria) {
        case 1:
            $foto = $faker->randomElement($array = array ('ropa1.jpg','ropa2.jpg','ropa3.jpg','ropa4.jpg', 'ropa5.jpg'));
            break;
        case 2:
            $foto =$faker->randomElement($array = array ('calzado1.jpg','calzado2.jpg','calzado3.jpg','calzado4.jpg', 'calzado5.jpg'));
            break;
        case 3:
            $foto = $faker->randomElement($array = array ('comida1.jpg','comida2.jpg','comida3.jpg','comida4.jpg', 'comida5.jpg'));
            break;
        case 4:
            $foto = $faker->randomElement($array = array ('belleza1.jpg','belleza2.jpg','belleza3.jpg','belleza4.jpg', 'belleza5.jpg'));
            break;
        case 5:
            $foto = $faker->randomElement($array = array ('mercado1.jpg','mercado2.jpg','mercado3.jpg','mercado4.jpg', 'mercado5.jpg'));
            break;
        case 6:
            $foto = $faker->randomElement($array = array ('mensajeria1.jpg','mensajeria2.jpg','mensajeria3.jpg','mensajeria4.jpg', 'mensajeria5.jpg'));
            break;
        case 7:
            $foto = $faker->randomElement($array = array ('drogueria1.jpg','drogueria2.jpg','drogueria3.jpg','drogueria4.jpg', 'drogueria5.jpg'));
            break;
        case 8:
            $foto = $faker->randomElement($array = array ('ferreteria1.jpg','ferreteria2.jpg','ferreteria3.jpg','ferreteria4.jpg', 'ferreteria5.jpg'));
            break;
        
        default:
            $foto = $faker->randomElement($array = array ('ropa1.jpg','ropa2.jpg','ropa3.jpg','ropa4.jpg', 'ropa5.jpg'));
            break;
    }

            return [
                'nb_foto'           => $faker->sentence($nbWords = 2, $variableNbWords = true),
                'tx_src'            => $foto,
                'id_tipo_foto'      => 1,
                'id_comercio'       => $number++,
                'id_status'         => 1,
                'id_usuario'        => 1,
            ];

    
});
