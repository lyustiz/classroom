<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class AlumnoMateria extends Model
{
    protected $table 	  = 'alumno_materia';

    protected $fillable   = [
                            'id_calendario',
                            'id_alumno',
                            'id_grado',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    
    protected static function booted()
    {
        static::addGlobalScope('calendarioActivo', function (Builder $builder) {
            $builder->has('calendarioActivo');
        });
    }

    public function calendario()
    {
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario');
    }

    public function calendarioActivo()
    {
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario')->where('id_status', 1);
    }

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'id_alumno', 'id_materia');
    }
                        
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    } 

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }
}
