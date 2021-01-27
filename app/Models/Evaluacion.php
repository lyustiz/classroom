<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Evaluacion extends Model
{
    protected $table 	  = 'evaluacion';

    protected $fillable   = [
                            'id_plan_evaluacion',
                            'id_plan_detalle',
                            'id_tipo_evaluacion',
                            'tx_clase',
                            'id_origen',
                            'tx_origen',
                            'id_grupo',
                            'id_materia',
                            'id_tema',
                            'nu_peso',
                            'fe_inicio',
                            'fe_fin',
                            'hh_inicio',
                            'hh_fin',
                            'nu_minutos',
                            'tx_observaciones',
                            'id_status',
                            'id_usuario'       
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
    
    protected $asignada    = 3;

    protected $ejecucion   = 4;
                            
    protected $evaluada    = 6;

    public function ejecucion()
    {
        return $this->ejecucion;
    }

    public function asignada()
    {
        return $this->asignada;
    }

    public function evaluada()
    {
        return $this->evaluada;
    }

    public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('evaluacion.id', 'tx_tema', 'id_tipo_evaluacion', 'id_plan_evaluacion');
    }
    
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'EVALUACION');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function tipoEvaluacion()
    {
        return $this->BelongsTo('App\Models\TipoEvaluacion', 'id_tipo_evaluacion');
    }

    public function planEvaluacion()
    {
        return $this->BelongsTo('App\Models\PlanEvaluacion', 'id_plan_evaluacion');
    }

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }

    public function evaluacionAlumno()
    {
        return $this->hasMany('App\Models\EvaluacionAlumno',  'id_evaluacion');
    }

    public function archivo()
    {
        return $this->hasMany('App\Models\Archivo',  'tx_origen_id', 'id')->where('id_tipo_archivo', 2);
    }

    public function origen()
    {
        return $this->morphTo(null,'tx_origen','id_origen', 'id');
    }
}
