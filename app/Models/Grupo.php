<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Grupo extends Model
{
    protected $table 	  = 'grupo';

    protected $fillable   = [
                            'nb_grupo',
	 	 	 	 	 	 	'id_grado',
                            'id_turno',
                            'id_calendario',
	 	 	 	 	 	 	'id_docente',
	 	 	 	 	 	 	'nu_orden',
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

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_grupo', 'id_grado');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function turno()
    {
        return $this->BelongsTo('App\Models\Turno', 'id_turno');
    }

    public function calendario()
    {
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario');
    }

    public function calendarioActivo()
    {
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario')->where('id_status', 1);
    }

    public function coordinador() 
    {
        return $this->BelongsTo('App\Models\Docente', 'id_docente');
    }

    public function docenteGrupo()
    {
        return $this->belongsToMany('App\Models\Docente', 'docente_grupo', 'id_grupo', 'id_docente');
    }

    public function planEvaluacion()
    {
        return $this->HasMany('App\Models\PlanEvaluacion', 'id_grupo');
    }

    public function horario()
    {
        return $this->HasMany('App\Models\Horario', 'id_grupo');
    }

    public function alumno()
	{
        return $this->hasManyThrough(
			
			'App\Models\Alumno', //final
            'App\Models\Matricula', //intermedia
            'id_grupo', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_alumno' // fk en intermedia
		);
    }
    
    public function materia()
	{
        return $this->hasManyThrough(
			
			'App\Models\Materia', //final
            'App\Models\GrupoMateria', //intermedia
            'id_grupo', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_materia' // fk en intermedia
		);
    }
    

    public function docente()
	{
        return $this->hasManyThrough(
			
			'App\Models\Docente', //final
            'App\Models\PlanEvaluacion', //intermedia
            'id_grupo', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_docente' // fk en intermedia
		);
	}
}
