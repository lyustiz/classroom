<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contacto extends Model
{
    protected $table 	  = 'contacto';

    protected $fillable   = [
                            'id_tipo_contacto',
	 	 	 	 	 	 	'id_origen',
	 	 	 	 	 	 	'tx_email',
	 	 	 	 	 	 	'tx_sitio_web',
	 	 	 	 	 	 	'tx_facebook',
	 	 	 	 	 	 	'tx_twitter',
	 	 	 	 	 	 	'tx_instagram',
	 	 	 	 	 	 	'tx_youtube',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ]; 
                           
    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
    
    
    }public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function tipoContacto()
    {
        return $this->BelongsTo('App\Models\TipoContacto', 'id_tipo_contacto');
    }

                           
    //


}
