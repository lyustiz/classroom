<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Calificacion extends Model
{
    protected $table 	  = 'calificacion';

    protected $fillable   = [
                            'nb_calificacion',
	 	 	 	 	 	 	'nu_calificacion',
	 	 	 	 	 	 	'co_calificacion',
	 	 	 	 	 	 	'bo_aprobado',
	 	 	 	 	 	 	'nu_orden',
	 	 	 	 	 	 	'id_grupo_calificacion',
							'id_tipo_calificacion',
							'id_nivel_calificacion',
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

	public function grupoCalificacion(){

		return $this->BelongsTo('App\Models\grupoCalificacion', 'id_grupo_calificacion');

	}

	public function tipoCalificacion(){

		return $this->BelongsTo('App\Models\tipoCalificacion', 'id_tipo_calificacion');

	}

	public function nivelCalificacion(){

		return $this->BelongsTo('App\Models\nivelCalificacion', 'id_nivel_calificacion');

	}


}
