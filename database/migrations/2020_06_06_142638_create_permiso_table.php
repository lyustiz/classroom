<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePermisoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('permiso', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_menu');
            $table->integer('id_perfil');
            $table->boolean('bo_select');
            $table->boolean('bo_insert');
            $table->boolean('bo_update');
            $table->boolean('bo_delete');
            $table->boolean('bo_admin');
            $table->boolean('bo_default');
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
        Schema::dropIfExists('permiso');
    }
}
