<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CargaHoraria extends Model
{
    protected $table 	  = 'carga_horaria';

    protected $fillable   = [
                            'nb_carga_horaria',
                            'id_hora_academica',
	 	 	 	 	 	 	'nu_orden',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
	 	 	 	 	 	 	'id_turno',
	 	 	 	 	 	 	'bo_receso',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    protected $casts      = [
                            'hh_inicio'  => 'datetime:H:i',
                            'hh_fin'     => 'datetime:H:i',
                            ];

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function turno()
    {
        return $this->BelongsTo('App\Models\Turno', 'id_turno');
    }

    public function horaAcademica()
    {
        return $this->BelongsTo('App\Models\HoraAcademica', 'id_hora_academica');
    }

    /* public function actividad(){

        return $this->belongsToMany('App\Models\Actividad', 'actividad_carga_horaria', 'id_carga_horaria', 'id_actividad');

    }
 

    public function actividad(){

        return $this->HasMany('App\Models\Actividad', 'id_carga_horaria' );

    }*/

    public function detalleHorario(){

        return $this->HasMany('App\Models\DetalleHorario', 'id_carga_horaria' );

    }
}
