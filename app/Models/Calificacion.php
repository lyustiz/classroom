<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Calificacion extends Model
{
    protected $table 	  = 'calificacion';

    protected $fillable   = [
                            'id_alumno',
	 	 	 	 	 	 	'id_grupo_materia',
	 	 	 	 	 	 	'nu_calificacion',
	 	 	 	 	 	 	'id_nivel_aprobacion',
	 	 	 	 	 	 	'nu_inasistencia',
	 	 	 	 	 	 	'tx_objetivo',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ]; 
                           
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

                           
    //


}
