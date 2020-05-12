<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCalificacionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('calificacion', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_calificacion', 100)->nullable();
            $table->decimal('nu_calificacion', 8, 2)->nullable();
            $table->string('co_calificacion', 20) ->nullable();
            $table->integer('bo_aprobado');
            $table->integer('nu_orden');
            $table->integer('id_grupo_calificacion');
            $table->integer('id_tipo_calificacion');
            $table->integer('id_nivel_calificacion');
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
        Schema::dropIfExists('calificacion');
    }
}
