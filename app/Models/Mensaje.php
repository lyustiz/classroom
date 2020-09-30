<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mensaje extends Model
{
    protected $table 	  = 'mensaje';

    protected $fillable   = [
                            'co_mensaje',
	 	 	 	 	 	 	'id_tipo_destinatario',
	 	 	 	 	 	 	'id_destinatario',
	 	 	 	 	 	 	'tx_asunto',
	 	 	 	 	 	 	'tx_mensaje',
	 	 	 	 	 	 	'tx_lugar',
	 	 	 	 	 	 	'id_tipo_mensaje',
	 	 	 	 	 	 	'id_tipo_prioridad',
	 	 	 	 	 	 	'fe_mensaje',
	 	 	 	 	 	 	'hh_inicio',
                            'hh_fin',
                            'id_origen',
	 	 	 	 	 	 	'fe_lectura',
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
        return $query->addSelect('id', 'nb_mensaje');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function mensajeOrigen()
    {
        return $this->BelongsTo(self::class, 'id_origen');
    }

    public function tipoMensaje()
    {
        return $this->BelongsTo('App\Models\TipoMensaje', 'id_tipo_mensaje');
    }

    public function tipoDestinatario()
    {
        return $this->BelongsTo('App\Models\TipoDestinatario', 'id_tipo_destinatario');
    }

    public function tipoPrioridad()
    {
        return $this->BelongsTo('App\Models\TipoPrioridad', 'id_tipo_prioridad');
    }


}
