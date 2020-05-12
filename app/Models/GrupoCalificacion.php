<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GrupoCalificacion extends Model
{
    protected $table 	  = 'grupo_calificacion';

    protected $fillable   = [
                            'nb_grupo_calificacion',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];


}
