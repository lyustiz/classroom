<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table 	  = 'menu';

    protected $fillable   = [
                            'nb_menu',
	 	 	 	 	 	 	'id_modulo',
	 	 	 	 	 	 	'tx_ruta',
	 	 	 	 	 	 	'tx_path',
	 	 	 	 	 	 	'tx_icono',
	 	 	 	 	 	 	'tx_color',
	 	 	 	 	 	 	'tx_target',
	 	 	 	 	 	 	'bo_visible',
	 	 	 	 	 	 	'nu_orden',
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

    public function scopeVisible($query)
    {
        return $query->where('bo_visible', 1);
    }

    public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_menu', 'tx_color', 'tx_icono');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function modulo()
    {
        return $this->BelongsTo('App\Models\Modulo', 'id_modulo');
    }

    public function perfil()
    {
        return $this->HasMany('App\Models\Perfil', 'id_menu');
    }
}
