<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Libro extends Model
{
    protected $table 	  = 'libro';

    protected $fillable   = [
                            'nb_libro',
	 	 	 	 	 	 	'id_materia',
	 	 	 	 	 	 	'id_grado',
	 	 	 	 	 	 	'tx_descripcion',
	 	 	 	 	 	 	'tx_portada',
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

    public function grado()
    {
        return $this->BelongsTo('App\Models\Grado', 'id_grado');
    }

    public function materia()
    {
        return $this->BelongsTo('App\Models\Materia', 'id_materia');
    }

    public function pagina()
    {
        return $this->HasMany('App\Models\Pagina', 'id_libro');
    }

    public function tema()
	{
        return $this->hasManyThrough(
			'App\Models\Tema', //final
            'App\Models\Pagina', //intermedia
            'id_libro', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_tema' // fk en intermedia
		)->distinct();
	}
}
