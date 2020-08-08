<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Directiva extends Model
{
    protected $table 	  = 'directiva';

    protected $fillable   = [
                            'id_colegio',
                            'id_cargo',
                            'id_tipo_directiva',
                            'nb_directiva',
	 	 	 	 	 	 	'tx_documento',
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
        return $query->where('id_status', 1);
    }
    
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

	}
	
	public function cargo(){

        return $this->BelongsTo('App\Models\Cargo', 'id');

    }

    public function tipoDirectiva(){

        return $this->BelongsTo('App\Models\TipoDirectiva', 'id_tipo_directiva');

    }

                           
    //


}
