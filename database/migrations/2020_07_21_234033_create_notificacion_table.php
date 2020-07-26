<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotificacionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notificacion', function (Blueprint $table) {
            $table->increments('id');
            $table->string('co_notificacion', 16);;
            $table->integer('id_tipo_destinatario');
            $table->integer('id_destinatario');
            $table->string('tx_asunto', 100);
            $table->string('tx_mensaje', 300);
            $table->string('tx_lugar', 80)->nullable();
            $table->integer('id_tipo_notificacion');
            $table->integer('id_tipo_prioridad');
            $table->date('fe_notificacion');
            $table->time('hh_inicio')->nullable();
            $table->time('hh_fin')->nullable();
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
        Schema::dropIfExists('notificacion');
    }
}
