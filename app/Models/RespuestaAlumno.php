<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RespuestaAlumno extends Model
{
    protected $table 	  = 'respuesta_alumno';

    protected $fillable   = [
                            'id_prueba',
	 	 	 	 	 	 	'id_respuesta',
	 	 	 	 	 	 	'tx_respuesta',
	 	 	 	 	 	 	'bo_correcta',
	 	 	 	 	 	 	'nu_valor',
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

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }
}
