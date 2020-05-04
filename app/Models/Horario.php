<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    protected $table 	= 'horario';
    
    protected $fillable =   [
                            'nb_horario',
                            'id_comercio',
                            'tx_entrada',
                            'tx_salida',
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
    
    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }
}
