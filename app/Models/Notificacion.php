<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notificacion extends Model
{
    protected $table 	  = 'notificacion';

    protected $fillable   = [
                            'co_notificacion',
	 	 	 	 	 	 	'id_tipo_destinatario',
	 	 	 	 	 	 	'id_destinatario',
	 	 	 	 	 	 	'tx_asunto',
	 	 	 	 	 	 	'tx_mensaje',
	 	 	 	 	 	 	'tx_lugar',
	 	 	 	 	 	 	'id_tipo_notificacion',
	 	 	 	 	 	 	'id_tipo_prioridad',
	 	 	 	 	 	 	'fe_notificacion',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
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
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }
}
