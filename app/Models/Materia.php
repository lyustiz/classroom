<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Materia extends Model
{
    protected $table 	  = 'materia';

    protected $fillable   = [
                            'nb_materia',
	 	 	 	 	 	 	'co_materia',
	 	 	 	 	 	 	'id_area_estudio',
	 	 	 	 	 	 	'tx_icono',
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

    public function areaEstudio(){

        return $this->BelongsTo('App\Models\AreaEstudio', 'id_area_estudio');

    }
}
