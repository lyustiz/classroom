<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Feriado extends Model
{
    protected $table 	  = 'feriado';

    protected $fillable   = [
                            'nb_feriado',
	 	 	 	 	 	 	'id_tipo_feriado',
	 	 	 	 	 	 	'fe_feriado',
	 	 	 	 	 	 	'aa_feriado',
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

    public function tipoFeriado()
    {
        return $this->BelongsTo('App\Models\TipoFeriado', 'id_tipo_feriado');
    }
}
