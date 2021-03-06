<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Grado extends Model
{
    protected $table 	  = 'grado';

    protected $fillable   = [
                            'nb_grado',
	 	 	 	 	 	 	'nu_grado',
	 	 	 	 	 	 	'id_nivel',
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
        return $query->addSelect('id', 'nb_grado');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                            
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function nivel()
    {
        return $this->BelongsTo('App\Models\Nivel', 'id_nivel');
    }

    public function materia()
    {
        return $this->belongsToMany('App\Models\Materia', 'grado_materia', 'id_grado', 'id_materia');
    }

    public function grupo()
    {
        return $this->HasMany('App\Models\Grupo', 'id_grado');
    }

}
