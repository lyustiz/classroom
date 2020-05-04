<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipoPagoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_pago', function (Blueprint $table) {
            $table->increments('id');
			$table->string('nb_tipo_pago', 30);
			$table->integer('id_comercio');
			$table->string('tx_icono', 20)->nullable();
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
        Schema::dropIfExists('tipo_pago');
    }
}
