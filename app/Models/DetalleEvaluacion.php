<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetalleEvaluacion extends Model
{
    protected $table 	  = 'detalle_evaluacion';

    protected $fillable   = [
                            'id_plan_evaluacion',
                            'id_tipo_evaluacion',
	 	 	 	 	 	 	'nu_peso',
	 	 	 	 	 	 	'fe_evaluacion',
	 	 	 	 	 	 	'tx_tema',
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

    public function tipoEvaluacion()
    {
        return $this->BelongsTo('App\Models\TipoEvaluacion', 'id_tipo_evaluacion');
    }

    public function planEvaluacion()
    {
        return $this->BelongsTo('App\Models\PlanEvaluacion', 'id_plan_evaluacion');
    }

    public function archivo()
    {
        return $this->hasMany('App\Models\Archivo',  'tx_origen_id', 'id')->where('id_tipo_archivo', 1);
    }
}
