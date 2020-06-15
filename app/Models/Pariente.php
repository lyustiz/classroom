<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Pariente extends Model
{
    protected $table 	  = 'pariente';

    protected $fillable   = [
                            'nb_apellido',
	 	 	 	 	 	 	'nb_apellido2',
	 	 	 	 	 	 	'nb_nombre',
	 	 	 	 	 	 	'nb_nombre2',
	 	 	 	 	 	 	'tx_documento',
	 	 	 	 	 	 	'tx_sexo',
	 	 	 	 	 	 	'fe_nacimiento',
	 	 	 	 	 	 	'tx_nacionalidad',
	 	 	 	 	 	 	'id_alumno',
	 	 	 	 	 	 	'id_parentesco',
	 	 	 	 	 	 	'tx_empresa',
	 	 	 	 	 	 	'tx_cargo',
	 	 	 	 	 	 	'tx_ocupacion',
	 	 	 	 	 	 	'tx_telefono',
	 	 	 	 	 	 	'tx_telefono2',
	 	 	 	 	 	 	'tx_telefono3',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
							];

	protected $appends    = [
							'nb_pariente', 
							'nb_pariente_corto', 
							'nu_edad'
							];
							
	public function getNbParienteAttribute()
	{
		return trim(str_replace( '  ', ' ',  "{$this->nb_apellido} {$this->nb_apellido2} {$this->nb_nombre} {$this->nb_nombre2}")) ;
	}

	public function getNbParienteCortoAttribute()
	{
		$nb_nombre2   = (substr($this->nb_nombre2, 0 , 1) == '') ? null : ucfirst(substr($this->nb_nombre2, 0 , 1)) . '.';

		$nb_apellido2 = (substr($this->nb_apellido2, 0 , 1) == '') ? null : ucfirst(substr($this->nb_apellido2, 0 , 1)) . '.';
		
		return trim(str_replace( '  ', ' ',  "{$this->nb_apellido} {$nb_apellido2} {$this->nb_nombre} {$nb_nombre2}")) ;
	}

	public function getNuEdadAttribute()
	{
		return Carbon::parse($this->fe_nacimiento)->age;
	}

	public function status()
	{
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
	public function usuario()
	{
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
	}
	
	public function parentesco()
	{
        return $this->BelongsTo('App\Models\Parentesco', 'id_parentesco');
	}
	
	public function alumno()
	{
        return $this->HasMany('App\Models\Alumno', 'id', 'id_alumno');
    }
}
