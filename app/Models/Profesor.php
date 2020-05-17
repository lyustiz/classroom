<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Profesor extends Model
{
    protected $table 	  = 'empleado';

    protected $fillable   = [
                            'nb_apellido',
	 	 	 	 	 	 	'nb_apellido2',
	 	 	 	 	 	 	'nb_nombre',
	 	 	 	 	 	 	'nb_nombre2',
	 	 	 	 	 	 	'id_estado_civil',
	 	 	 	 	 	 	'tx_sexo',
	 	 	 	 	 	 	'fe_nacimiento',
	 	 	 	 	 	 	'id_tipo_documento',
	 	 	 	 	 	 	'tx_documento',
	 	 	 	 	 	 	'tx_lugar_nacimiento',
	 	 	 	 	 	 	'tx_direccion',
	 	 	 	 	 	 	'id_departamento',
	 	 	 	 	 	 	'id_ciudad',
	 	 	 	 	 	 	'tx_email',
	 	 	 	 	 	 	'tx_telefono',
	 	 	 	 	 	 	'tx_telefono_movil',
	 	 	 	 	 	 	'id_cargo',
	 	 	 	 	 	 	'bo_profesor',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
							];
							
    protected $appends = ['nb_profesor'];
    
    protected static function booted()
    {
        static::addGlobalScope('bo_profesor', function (Builder $builder) {
            $builder->where('bo_profesor', '=', 1);
        });
    }

	public function getNbProfesorAttribute()
	{
		return str_replace( '  ', null,  "{$this->nb_apellido} {$this->nb_apellido2} {$this->nb_nombre} {$this->nb_nombre2}") ;
	}

	public function status()
	{
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                            
	public function usuario()
	{
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
	}
	
	public function cargo()
	{
        return $this->BelongsTo('App\Models\Cargo', 'id_cargo');
	}
	
	public function estadoCivil()
	{
        return $this->BelongsTo('App\Models\EstadoCivil', 'id_estado_civil');
	}
	
	public function tipoDocumento()
	{
        return $this->BelongsTo('App\Models\TipoDocumento', 'id_tipo_documento');
	}
	
	public function departamento()
	{
        return $this->BelongsTo('App\Models\Departamento', 'id_departamento');
	}
	
	public function ciudad()
	{
        return $this->BelongsTo('App\Models\Ciudad', 'id_ciudad');
    }


}
