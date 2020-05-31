<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pariente extends Model
{
    protected $table 	  = 'pariente';

    protected $fillable   = [
                            'nb_apellido',
	 	 	 	 	 	 	'nb_apellido2',
	 	 	 	 	 	 	'nb_nombre',
	 	 	 	 	 	 	'nb_nombre2',
	 	 	 	 	 	 	'tx_documento',
	 	 	 	 	 	 	'tx_sexo',
	 	 	 	 	 	 	'fe_nacimiento',
	 	 	 	 	 	 	'tx_nacionalidad',
	 	 	 	 	 	 	'id_alumno',
	 	 	 	 	 	 	'id_parentesco',
	 	 	 	 	 	 	'tx_empresa',
	 	 	 	 	 	 	'tx_cargo',
	 	 	 	 	 	 	'tx_ocupacion',
	 	 	 	 	 	 	'tx_telefono',
	 	 	 	 	 	 	'tx_telefono2',
	 	 	 	 	 	 	'tx_telefono3',
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
}
