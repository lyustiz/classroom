<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateColegioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('colegio', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_colegio', 100);
            $table->string('tx_codigo', 20);
            $table->integer('id_tipo_colegio');
            $table->integer('id_calendario');
            $table->integer('id_jornada');
            $table->integer('id_departamento');
            $table->integer('id_ciudad');
            $table->integer('id_zona');
            $table->integer('id_comuna');
            $table->integer('id_barrio');
            $table->string('tx_direccion', 80);
            $table->string('tx_telefono', 20);
            $table->integer('nu_estudiantes');
            $table->integer('tx_logo', 80);
            $table->string('nu_latitud', 20);
            $table->string('nu_longitud', 20);
            $table->string('tx_observaciones', 100)->nullable();
            $table->integer('id_status');
            $table->integer('id_usuario');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('colegio');
    }
}
