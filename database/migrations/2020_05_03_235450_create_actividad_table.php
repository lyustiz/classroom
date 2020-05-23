<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActividadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('actividad', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_actividad', 100);
            $table->integer('id_horario');
            $table->integer('id_materia');
            $table->integer('id_docente');
            $table->integer('id_dia_semana');
            $table->integer('id_aula');
            $table->time('hh_inicio');
            $table->time('hh_fin');
            $table->integer('id_carga_horaria');
            $table->datetime('nu_carga_horaria');
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
        Schema::dropIfExists('actividad');
    }
}
