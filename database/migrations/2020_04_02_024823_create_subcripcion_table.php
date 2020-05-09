<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubcripcionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subcripcion', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_colegio');
            $table->integer('aa_lectivo');
            $table->decimal('mo_cobro', 9, 2);
            $table->decimal('mo_pagado', 9, 2);
            $table->decimal('mo_saldo', 9, 2);
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
        Schema::dropIfExists('subcripcion');
    }
}
