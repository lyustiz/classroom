<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Estructura extends Model
{
    protected $table 	  = 'estructura';

    protected $fillable   = [
                            'nb_estructura',
	 	 	 	 	 	 	'id_colegio',
	 	 	 	 	 	 	'id_padre',
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

    public function estructuraPadre(){

        return $this->BelongsTo(self::class, 'id_padre');

    }


}
