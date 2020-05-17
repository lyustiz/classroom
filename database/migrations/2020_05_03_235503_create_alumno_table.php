<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAlumnoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('alumno', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nb_apellido', 30);
            $table->string('nb_apellido2', 30)->nullable();
            $table->string('nb_nombre', 30);
            $table->string('nb_nombre2', 30)->nullable();
            $table->string('tx_sexo', 1);
            $table->date('fe_nacimiento');
            $table->integer('id_tipo_documento');
            $table->string('tx_documento', 12);
            $table->string('tx_nacionalidad', 40)->nullable();
            $table->string('tx_lugar_nacimiento', 40)->nullable();
            $table->string('tx_direccion', 80);
            $table->integer('id_departamento');
            $table->integer('id_ciudad');
            $table->string('tx_email', 30)->nullable();
            $table->string('tx_telefono', 15)->nullable();
            $table->string('tx_telefono2', 15)->nullable();
            $table->string('tx_telefono3', 15)->nullable();
            $table->string('tx_observaciones', 100)->nullable();
            $table->integer('id_status');
            $table->integer('id_usuario');
            $table->timestamps();     


           /*  `distancia_escuela` INTEGER default 0,
            `hermanos_escuela` TINYINT default 0,
            [FechaAlta]          timestamp    ,
            [FechaBaja]          timestamp    ,
            [CentroOrigen]       varchar(50)    ,
            [CentroTranslado]    varchar(50)    ,
            [Foto]               varbinary    ,
            [DatosMedicos]       varchar(16777216)    ,
            [DatosPsicologicos]  varchar(16777216)    ,
            [ObservacionesMedicas] varchar(16777216)    ,
            [ObservacionesGenerales] varchar(16777216)    ,           */           



        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('alumno');
    }
}
