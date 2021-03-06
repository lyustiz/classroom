<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AsignacionAlumno extends Model
{
    protected $table 	  = 'asignacion_alumno';

    protected $fillable   = [
                            'id_asignacion',
	 	 	 	 	 	 	'id_alumno',
	 	 	 	 	 	 	'fe_completado',
	 	 	 	 	 	 	'nu_calificacion',
	 	 	 	 	 	 	'id_calificacion',
	 	 	 	 	 	 	'fe_acceso',
	 	 	 	 	 	 	'nu_accesos',
	 	 	 	 	 	 	'nu_minutos',
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

    public function asignacion()
    {
        return $this->BelongsTo('App\Models\Asignacion', 'id_asignacion');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }
}
