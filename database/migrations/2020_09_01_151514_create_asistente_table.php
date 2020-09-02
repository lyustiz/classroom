<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAsistenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('asistente', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_asistente', 50);
            $table->integer('id_menu');
            $table->string('tx_descripcion', 300)->nullable();
            $table->string('tx_color', 30)->nullable();
            $table->integer('nu_orden');
            $table->string('tx_grupo', 30)->nullable();
            $table->string('tx_observaciones', 300)->nullable();
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
        Schema::dropIfExists('asistente');
    }
}
