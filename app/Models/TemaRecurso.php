<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TemaRecurso extends Model
{
    protected $table 	  = 'tema_recurso';

    protected $fillable   = [
                            'id_tema',
	 	 	 	 	 	 	'id_recurso',
	 	 	 	 	 	 	'id_recurso_categoria',
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
}
