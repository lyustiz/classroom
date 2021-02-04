<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Zona extends Model
{
    protected $table 	  = 'zona';

    protected $fillable   = [
                            'co_zona',
	 	 	 	 	 	 	'nb_zona',
	 	 	 	 	 	 	'id_ciudad',
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
        return $query->addSelect('id', 'nb_zona', 'id_ciudad');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

                           
    public function comuna(){

        return $this->HasMany('App\Models\Comuna', 'id_zona');

    }

    public function colegio(){

        return $this->HasMany('App\Models\Colegio', 'id_zona');

    }


}
