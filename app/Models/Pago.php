<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pago extends Model
{
    protected $table 	  = 'pago';

    protected $fillable   = [
                            'id_subcripcion',
	 	 	 	 	 	 	'mo_pago',
	 	 	 	 	 	 	'id_tipo_pago',
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
	}
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

                           
    //


}
