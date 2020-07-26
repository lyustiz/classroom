<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Matricula extends Model
{
    protected $table 	  = 'matricula';

    protected $fillable   = [
                            'id_calendario',
                            'id_alumno',
	 	 	 	 	 	 	'id_grado',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'fe_matricula',
	 	 	 	 	 	 	'id_tipo_condicion',
	 	 	 	 	 	 	'id_colegio_origen',
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
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function calendario()
    {
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function tipoCondicion()
    {
        return $this->BelongsTo('App\Models\TipoCondicion', 'id_tipo_condicion');
    }

    public function colegio()
    {
        return $this->BelongsTo('App\Models\Colegio', 'id_colegio');
    }
}
