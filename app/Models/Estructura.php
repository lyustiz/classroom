<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Estructura extends Model
{
    protected $table 	  = 'estructura';

    protected $fillable   = [
                            'nb_estructura',
	 	 	 	 	 	 	'id_colegio',
                            'id_padre',
                            'tx_path',
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
        return $query->addSelect('id', 'nb_estructura');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                            
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function estructuraPadre()
    {
        return $this->BelongsTo(self::class, 'id_padre');
    }

    public function estructuraHijo()
    {
        return $this->hasMany(self::class, 'id_padre', 'id');
    }

    public function aula()
    {
        return $this->HasMany('App\Models\Aula', 'id_estructura');
    }
}
