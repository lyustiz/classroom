<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetalleHorarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalle_horario', function (Blueprint $table) {
            $table->increments('id');
            $table->string('co_detalle_horario', 100);
            $table->integer('id_horario');
            $table->integer('id_materia');
            $table->integer('id_docente');
            $table->integer('id_dia_semana');
            $table->integer('id_aula');
            $table->time('hh_inicio');
            $table->time('hh_fin');
            $table->integer('id_carga_horaria');
            $table->integer('id_hora_academica');
            $table->integer('nu_carga_horaria');
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
        Schema::dropIfExists('detalle_horario');
    }
}
