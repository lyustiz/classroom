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

    protected $appends = ['nb_real'];
    
    public function getNbRealAttribute()
    {
        return substr($this->tx_src, strpos($this->tx_src, '_') + 1 );
    }
                           
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
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
