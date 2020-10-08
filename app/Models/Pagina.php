<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pagina extends Model
{
    protected $table 	  = 'pagina';

    protected $fillable   = [
                            'nb_pagina',
                            'id_libro',
                            'id_tema',
	 	 	 	 	 	 	'nu_pagina',
	 	 	 	 	 	 	'tx_path',
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

    public function libro()
    {
        return $this->BelongsTo('App\Models\Libro', 'id_libro');
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_libro');
    }
}
