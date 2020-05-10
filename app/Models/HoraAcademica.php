<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HoraAcademica extends Model
{
    protected $table 	  = 'hora_academica';

    protected $fillable   = [
                            'nu_orden',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
	 	 	 	 	 	 	'id_turno',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    protected $casts = [
        'hh_inicio'  => 'datetime:H:i',
        'hh_fin' => 'datetime:H:i',
    ];
        
        
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status');

    }
                            
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

    public function turno(){

        return $this->BelongsTo('App\Models\Turno', 'id_turno');

    }
}
