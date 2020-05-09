<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GradoMateria extends Model
{
    protected $table 	  = 'grado_materia';

    protected $fillable   = [
                            'id_materia',
	 	 	 	 	 	 	'nb_director',
	 	 	 	 	 	 	'tx_libro',
	 	 	 	 	 	 	'id_profesor',
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
