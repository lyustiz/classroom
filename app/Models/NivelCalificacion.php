<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NivelCalificacion extends Model
{
    protected $table 	  = 'nivel_calificacion';

    protected $fillable   = [
                            'nb_nivel_calificacion',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];


}
