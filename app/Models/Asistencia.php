<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Asistencia extends Model
{
    protected $table 	  = 'asistencia';

    protected $fillable   = [
                            'id_clase',
	 	 	 	 	 	 	'id_alumno',
	 	 	 	 	 	 	'fe_asistencia',
	 	 	 	 	 	 	'bo_asistencia',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
                            'id_usuario',
                            'created_at'
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

    public function alumno()
    {
        return $this->BelongsTo('App\Models\Alumno', 'id_alumno');
    }


}
