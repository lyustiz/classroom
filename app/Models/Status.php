<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    protected $table 	  = 'status';

    protected $fillable   = [
                            'nb_status',
	 	 	 	 	 	 	'nb_secundario',
	 	 	 	 	 	 	'co_status',
                            'co_grupo',
                            'tx_icono',
                            'tx_color',
	 	 	 	 	 	 	'id_padre',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'bo_activo',
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

	public function scopeComboData($query)
    {
        return $query->addSelect('status.id', 'nb_status');
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
