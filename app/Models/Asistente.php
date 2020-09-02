<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Asistente extends Model
{
    protected $table 	  = 'asistente';

    protected $fillable   = [
                            'nb_asistente',
	 	 	 	 	 	 	'id_menu',
	 	 	 	 	 	 	'tx_descripcion',
	 	 	 	 	 	 	'tx_color',
	 	 	 	 	 	 	'nu_orden',
	 	 	 	 	 	 	'tx_grupo',
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
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function menu()
    {
        return $this->BelongsTo('App\Models\Menu', 'id_menu');
    }
}
