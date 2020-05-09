<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cargo extends Model
{
    protected $table 	  = 'cargo';

    protected $fillable   = [
                            'nb_cargo',
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

}
