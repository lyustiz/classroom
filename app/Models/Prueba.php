<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Prueba extends Model
{
    protected $table 	  = 'prueba';

    protected $fillable   = [
                            'nb_prueba',
                            'id_grado',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'id_evaluacion_detalle',
	 	 	 	 	 	 	'bo_ver_resultado',
	 	 	 	 	 	 	'nu_minutos',
	 	 	 	 	 	 	'fe_prueba',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
	 	 	 	 	 	 	'nu_valor_total',
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

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function pregunta()
    {
        return $this->HasMany('App\Models\Pregunta', 'id_prueba');
    }
}
