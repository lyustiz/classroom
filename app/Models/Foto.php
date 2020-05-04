<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Foto extends Model
{
    protected $table 	= 'foto';

    protected $fillable =   [
                            'nb_foto',
                            'tx_src',
                            'id_tipo_foto',
                            'id_comercio',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = [ 'created_at', 'updated_at'];

    public function tipoFoto(){

        return $this->BelongsTo('App\Models\TipoFoto', 'id_tipo_foto');

    }
    
    public function comercio(){

        return $this->BelongsTo('App\Models\Comercio', 'id_comercio');

    }

    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }
}
