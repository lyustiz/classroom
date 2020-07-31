<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Permiso extends Model
{
    protected $table 	  = 'permiso';

    protected $fillable   = [
                            'id_menu',
	 	 	 	 	 	 	'id_perfil',
	 	 	 	 	 	 	'bo_select',
	 	 	 	 	 	 	'bo_insert',
	 	 	 	 	 	 	'bo_update',
	 	 	 	 	 	 	'bo_delete',
	 	 	 	 	 	 	'bo_admin',
	 	 	 	 	 	 	'bo_default',
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

	public function scopeComboData($query)
    {
        return $query->where('id_status', 1);
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }
}
