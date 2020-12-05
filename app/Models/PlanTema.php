<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PlanTema extends Model
{
    protected $table 	  = 'plan_tema';

    protected $fillable   = [
                            'id_plan_evaluacion',
                            'id_grupo',
	 	 	 	 	 	 	'id_tema',
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
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function planEvaluacion()
    {
        return $this->BelongsTo('App\Models\PlanEvaluacion', 'id_plan_evaluacion');
    }

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function tema()
    {
        return $this->BelongsTo('App\Models\Tema', 'id_tema');
    }
}
