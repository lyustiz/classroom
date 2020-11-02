<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Clase extends Model
{
    protected $table 	  = 'clase';

    protected $fillable   = [
                            'id_grado',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'id_docente',
	 	 	 	 	 	 	'fe_clase',
	 	 	 	 	 	 	'fe_completada',
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

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function docente()
    {
        return $this->BelongsTo('App\Models\Docente', 'id_docente');
    }

    public function asistencia()
    {
        return $this->hasMany('App\Models\Asistencia', 'id_clase');
    }

    public function asistentes()
    {
        return $this->hasMany('App\Models\Asistencia', 'id_clase')->where('bo_asistencia', 1);
    }
}
