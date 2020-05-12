<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Calificacion extends Model
{
    protected $table 	  = 'calificacion';

    protected $fillable   = [
                            'nb_calificacion',
	 	 	 	 	 	 	'nu_calificacion',
	 	 	 	 	 	 	'co_calificacion',
	 	 	 	 	 	 	'bo_aprobado',
	 	 	 	 	 	 	'nu_orden',
	 	 	 	 	 	 	'id_grupo_calificacion',
	 	 	 	 	 	 	'id_tipo_calificacion',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];


}
