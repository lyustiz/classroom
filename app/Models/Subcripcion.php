<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subcripcion extends Model
{
    protected $table 	= 'subcripcion';
    
    protected $fillable =   [
                            'tx_observaciones',
                            'bo_activo',
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
