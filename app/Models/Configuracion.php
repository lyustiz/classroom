<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Configuracion extends Model
{
    protected $table 	  = 'configuracion';

    protected $fillable   = [
                            'nb_configuracion',
	 	 	 	 	 	 	'tx_valor',
	 	 	 	 	 	 	'tx_modulo',
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