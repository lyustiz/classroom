<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class PruebaAlumno extends Model
{
    protected $table 	  = 'prueba_alumno';

    protected $fillable   = [
                            'id_prueba',
                            'id_alumno',
	 	 	 	 	 	 	'fe_prueba',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
	 	 	 	 	 	 	'nu_calificacion',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    protected $appends = ['bo_finalizado'];

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
    }

    public function getBoFinalizadoAttribute()
    {
        
        if($this->fe_prueba != null AND $this->hh_fin != null)
        {
            $fechaActual  = Carbon::now();
            $fechaFinal   = new Carbon($this->fe_prueba. ' ' . $this->hh_fin);
            
            return $fechaFinal->lessThan($fechaActual);
        } 
    
        return false;
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'PRUEBA');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function prueba()
    {
        return $this->BelongsTo('App\Models\Prueba', 'id_prueba');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }

    public function pregunta()
    {
        return $this->hasMany('App\Models\Pregunta', 'id_prueba', 'id_prueba');
    }

    public function respuestaAlumno()
    {
        return $this->hasMany('App\Models\RespuestaAlumno', 'id_prueba', 'id_prueba');
    }


}
