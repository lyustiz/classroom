<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contacto extends Model
{
    protected $table 	= 'contacto';
    
    protected $fillable =   [
                            'id_comercio',
                            'tx_email',
                            'tx_sitio_web',
                            'tx_facebook',
                            'tx_twitter',
                            'tx_instagram',
                            'tx_youtube',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = ['created_at','updated_at'];

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
