<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlanEvaluacionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plan_evaluacion', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_grupo');
            $table->integer('id_periodo');
            $table->integer('id_materia');
            $table->integer('id_docente');
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
        Schema::dropIfExists('plan_evaluacion');
    }
}
