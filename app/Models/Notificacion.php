<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notificacion extends Model
{
    protected $table 	  = 'notificacion';

    protected $fillable   = [
	 	 	 	 	 	 	'id_tipo_destinatario',
	 	 	 	 	 	 	'id_destinatario',
	 	 	 	 	 	 	'tx_mensaje',
	 	 	 	 	 	 	'id_tipo_notificacion',
                            'fe_notificacion',
                            'fe_lectura',
	 	 	 	 	 	 	'id_status',
                            'id_usuario',
                            'created_at'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
    }
    
    public function scopeRead($query)
    {
        return $query->whereNotNull('fe_lectura');
    }
    
    public function scopeUnread($query)
    {
        return $query->whereNull('fe_lectura');
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function destinatario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_destinatario');
    }

    public function tipoNotificacion()
    {
        return $this->BelongsTo('App\Models\TipoNotificacion', 'id_tipo_notificacion');
    }

    public function tipoDestinatario()
    {
        return $this->BelongsTo('App\Models\TipoDestinatario', 'id_tipo_destinatario');
    }

}
