<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Foto extends Model
{
    protected $table 	  = 'foto';

    protected $fillable   = [
                            'nb_foto',
	 	 	 	 	 	 	'tx_src',
	 	 	 	 	 	 	'id_tipo_foto',
	 	 	 	 	 	 	'id_origen',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ]; 

    protected $appends = ['full_url'];
    
    public function getFullUrlAttribute()
    {
        return "{$this->tipoFoto->tx_base_path}{$this->id_origen}/{$this->tx_src}";
    }

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
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function tipoFoto()
    {
        return $this->BelongsTo('App\Models\TipoFoto', 'id_tipo_foto');
    }

}
