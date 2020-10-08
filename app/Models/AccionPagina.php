<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccionPagina extends Model
{
    protected $table 	  = 'accion_pagina';

    protected $fillable   = [
                            'nb_accion_pagina',
	 	 	 	 	 	 	'id_pagina',
	 	 	 	 	 	 	'id_recurso',
	 	 	 	 	 	 	'id_tipo_accion',
	 	 	 	 	 	 	'tx_x_posicion',
	 	 	 	 	 	 	'tx_y_posicion',
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
        return $query->addSelect('id', 'nb_');
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
