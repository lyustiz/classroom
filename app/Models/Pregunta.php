<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Pregunta extends Model
{
    protected $table 	  = 'pregunta';

    protected $fillable   = [
                            'nb_pregunta',
                            'id_prueba',
	 	 	 	 	 	 	'id_tipo_pregunta',
	 	 	 	 	 	 	'bo_opcional',
	 	 	 	 	 	 	'nu_valor',
	 	 	 	 	 	 	'nu_orden',
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
        static::addGlobalScope('orden', function (Builder $builder) {
            $builder->orderBy('nu_orden', 'asc');
        });
    }

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

    public function prueba()
    {
        return $this->BelongsTo('App\Models\Prueba', 'id_prueba');
    }

    public function tipoPregunta()
    {
        return $this->BelongsTo('App\Models\TipoPregunta', 'id_tipo_pregunta');
    }

    public function respuesta()
    {
        return $this->HasMany('App\Models\Respuesta', 'id_pregunta');
    }

    public function pruebaAlumno()
    {
        return $this->HasMany('App\Models\PruebaAlumno', 'id_pregunta');
    }

    public function respuestaAlumno()
    {
        return $this->HasMany('App\Models\RespuestaAlumno', 'id_pregunta');
    }




}
