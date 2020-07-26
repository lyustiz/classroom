<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipoDestinatarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_destinatario', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_tipo_destinatario', 30);
            $table->string('tx_origen', 80);
            $table->string('tx_icono', 30);
            $table->string('tx_color', 30);
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
        Schema::dropIfExists('tipo_destinatario');
    }
}
