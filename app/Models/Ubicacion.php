<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ubicacion extends Model
{
    protected $table 	  = 'ubicacion';

    protected $fillable   = [
                            'nb_ubicacion',
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


}
