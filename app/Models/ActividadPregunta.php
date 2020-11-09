<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActividadPregunta extends Model
{
    protected $table 	  = 'actividad_pregunta';

    protected $fillable   = [
                            'nb_pregunta',
	 	 	 	 	 	 	'nb_descripcion',
	 	 	 	 	 	 	'id_actividad',
	 	 	 	 	 	 	'id_tipo_pregunta',
	 	 	 	 	 	 	'bo_opcional',
	 	 	 	 	 	 	'nu_valor',
	 	 	 	 	 	 	'nu_orden',
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
        return $query->addSelect('id', 'nb_');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function actividad()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_actividad');
    }

    public function tipoPregunta()
    {
        return $this->BelongsTo('App\Models\TipoPregunta', 'id_tipo_pregunta');
    }

    public function actividadRespuesta()
    {
        return $this->hasMany('App\Models\ActividadRespuesta', 'id_actividad_pregunta');
    }

    
}
