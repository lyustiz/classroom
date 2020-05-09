<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDirectivaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('directiva', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_colegio');
            $table->string('id_cargo');
            $table->string('nb_directiva', 80)->nullable();
            $table->integer('id_tipo_directiva');
            $table->string('tx_documento', 100)->nullable();
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
        Schema::dropIfExists('directiva');
    }
}
