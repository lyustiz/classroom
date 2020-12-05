<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Prueba extends Model
{
    protected $table 	  = 'prueba';

    protected $fillable   = [
                            'nb_prueba',
                            'id_grado',
                            'id_materia',
                            'id_tema',
	 	 	 	 	 	 	'bo_ver_resultado',
	 	 	 	 	 	 	'nu_minutos',
	 	 	 	 	 	 	'nu_peso',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];

    protected $appends = ['bo_culminado'];

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

    public function getBoCulminadoAttribute()
    {
        
        if($this->fe_prueba != null AND $this->hh_fin != null)
        {
            $fechaActual  = Carbon::now();
            $fechaCierre  = new Carbon($this->fe_prueba. ' ' . $this->hh_fin);
            
            return $fechaCierre->lessThan($fechaActual);
        } 
    
        return false;
    }

    public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_prueba', 'id_prueba', 'id_evaluacion');
    }
    
    public function scopePendiente($query)
    {
        return $query->where('id_status', $this->pendiente);
    }

    public function scopeAsignada($query)
    {
        return $query->where('id_status', $this->asignada);
    }

    public function scopeEjecutar($query)
    {
        return $query->whereIn('id_status', [$this->asignada,$this->ejecucion]);
    }

    public function scopeEjecucion($query)
    {
        return $query->where('id_status', $this->ejecucion);
    }

    public function scopeEvaluar($query)
    {
        return $query->whereIn('id_status', [$this->ejecucion, $this->evaluada]);
    }

    public function scopeEvaluada($query)
    {
        return $query->where('id_status', $this->evaluada);
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->whereIn( 'co_grupo', ['GRAL'] );
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }

    public function pregunta()
    {
        return $this->HasMany('App\Models\Pregunta', 'id_prueba');
    }

    public function evaluacion()
    {
        return $this->HasMany('App\Models\Evaluacion', 'id_origen')->where('tx_origen', 'prueba');
    }

    public function alumno()
	{
        return $this->hasManyThrough(
			
			'App\Models\Alumno', //final
            'App\Models\PruebaAlumno', //intermedia
            'id_prueba', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_alumno' // fk en intermedia
		);
	}
}
