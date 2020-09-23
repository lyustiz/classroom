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

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_horario');
    }
  
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
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

    public function detalleHorario()
    {
        return $this->HasMany('App\Models\DetalleHorario', 'id_horario');
    }

    public function cargaHoraria()
    {
        return $this->hasManyThrough(
			
			'App\Models\CargaHoraria', //final
            'App\Models\HoraAcademica', //intermedia
            'id', // fk en intermedia
            'id_hora_academica', // laocal en origen
            'id_hora_academica', // local en final
			'id' // fk en intermedia
		);
	}
}
