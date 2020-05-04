<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoUsuario extends Model
{
    protected $table 	= 'tipo_usuario';
    
    protected $fillable =   [
                            'nb_tipo_usuario',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            ];

    protected $hidden   = [ 'created_at', 'updated_at'];

    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->HasMany('App\Models\Usuario', 'id_usuario');
    
    }    

}
