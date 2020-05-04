<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Telefono extends Model
{
    protected $table 	= 'telefono';
    
    protected $fillable =   [
                            'tx_telefono',
                            'id_comercio',
                            'id_tipo_telefono',
                            'bo_whatsapp',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = [ 'created_at', 'updated_at'];

    public function comercio(){

        return $this->BelongsTo('App\Models\Comercio', 'id_comercio');

    }

    public function tipoTelefono(){

        return $this->BelongsTo('App\Models\TipoTelefono', 'id_tipo_telefono');

    }

    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }
}
