<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_menu', 40);
            $table->integer('id_modulo');
            $table->string('tx_ruta', 50);
            $table->string('tx_path', 50);
            $table->string('tx_icono', 50);
            $table->string('tx_color', 30);
            $table->string('tx_target', 50);
            $table->boolean('bo_visible');
            $table->integer('nu_orden');
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
        Schema::dropIfExists('menu');
    }
}
