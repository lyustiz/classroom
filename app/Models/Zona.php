<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Zona extends Model
{
    protected $table 	= 'zona';
    
    protected $fillable =   [
                            'co_zona',
                            'nb_zona',
                            'id_ciudad',
                            'tx_latitud',
                            'tx_longitud',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = [ 'created_at', 'updated_at'];

    public function ciudad(){

        return $this->BelongsTo('App\Models\Ciudad', 'id_ciudad');

    }
    
    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }

    public function comuna(){

        return $this->HasMany('App\Models\Comuna', 'id_comuna');

    }

}
