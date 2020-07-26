<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HoraAcademica extends Model
{
    protected $table 	  = 'hora_academica';

    protected $fillable   = [
                            'nb_hora_academica',
                            'id_nivel',
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

    public function nivel()
    {
        return $this->BelongsTo('App\Models\Nivel', 'id_nivel');
    }

    public function horario()
    {
        return $this->hasMany('App\Models\Horario', 'id_hora_academica');
    }
}
