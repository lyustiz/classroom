<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tarea extends Model
{
    protected $table 	  = 'tarea';

    protected $fillable   = [
                            'nb_tarea',
	 	 	 	 	 	 	'tx_descripcion',
	 	 	 	 	 	 	'id_tipo_tarea',
	 	 	 	 	 	 	'id_grado',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'id_tema',
	 	 	 	 	 	 	'nu_peso',
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

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }

    public function evaluacion()
    {
        return $this->HasMany('App\Models\Evaluacion', 'id_origen')->where('tx_origen', 'tarea');
    }

    public function archivo()
    {
        return $this->hasMany('App\Models\Archivo',  'tx_origen_id', 'id')->whereIn('id_tipo_archivo', [11]);
    }
}
