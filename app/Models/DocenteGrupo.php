<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DocenteGrupo extends Model
{
    protected $table 	  = 'docente_grupo';

    protected $fillable   = [
                            'id_docente',
	 	 	 	 	 	 	'id_grupo',
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
        return $query->where('id_status', 1);
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
}
