<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Barrio extends Model
{
    protected $table 	  = 'barrio';

    protected $fillable   = [
                            'co_barrio',
	 	 	 	 	 	 	'nb_barrio',
	 	 	 	 	 	 	'id_comuna',
	 	 	 	 	 	 	'tx_latitud',
	 	 	 	 	 	 	'tx_longitud',
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
        return $query->addSelect('id', 'nb_barrio', 'id_comuna');
    }

    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }
         
    public function comuna(){

        return $this->HasMany('App\Models\Comuna', 'id_comuna');

    }



}
