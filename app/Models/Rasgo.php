<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rasgo extends Model
{
    protected $table 	  = 'rasgo';

    protected $fillable   = [
                            'nb_rasgo',
	 	 	 	 	 	 	'tx_icono',
	 	 	 	 	 	 	'tx_color',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];



    public function scopeActivo($query, $activo = true)
    {
        return  ($activo) ?   $query->where('id_status', 1) : $query ;
    }

    public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_rasgo', 'tx_icono', 'tx_color');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function evaluacion()
    {
        return $this->Hasmany('App\Models\Evaluacion', 'id_origen')->where('tx_origen', 'rasgo');
    }
}
