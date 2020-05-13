<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Grado extends Model
{
    protected $table 	  = 'grado';

    protected $fillable   = [
                            'nb_grado',
	 	 	 	 	 	 	'nu_grado',
	 	 	 	 	 	 	'id_nivel',
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

    public function nivel(){

        return $this->BelongsTo('App\Models\Nivel', 'id_nivel');

    }


}