<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;


class ActividadCargaHoraria extends Pivot
{
    protected $table 	  = 'actividad_carga_horaria';

    protected $fillable   = [
                            'id_actividad',
	 	 	 	 	 	 	'id_carga_horaria',
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
}
