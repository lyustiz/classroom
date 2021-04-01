<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Certificado extends Model
{
    protected $table 	  = 'certificado';

    protected $fillable   = [
                            'id_plan_evaluacion',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'tx_linea1',
	 	 	 	 	 	 	'tx_linea2',
	 	 	 	 	 	 	'tx_linea3',
	 	 	 	 	 	 	'tx_path',
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

    public function grupo()
    {
        return $this->BelongsTo('App\Models\Grupo', 'id_grupo');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function planEvaluacion()
    {
        return $this->BelongsTo('App\Models\PlanEvaluacion', 'id_materia');
    }

    public function certificadoAlumno()
    {
        return $this->HasMany('App\Models\CertificadoAlumno', 'id_certificado');
    }

}
