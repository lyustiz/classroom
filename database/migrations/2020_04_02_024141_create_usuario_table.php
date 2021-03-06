<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuario', function (Blueprint $table) {
            $table->increments('id');
			$table->string('nb_nombres', 80)->nullable();
			$table->string('nb_usuario', 50)->unique(); 
			$table->string('password', 64);
            $table->string('tx_email', 80);
            $table->string('tx_foto', 100)->nullable();
            $table->integer('id_tipo_usuario')->unsigned();
            $table->integer('id_origen')->unsigned();
            $table->string('tx_observaciones', 100)->nullable();
            $table->string('verification', 64)->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
            $table->string('api_token', 64)->nullable();
			$table->integer('id_status')->unsigned();
			$table->integer('id_usuario')->unsigned()->nullable();
            $table->timestamps();
            
            $table->unique('id_tipo_usuario', 'id_origen');
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuario');
    }
}
