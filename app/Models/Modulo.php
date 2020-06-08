<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Modulo extends Model
{
    protected $table 	  = 'modulo';

    protected $fillable   = [
                            'nb_modulo',
	 	 	 	 	 	 	'tx_grupo',
	 	 	 	 	 	 	'nu_orden',
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
