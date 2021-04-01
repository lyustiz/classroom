<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CertificadoPlantilla extends Model
{
    protected $table 	  = 'certificado_plantilla';

    protected $fillable   = [
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
}
