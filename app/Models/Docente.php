<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Docente extends Model
{
    protected $table 	  = 'docente';

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
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ];
	
	protected $appends = ['nb_docente', 'nb_corto'];

	public function getNbDocenteAttribute()
	{
		return trim(str_replace( '  ', ' ',  "{$this->nb_apellido} {$this->nb_apellido2} {$this->nb_nombre} {$this->nb_nombre2}")) ;
	}

	public function getNbCortoAttribute()
	{
		$nb_nombre2   = (substr($this->nb_nombre2, 0 , 1) == '') ? null : ucfirst(substr($this->nb_nombre2, 0 , 1)) . '.';

		$nb_apellido2 = (substr($this->nb_apellido2, 0 , 1) == '') ? null : ucfirst(substr($this->nb_apellido2, 0 , 1)) . '.';
		
		return trim(str_replace( '  ', ' ',  "{$this->nb_apellido} {$nb_apellido2} {$this->nb_nombre} {$nb_nombre2}")) ;
	}

	public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
    }

	public function status()
	{
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
	public function usuario()
	{
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
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

	public function planEvaluacion()
	{
        return $this->HasMany('App\Models\PlanEvaluacion', 'id_docente');
	}

	public function docenteMateria()
	{
        return $this->HasMany('App\Models\DocenteMateria', 'id_docente');
	}

	public function foto()
    {
        return $this->hasOne('App\Models\Foto',  'id_origen', 'id')->where('id_tipo_foto', 3);
    }
}
