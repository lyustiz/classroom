<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoCalificacion extends Model
{
    protected $table 	  = 'tipo_calificacion';

    protected $fillable   = [
                            'nb_tipo_calificacion',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];


}
