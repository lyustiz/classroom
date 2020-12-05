<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Asignacion extends Model
{
    protected $table 	  = 'asignacion';

    protected $fillable   = [
                            'id_grupo',
	 	 	 	 	 	 	'id_tipo_asignacion',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'id_tema',
	 	 	 	 	 	 	'id_origen',
	 	 	 	 	 	 	'tx_origen',
	 	 	 	 	 	 	'fe_inicio',
	 	 	 	 	 	 	'fe_fin',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
                            'id_usuario',
                            'created_at'
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

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function tipoAsignacion()
    {
        return $this->BelongsTo('App\Models\TipoAsignacion', 'id_tipo_asignacion');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }

    public function origen()
    {
        return $this->morphTo(null,'tx_origen','id_origen', 'id');
    }

    public function asignacionAlumno()
    {
        return $this->HasMany('App\Models\AsignacionAlumno', 'id_asignacion');
    }


}
