<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlanDetalleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plan_detalle', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_plan_evaluacion');
            $table->integer('id_tipo_evaluacion');
            $table->integer('nu_peso')->nullable();;
            $table->date('fe_evaluacion')->nullable();;
            $table->string('tx_tema', 100)->nullable();
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
        Schema::dropIfExists('plan_detalle');
    }
}
