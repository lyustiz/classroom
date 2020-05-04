<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Departamento extends Model
{
    protected $table 	= 'departamento';
    
    protected $fillable =   [
                            'co_departamento',
                            'nb_departamento',
                            'id_pais',
                            'tx_latitud',
                            'tx_longitud',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = ['created_at','updated_at'];

    public function pais(){

        return $this->BelongsTo('App\Models\Pais', 'id_pais');

    }

    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }

    public function ciudad(){

        return $this->HasMany('App\Models\Ciudad', 'id_ciudad');

    }

    public function comercio(){

        return $this->HasMany('App\Models\Comercio', 'id_comercio');

    }


}
