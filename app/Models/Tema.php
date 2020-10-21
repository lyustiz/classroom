<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tema extends Model
{
    protected $table 	  = 'tema';

    protected $fillable   = [
                            'nb_tema',
                            'nu_tema',
	 	 	 	 	 	 	'tx_descripcion',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'id_grado',
	 	 	 	 	 	 	'nu_nivel',
	 	 	 	 	 	 	'nu_peso',
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
        return $query->addSelect('id', 'nb_tema');
    }

    public function status()
    {
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function actividad()
    {
        return $this->BelongsTo('App\Models\Actividad', 'id_tema');
    }

}
