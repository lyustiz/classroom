<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCargaHorariaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('carga_horaria', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_carga_horaria', 80);
            $table->integer('id_hora_academica');
            $table->integer('nu_orden');
            $table->time('hh_inicio');
            $table->time('hh_fin');
            $table->integer('id_turno');
            $table->boolean('bo_receso');
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
        Schema::dropIfExists('carga_horaria');
    }
}


