<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Incidencia extends Model
{
    protected $table 	  = 'incidencia';

    protected $fillable   = [
                            'id_alumno',
	 	 	 	 	 	 	'fe_incidencia',
	 	 	 	 	 	 	'id_tipo_falta',
	 	 	 	 	 	 	'tx_descripcion',
	 	 	 	 	 	 	'id_tipo_sancion',
	 	 	 	 	 	 	'tx_sancion',
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
        return $query->addSelect('id', 'id_alumno','fe_incidencia','id_tipo_falta','tx_descripcion','id_tipo_sancion','tx_sancion');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }

    public function tipoSancion()
    {
        return $this->BelongsTo('App\Models\TipoSancion', 'id_tipo_sancion');
    }

    public function tipoFalta()
    {
        return $this->BelongsTo('App\Models\TipoFalta', 'id_tipo_falta');
    }

}
