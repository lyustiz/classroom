<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Aula extends Model
{
    protected $table 	  = 'aula';

    protected $fillable   = [
                            'nb_aula',
	 	 	 	 	 	 	'id_estructura',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
    
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status');

    }
                            
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

    public function estructura(){

        return $this->BelongsTo('App\Models\Estructura', 'id_estructura');

    }


}
