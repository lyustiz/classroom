<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Calificacion extends Model
{
    protected $table 	  = 'calificacion';

    protected $fillable   = [
                            'nb_calificacion',
							'nu_desde',
							'nu_hasta',
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
	

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->where('id_status', 1);
    }

	public function status(){

		return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');

	}
							
	public function usuario(){

		return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

	}

	public function grupoCalificacion(){

		return $this->BelongsTo('App\Models\GrupoCalificacion', 'id_grupo_calificacion');

	}

	public function tipoCalificacion(){

		return $this->BelongsTo('App\Models\TipoCalificacion', 'id_tipo_calificacion');

	}

	public function nivelCalificacion(){

		return $this->BelongsTo('App\Models\NivelCalificacion', 'id_nivel_calificacion');

	}


}
