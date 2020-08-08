<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Agenda extends Model
{
    protected $table 	  = 'agenda';

    protected $fillable   = [
                            'nb_agenda',
	 	 	 	 	 	 	'id_calendario',
                            'id_tipo_agenda',
                            'id_tipo_actividad',
	 	 	 	 	 	 	'fe_agenda',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
	 	 	 	 	 	 	'id_origen',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    protected $appends = ['fe_inicio', 'fe_fin'];

    public function getFeInicioAttribute()
    {
        return Carbon::parse($this->fe_agenda)->format('Y-m-d') . ' ' . Carbon::parse($this->hh_inicio)->format('H:i');
    }

    public function getFeFinAttribute()
    {
        return Carbon::parse($this->fe_agenda)->format('Y-m-d') . ' ' . Carbon::parse($this->hh_fin)->format('H:i');
    }

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
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

    public function tipoAgenda()
    {
        return $this->BelongsTo('App\Models\TipoAgenda', 'id_tipo_agenda');
    }

    public function tipoActividad()
    {
        return $this->BelongsTo('App\Models\TipoActividad', 'id_tipo_actividad');
    }
}
