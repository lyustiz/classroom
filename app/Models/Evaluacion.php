<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Evaluacion extends Model
{
    protected $table 	  = 'evaluacion';

    protected $fillable   = [
                            'id_plan_detalle',
	 	 	 	 	 	 	'fe_evaluacion',
	 	 	 	 	 	 	'hh_inicio',
	 	 	 	 	 	 	'hh_fin',
	 	 	 	 	 	 	'nu_peso',
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

    public function planDetalle()
    {
        return $this->BelongsTo('App\Models\PlanDetalle', 'id_plan_detalle');
    }
}
