<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Alumno extends Model
{
    protected $table 	  = 'alumno';

    protected $fillable   = [
                            'nb_apellido',
	 	 	 	 	 	 	'nb_apellido2',
	 	 	 	 	 	 	'nb_nombre',
	 	 	 	 	 	 	'nb_nombre2',
	 	 	 	 	 	 	'tx_sexo',
	 	 	 	 	 	 	'fe_nacimiento',
	 	 	 	 	 	 	'id_tipo_documento',
	 	 	 	 	 	 	'tx_documento',
	 	 	 	 	 	 	'tx_lugar_nacimiento',
	 	 	 	 	 	 	'tx_nacionalidad',
	 	 	 	 	 	 	'tx_direccion',
	 	 	 	 	 	 	'id_departamento',
	 	 	 	 	 	 	'id_ciudad',
	 	 	 	 	 	 	'tx_email',
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

	protected $appends = ['nb_alumno', 'nb_corto', 'nu_edad'];
							
	public function getNbAlumnoAttribute()
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
        return $this->BelongsTo('App\Models\Status', 'id_status');
    }
                           
	public function usuario()
	{
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
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

	public function grado()
	{
		return $this->hasOneThrough(
			
			'App\Models\Grado', //final
            'App\Models\Matricula', //intermedia
            'id_alumno', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_grado' // fk en intermedia
		);
	}
	
	public function grupo()
	{
        return $this->hasOneThrough(
			
			'App\Models\Grupo', //final
            'App\Models\Matricula', //intermedia
            'id_alumno', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_grupo' // fk en intermedia
		);
	}

	public function matricula()
	{
        return $this->hasOne('App\Models\Matricula', 'id_alumno');
	}

	public function foto()
    {
        return $this->hasOne('App\Models\Foto',  'id_origen', 'id')->where('id_tipo_foto', 2);
	}

	public function alumnoMateria()
    {
        return $this->hasMany('App\Models\AlumnoMateria', 'id_alumno');
	}

	public function materia()
	{
        return $this->hasManyThrough(
			
			'App\Models\Materia', //final
            'App\Models\AlumnoMateria', //intermedia
            'id_alumno', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_materia' // fk en intermedia
		);
	}

	public function pariente()
	{
        return $this->hasManyThrough(
			
			'App\Models\Pariente', //final
            'App\Models\AlumnoPariente', //intermedia
            'id_alumno', // fk en intermedia
            'id', // laocal en origen
            'id', // local en final
			'id_pariente' // fk en intermedia
		);
	}
}

