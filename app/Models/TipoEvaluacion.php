<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoEvaluacion extends Model
{
    protected $table 	  = 'tipo_evaluacion';

    protected $fillable   = [
                            'nb_tipo_evaluacion',
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

    public function scopeAsignable($query, $asignable = false)
    {
        return ($asignable) ? $query->where('id', '<>', 8) : $query;
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_tipo_evaluacion', 'tx_icono', 'tx_color');
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
