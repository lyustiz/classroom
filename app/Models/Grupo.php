<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Grupo extends Model
{
    protected $table 	  = 'grupo';

    protected $fillable   = [
                            'nb_grupo',
	 	 	 	 	 	 	'id_grado',
                            'id_turno',
                            'id_calendario',
	 	 	 	 	 	 	'id_docente',
	 	 	 	 	 	 	'nu_orden',
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

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function turno()
    {
        return $this->BelongsTo('App\Models\Turno', 'id_turno');
    }

    public function calendario()
    {
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario');
    }

    public function docente()
    {
        return $this->BelongsTo('App\Models\Docente', 'id_docente');
    }
}
