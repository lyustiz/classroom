<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRespuestaAlumnoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('respuesta_alumno', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_prueba');
            $table->integer('id_pregunta');
            $table->integer('id_respuesta')->nullable();
            $table->integer('id_alumno');
            $table->string('tx_respuesta', 600)->nullable();
            $table->boolean('bo_correcta');
            $table->float('nu_valor', 8,2);
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
        Schema::dropIfExists('respuesta_alumno');
    }
}
