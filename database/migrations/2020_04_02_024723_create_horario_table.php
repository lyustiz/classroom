<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHorarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('horario', function (Blueprint $table) {
            $table->increments('id');
			$table->string('nb_horario', 100);
			$table->integer('id_comercio')->unsigned();
			$table->string('tx_entrada', 7)->nullable();
			$table->string('tx_salida', 7)->nullable();
			$table->string('tx_observaciones', 100)->nullable();
			$table->integer('id_status')->unsigned();
			$table->integer('id_usuario')->unsigned();
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
        Schema::dropIfExists('horario');
    }
}
