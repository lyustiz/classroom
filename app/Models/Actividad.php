<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Actividad extends Model
{
    protected $table 	  = 'actividad';

    protected $fillable   = [
                            'nb_actividad',
	 	 	 	 	 	 	'id_tema',
	 	 	 	 	 	 	'tx_descripcion',
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

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }

    public function asignacion()
    {
        return $this->mortpMany('App\Models\Asignacion', 'tx_origen');
    }

    /*
      public function asignacion()
    {
        return $this->hasMany('App\Models\Asignacion', 'id_origen')->where('origen', 'actividad');
    } 
    */

}
