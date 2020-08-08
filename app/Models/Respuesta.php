<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Respuesta extends Model
{
    protected $table 	  = 'respuesta';

    protected $fillable   = [
                            'nb_respuesta',
	 	 	 	 	 	 	'id_pregunta',
	 	 	 	 	 	 	'bo_correcta',
	 	 	 	 	 	 	'nu_valor',
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
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function pregunta()
    {
        return $this->BelongsTo('App\Models\Pregunta', 'id_pregunta');
    }

    public function prueba()
    {
        return $this->hasOneThrough( 
			'App\Models\Prueba', //final
            'App\Models\Pregunta', //intermedia
            'id', // fk en intermedia
            'id_respuesta', // laocal en origen
            'id_prueba', // local en final
			'id_grado' // fk en intermedia
		);
    }

    
}
