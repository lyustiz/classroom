<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GrupoCalificacion extends Model
{
    protected $table 	  = 'grupo_calificacion';

    protected $fillable   = [
                            'nb_grupo_calificacion',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
    
    public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_grupo_calificacion');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function calificacion()
    {
        return $this->HasMany('App\Models\Calificacion', 'id_grupo_calificacion');
    }
}
