<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParienteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pariente', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_apellido', 30);
            $table->string('nb_apellido2', 30)->nullable();
            $table->string('nb_nombre', 30);
            $table->string('nb_nombre2', 30)->nullable();
            $table->string('tx_documento', 30)->nullable();
            $table->string('tx_sexo', 1);
            $table->date('fe_nacimiento');
            $table->string('tx_nacionalidad', 30)->nullable();
            $table->integer('id_alumno');
            $table->integer('id_parentesco');
            $table->string('tx_empresa', 30)->nullable();
            $table->string('tx_cargo', 30)->nullable();
            $table->string('tx_ocupacion', 30)->nullable();
            $table->string('tx_telefono', 20)->nullable();
            $table->string('tx_telefono2', 20)->nullable();
            $table->string('tx_telefono3', 20)->nullable();
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
        Schema::dropIfExists('pariente');
    }
}
