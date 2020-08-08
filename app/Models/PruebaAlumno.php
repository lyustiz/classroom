<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PruebaAlumno extends Model
{
    protected $table 	  = 'prueba_alumno';

    protected $fillable   = [
                            'id_prueba',
                            'id_alumno',
	 	 	 	 	 	 	'fe_prueba',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
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

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function prueba()
    {
        return $this->BelongsTo('App\Models\Prueba', 'id_prueba');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }
}
