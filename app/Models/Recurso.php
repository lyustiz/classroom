<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Recurso extends Model
{
    protected $table 	  = 'recurso';

    protected $fillable   = [
                            'id_tipo_recurso',
	 	 	 	 	 	 	'id_grado',
	 	 	 	 	 	 	'id_tema',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
    
    protected static function booted()
    {
        static::addGlobalScope('archivo', function (Builder $builder) {
            $builder->with([    
                                'archivo',
                                'archivo.tipoArchivo:id,nb_tipo_archivo,tx_origen,tx_base_path'
                            ]);
        });
    }

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function tipoRecurso()
    {
        return $this->BelongsTo('App\Models\TipoRecurso', 'id_tipo_recurso');
    }

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function archivo()
    {
        return $this->hasOne('App\Models\Archivo',  'tx_origen_id', 'id')->whereIn('id_tipo_archivo', [8, 9, 10]);
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }
}
