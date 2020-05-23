<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Actividad extends Model
{
    protected $table 	  = 'actividad';

    protected $fillable   = [
                            'nb_actividad',
	 	 	 	 	 	 	'id_horario',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'id_docente',
	 	 	 	 	 	 	'id_dia_semana',
	 	 	 	 	 	 	'id_aula',
	 	 	 	 	 	 	'hh_inicio',
                            'hh_fin',
                            'id_carga_horaria',
	 	 	 	 	 	 	'nu_carga_horaria',
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

    public function horario()
    {
        return $this->BelongsTo('App\Models\Horario', 'id_horario');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function docente()
    {
        return $this->BelongsTo('App\Models\Docente', 'id_docente');
    }

    public function aula()
    {
        return $this->BelongsTo('App\Models\Aula', 'id_aula');
    }

    public function cargaHoraria()
    {
        return $this->belongsTO('App\Models\CargaHoraria', 'id');
    }

}
