<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAlumnoParienteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('alumno_pariente', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_alumno');
            $table->integer('id_pariente');
            $table->boolean('bo_acudiente');
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
        Schema::dropIfExists('alumno_pariente');
    }
}
