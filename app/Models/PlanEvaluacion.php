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
                            'id_docente',
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

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function periodo()
    {
        return $this->BelongsTo('App\Models\Periodo', 'id_periodo');
    }

    public function periodoActivo()
    {
        return $this->BelongsTo('App\Models\Periodo', 'id_periodo')->where('id_status', 1);
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function docente()
    {
        return $this->BelongsTo('App\Models\Docente', 'id_docente');
    }

    public function evaluacion()
    {
        return $this->hasMany('App\Models\Evaluacion', 'id_plan_evaluacion');
    }

    


}
