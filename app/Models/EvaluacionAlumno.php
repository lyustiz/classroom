<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EvaluacionAlumno extends Model
{
    protected $table 	  = 'evaluacion_alumno';

    protected $fillable   = [
                            'id_evaluacion',
	 	 	 	 	 	 	'id_alumno',
                            'nu_calificacion',
                            'id_calificacion',
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
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function evaluacion()
    {
        return $this->BelongsTo('App\Models\Evaluacion', 'id_evaluacion');
    }

    public function calificacion()
    {
        return $this->BelongsTo('App\Models\Calificacion',  'id_calificacion');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno')->comboData();
    }

    public function archivo()
    {
        return $this->hasOne('App\Models\Archivo',  'tx_origen_id', 'id')->where('id_tipo_archivo', 11);
    }
}
