<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CertificadoAlumno extends Model
{
    protected $table 	  = 'certificado_alumno';

    protected $fillable   = [
                            'id_certificado',
	 	 	 	 	 	 	'id_alumno',
	 	 	 	 	 	 	'fe_aprobacion',
	 	 	 	 	 	 	'tx_codigo',
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

    public function certificado()
    {
        return $this->BelongsTo('App\Models\Certificado', 'id_certificado');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }
}
