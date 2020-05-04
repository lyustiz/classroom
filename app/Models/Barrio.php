<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Barrio extends Model
{
    protected $table 	= 'barrio';
    
    protected $fillable = [
                            'co_barrio',
                            'nb_barrio',
                            'id_comuna',
                            'tx_latitud',
                            'tx_longitud',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                           ];
    
    protected $hidden   = ['created_at','updated_at'];
    
    public function scopeComuna($query, $comuna) {

        return $query->where('id_comuna', $comuna);

    }
    
    
    public function comuna() {

        return $this->BelongsTo('App\Models\Comuna', 'id_comuna');

    }

    public function status() {
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario() {
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }

    public function comercio() {

        return $this->HasMany('App\Models\Comercio', 'id_comercio');

    }

}
