<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePruebaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prueba', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_prueba', 100);
            $table->integer('id_grado');
            $table->integer('id_grupo')->nullable();
            $table->integer('id_materia');
            $table->integer('id_docente');
            $table->integer('id_evaluacion_detalle')->nullable();
            $table->boolean('bo_ver_resultado');
            $table->integer('nu_minutos')->nullable();
            $table->date('fe_prueba')->nullable();
            $table->time('hh_inicio')->nullable();
            $table->time('hh_fin')->nullable();
            $table->decimal('nu_valor_total', 11, 2)->nullable();
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
        Schema::dropIfExists('prueba');
    }
}
