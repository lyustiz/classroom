<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Profesor extends Model
{
    protected $table 	  = 'profesor';

    protected $fillable   = [
                            'nb_nombre',
	 	 	 	 	 	 	'nb_apellido',
	 	 	 	 	 	 	'tx_documento',
	 	 	 	 	 	 	'tx_tarjeta_prof',
	 	 	 	 	 	 	'tx_direccion',
	 	 	 	 	 	 	'tx_telefono',
	 	 	 	 	 	 	'tx_telefono2',
	 	 	 	 	 	 	'tx_foto',
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
