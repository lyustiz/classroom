<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    protected $table 	  = 'status';

    protected $fillable   = [
                            'nb_status',
	 	 	 	 	 	 	'nb_secundario',
	 	 	 	 	 	 	'co_status',
	 	 	 	 	 	 	'co_grupo',
	 	 	 	 	 	 	'id_padre',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'bo_activo',
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
