<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsuarioPerfil extends Model
{
    protected $table 	  = 'usuario_perfil';

    protected $fillable   = [
                            'id_usuario',
	 	 	 	 	 	 	'id_perfil',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario_ed'
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
