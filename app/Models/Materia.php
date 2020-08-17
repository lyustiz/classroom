<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


class Materia extends Model
{
    protected $table 	  = 'materia';

    protected $fillable   = [
                            'nb_materia',
	 	 	 	 	 	 	'co_materia',
	 	 	 	 	 	 	'id_area_estudio',
	 	 	 	 	 	 	'tx_icono',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
    
    protected static function boot()
    {
        parent::boot();
        
        static::addGlobalScope('order', function (Builder $builder) {
            $builder->orderBy('nb_materia', 'asc');
        });
    }

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_materia', 'id_area_estudio');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function areaEstudio()
    {
        return $this->BelongsTo('App\Models\AreaEstudio', 'id_area_estudio');
    }

    public function grado()
    {
        return $this->belongsToMany('App\Models\Grado', 'grado_materia', 'id_materia', 'id_grado');
    }

    public function docente()
    {
        return $this->belongsToMany('App\Models\Docente', 'docente_materia', 'id_materia', 'id_docente');
    }

    public function planEvaluacion()
    {
        return $this->HasMany('App\Models\PlanEvaluacion', 'id_materia');
    }

    public function alumno()
	{
        return $this->hasOneThrough(
			
			'App\Models\Alumno', //final
            'App\Models\AlumnoMateria', //intermedia
            'id_materia', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_alumno' // fk en intermedia
		);
    }
    
    public function grupo()
	{
        return $this->hasOneThrough(
			
			'App\Models\Grupo', //final
            'App\Models\GrupoMateria', //intermedia
            'id_materia', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_grupo' // fk en intermedia
		);
    }

   /*  public function grado()
    {
        return $this->hasManyThrough('App\Models\Grado', 'App\Models\GradoMateria', 'id_materia', 'id_grado', 'id', 'id');
    }
  */

   /*   public function gradoMateria()
    {
        return $this->BelongsTo('App\Models\GradoMateria', 'id_');
    } */



}
