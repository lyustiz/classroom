<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmpleadoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('empleado', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_apellido', 30);
            $table->string('nb_apellido2', 30)->nullable();
            $table->string('nb_nombre', 30);
            $table->string('nb_nombre2', 30)->nullable();
            $table->integer('id_estado_civil');
            $table->string('tx_sexo', 1);
            $table->date('fe_nacimiento');
            $table->integer('id_tipo_documento');
            $table->string('tx_documento', 12);
            $table->string('tx_lugar_nacimiento', 30)->nullable();
            $table->string('tx_direccion', 80);
            $table->integer('id_departamento');
            $table->integer('id_ciudad');
            $table->string('tx_email', 30)->nullable();
            $table->string('tx_telefono', 15)->nullable();
            $table->string('tx_telefono_movil', 15)->nullable();
            $table->integer('id_cargo');
            $table->boolean('bo_profesor')->default(0);
            $table->string('tx_foto', 80)->nullable();
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
        Schema::dropIfExists('empleado');
    }
}
