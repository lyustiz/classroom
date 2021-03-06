<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AlumnoPariente extends Model
{
    protected $table 	  = 'alumno_pariente';

    protected $fillable   = [
                            'id_alumno',
	 	 	 	 	 	 	'id_pariente',
	 	 	 	 	 	 	'bo_acudiente',
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
        return $query->addSelect('id', 'id_alumno', 'id_pariente');
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
