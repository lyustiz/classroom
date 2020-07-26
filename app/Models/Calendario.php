<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Calendario extends Model
{
    protected $table 	  = 'calendario';

    protected $fillable   = [
                            'nb_calendario',
                            'aa_escolar',
                            'fe_inicio',
                            'fe_fin',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ]; 
    
    
    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
    }
                            
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

                           
    //


}
