<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    protected $table 	  = 'horario';

    protected $fillable   = [
                            'co_horario',
	 	 	 	 	 	 	'id_grado_materia',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'id_dia_semana',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
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

                           
    //


}
