<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EstadoCivil extends Model
{
    protected $table 	  = 'estado_civil';

    protected $fillable   = [
                            'nb_estado_civil',
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
        return $query->addSelect('id', 'nb_estado_civil');
    }
    
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');

    }
                            
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

    public function empleado()
    {
        return $this->hasMany('App\Models\Empleado', 'id_padre', 'id_estado_civil');
    }

    public function pariente()
    {
        return $this->hasMany('App\Models\Pariente', 'id_padre', 'id_estado_civil');
    }

    public function docente()
    {
        return $this->hasMany('App\Models\Docente', 'id_padre', 'id_estado_civil');
    }
}
