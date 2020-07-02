<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PlanEvaluacion extends Model
{
    protected $table 	  = 'plan_evaluacion';

    protected $fillable   = [
                            'id_grupo',
                            'id_periodo',
                            'id_materia',
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

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function periodo()
    {
        return $this->BelongsTo('App\Models\Periodo', 'id_periodo');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function planDetalle()
    {
        return $this->hasMany('App\Models\PlanDetalle', 'id_plan_evaluacion');
    }
}
