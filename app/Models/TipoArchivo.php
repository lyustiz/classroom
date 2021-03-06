<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoArchivo extends Model
{
    protected $table 	  = 'tipo_archivo';

    protected $fillable   = [
                            'nb_tipo_archivo',
	 	 	 	 	 	 	'tx_origen',
	 	 	 	 	 	 	'tx_storage',
	 	 	 	 	 	 	'tx_base_path',
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

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_tipo_archivo');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function archivo()
    {
        return $this->HasMany('App\Models\Archivo', 'id_tipo_archivo');
    }

}
