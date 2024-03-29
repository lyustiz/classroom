<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Archivo extends Model
{
    protected $table 	  = 'archivo';

    protected $fillable   = [
                            'nb_archivo',
	 	 	 	 	 	 	'id_tipo_archivo',
	 	 	 	 	 	 	'tx_origen_id',
                            'tx_path',
                            'tx_mimetype',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
   
    protected $appends = ['nb_real', 'fe_archivo', 'full_url'];

    public function getFullUrlAttribute()
    {
        return "{$this->tipoArchivo->tx_base_path}{$this->tx_origen_id}/{$this->tx_path}";
    }

    public function getFeArchivoAttribute()
    {
        return $this->created_at->format('d/m/Y h:i a');
    }

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_archivo');
    }
    
    public function getNbRealAttribute()
    {
        return substr($this->tx_path, strpos($this->tx_path, '_') + 1 );
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function tipoArchivo()
    {
        return $this->BelongsTo('App\Models\TipoArchivo', 'id_tipo_archivo');
    }
}
