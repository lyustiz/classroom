<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoCondicion extends Model
{
    protected $table 	  = 'tipo_condicion';

    protected $fillable   = [
                            'nb_tipo_condicion',
	 	 	 	 	 	 	'tx_icono',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];



    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }
}
