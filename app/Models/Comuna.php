<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comuna extends Model
{
    protected $table 	  = 'comuna';

    protected $fillable   = [
                            'co_comuna',
	 	 	 	 	 	 	'nb_comuna',
	 	 	 	 	 	 	'id_zona',
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
        return $query->addSelect('id', 'nb_comuna', 'id_zona');
    }
    
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }
                      
    public function barrio(){

        return $this->HasMany('App\Models\Barrio', 'id_comuna');

    }

    public function colegio(){

        return $this->HasMany('App\Models\Colegio', 'id_comuna');

    }


}
