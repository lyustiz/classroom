<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comuna extends Model
{
    protected $table 	= 'comuna';
    
    protected $fillable =   [
                            'co_comuna',
                            'nb_comuna',
                            'id_zona',
                            'tx_latitud',
                            'tx_longitud',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = ['created_at','updated_at'];
    
    public function zona(){

        return $this->BelongsTo('App\Models\Zona', 'id_zona');

    }

    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }

    public function barrio(){

        return $this->HasMany('App\Models\Barrio', 'id_barrio');

    }

    public function comercio(){

        return $this->HasMany('App\Models\Comercio', 'id_comercio');

    }


}
