<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Usuario;
use Faker\Generator as Faker;

$factory->define(Usuario::class, function (Faker $faker) {
    return [
		'nb_nombres' => $faker->name,
		'nb_apellidos' => $faker->name,
		'nb_usuario' => $faker->name,
		'password' => $faker->name,
		'tx_email' => $faker->name,
		'tx_nuip' => $faker->name,
		'tx_observaciones' => $faker->name,
		'token' => $faker->name,
		'id_status' => $faker->name,
		'id_usuarioe' => $faker->name,
		'timestamp' => $faker->name,

    ];
});
