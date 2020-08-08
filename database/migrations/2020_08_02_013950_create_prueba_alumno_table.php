<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePruebaAlumnoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prueba_alumno', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_prueba');
            $table->integer('id_alumno');
            $table->date('fe_prueba')->nullable();
            $table->time('hh_inicio')->nullable();
            $table->time('hh_fin')->nullable();
            $table->integer('id_calificacion')->nullable();
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
        Schema::dropIfExists('prueba_alumno');
    }
}
