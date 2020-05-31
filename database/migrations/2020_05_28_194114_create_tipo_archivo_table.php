<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipoArchivoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_archivo', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_tipo_archivo', 20);
            $table->string('tx_origen', 20);
            $table->string('tx_storage', 35)->nullable();
            $table->string('tx_base_path', 80);
            $table->string('tx_grupo', 20)->nullable();
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
        Schema::dropIfExists('tipo_archivo');
    }
}
