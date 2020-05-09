<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAlumnoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('alumno', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_nombre', 30)->nullable();
            $table->string('nb_apellido', 30)->nullable();
            $table->string('tx_documento', 30)->nullable();
            $table->string('tx_tarjeta_profesional', 30)->nullable();
            $table->string('tx_direccion', 30)->nullable();
            $table->string('tx_telefono', 20)->nullable();
            $table->string('tx_telefono2', 20)->nullable();
            $table->string('tx_telefono3', 20)->nullable();
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
        Schema::dropIfExists('alumno');
    }
}
