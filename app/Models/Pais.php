<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pais extends Model
{
    
    protected $table 	= 'pais';
    
    protected $fillable =   [
                            'nb_pais',
                            'co_pais',
                            'tx_iso',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = [ 'created_at', 'updated_at'];

    public function status(){
    
        return $this->BelongsTo('App\Models\Status', 'id_status');
    
    }

    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }

    public function departamento(){

        return $this->HasMany('App\Models\Departamento', 'id_departamento');

    }

}
