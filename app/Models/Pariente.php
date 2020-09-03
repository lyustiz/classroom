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
							'id_tipo_documento',
	 	 	 	 	 	 	'tx_documento',
	 	 	 	 	 	 	'tx_sexo',
	 	 	 	 	 	 	'fe_nacimiento',
							'tx_nacionalidad',
							'tx_lugar_nacimiento',
							'id_parentesco',
							'id_estado_civil',
	 	 	 	 	 	 	'tx_empresa',
	 	 	 	 	 	 	'tx_cargo',
	 	 	 	 	 	 	'tx_ocupacion',
	 	 	 	 	 	 	'tx_telefono',
	 	 	 	 	 	 	'tx_telefono2',
							'tx_telefono3',
							'tx_email',
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
							'nb_corto', 
							'nu_edad'
							];
							
	public function getNbParienteAttribute()
	{
		return trim(str_replace( '  ', ' ',  "{$this->nb_apellido} {$this->nb_apellido2} {$this->nb_nombre} {$this->nb_nombre2}")) ;
	}

	public function getNbCortoAttribute()
	{
		$nb_nombre2   = (substr($this->nb_nombre2, 0 , 1) == '') ? null : ucfirst(substr($this->nb_nombre2, 0 , 1)) . '.';

		$nb_apellido2 = (substr($this->nb_apellido2, 0 , 1) == '') ? null : ucfirst(substr($this->nb_apellido2, 0 , 1)) . '.';
		
		return trim(str_replace( '  ', ' ',  "{$this->nb_apellido} {$nb_apellido2} {$this->nb_nombre} {$nb_nombre2}")) ;
	}

	public function getNuEdadAttribute()
	{
		return Carbon::parse($this->fe_nacimiento)->age;
	}

	public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeSearch($query, $search)
    {  
		return $query->where(\DB::raw('lower(nb_apellido)'),    'like', '%' . strtolower($search) . '%')
					 ->orWhere(\DB::raw('lower(nb_apellido2)'), 'like', '%' . strtolower($search) . '%')
					 ->orWhere(\DB::raw('lower(nb_nombre)'),    'like', '%' . strtolower($search) . '%')
					 ->orWhere(\DB::raw('lower(nb_nombre2)'),   'like', '%' . strtolower($search) . '%');
    }
	
	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_apellido', 'nb_apellido2', 'nb_nombre', 'nb_nombre2');
    }

	public function status()
	{
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
	public function usuario()
	{
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
	}
	
	public function parentesco()
	{
        return $this->BelongsTo('App\Models\Parentesco', 'id_parentesco');
	}

	public function alumnoPariente()
	{
        return $this->hasMany('App\Models\AlumnoPariente', 'id_pariente');
	}

	public function foto()
    {
        return $this->hasOne('App\Models\Foto',  'id_origen', 'id')->where('id_tipo_foto', 5);
	}

	public function alumno()
	{
        return $this->hasManyThrough(
			
			'App\Models\Alumno', //final
            'App\Models\AlumnoPariente', //intermedia
            'id_pariente', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_alumno' // fk en intermedia
		);
	}

}
