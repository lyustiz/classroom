<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AreaEstudio extends Model
{
    protected $table 	  = 'area_estudio';

    protected $fillable   = [
                            'nb_area_estudio',
                            'tx_color',
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
        return $query->addSelect('id', 'nb_area_estudio');
    }

    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

    public function materia(){

        return $this->HasMany('App\Models\materia', 'id_area_estudio');

    }
}
