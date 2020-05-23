<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    protected $table 	  = 'horario';

    protected $fillable   = [
                            'nb_horario',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'id_hora_academica',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];



    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function horaAcademica()
    {
        return $this->BelongsTo('App\Models\HoraAcademica', 'id_hora_academica');
    }

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function actividad()
    {
        return $this->HasMany('App\Models\Actividad', 'id_horario');
    }
}
