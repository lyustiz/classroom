<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class Usuario extends Pivot
{
    protected $table 	  = 'usuario';
	protected $primaryKey = 'id';
	
	const 	  CREATED_AT  = 'fe_creado';
	const 	  UPDATED_AT  = 'fe_actualizado';

    protected $fillable   = [
                            'id',
	 	 	 	 	 	 	'nb_nombres',
	 	 	 	 	 	 	'nb_usuario',
	 	 	 	 	 	 	'password',
	 	 	 	 	 	 	'tx_email',
	 	 	 	 	 	 	'tx_foto',
	 	 	 	 	 	 	'id_tipo_usuario',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'verification',
	 	 	 	 	 	 	'email_verified_at',
	 	 	 	 	 	 	'remember_token',
	 	 	 	 	 	 	'api_token',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario',
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
    
    protected $hidden     = [
                            'fe_creado',
	 	 	 	 	 	 	'fe_actualizado'
                            ];


}
