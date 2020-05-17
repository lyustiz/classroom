<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EstadoCivil extends Model
{
    protected $table 	  = 'estado_civil';

    protected $fillable   = [
                            'nb_estado_civil',
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
