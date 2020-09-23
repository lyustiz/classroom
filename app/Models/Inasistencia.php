<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inasistencia extends Model
{
    protected $table 	  = 'inasistencia';

    protected $fillable   = [
                            'id_estudiante',
	 	 	 	 	 	 	'id_grado_materia',
	 	 	 	 	 	 	'id_grupo',
	 	 	 	 	 	 	'fe_inasistencia',
	 	 	 	 	 	 	'bo_justificado',
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
        return $query->addSelect('id', 'id_estudiante','id_grado_materia','id_grupo');
    }
  
    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

                           
    //


}
