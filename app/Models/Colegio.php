<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Colegio extends Model
{
    protected $table 	  = 'colegio';

    protected $fillable   = [
								'nb_colegio',
								'tx_codigo',
								'id_tipo_colegio',
								'id_calendario',
								'id_jornada',
								'id_departamento',
								'id_ciudad',
								'id_zona',
								'id_comuna',
								'id_barrio',
								'tx_direccion',
								'tx_telefono',
								'nu_estudiantes',
								'tx_logo',
								'nu_latitud',
								'nu_longitud',
								'tx_observaciones',
								'id_status',
								'id_usuario',
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
        return $query->addSelect('id', 'nb_colegio');
    }
	
	public function status()
	{
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
	public function usuario()
	{
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

	public function pais()
	{
        return $this->HasMany('App\Models\Pais', 'id_pais');
	}
	
	public function departamento()
	{
        return $this->HasMany('App\Models\Departamento', 'id_departamento');
	}
	
	public function ciudad()
	{
        return $this->HasMany('App\Models\Ciudad', 'id_ciudad');
	}
	
	public function zona()
	{
        return $this->HasMany('App\Models\Zona', 'id_zona');
	}
	
	public function comuna()
	{
        return $this->HasMany('App\Models\Comuna', 'id_comuna');
	}
	
	public function barrio()
	{
        return $this->HasMany('App\Models\Barrio', 'id_barrio');
	}
	
	public function tipoColegio()
	{
        return $this->HasMany('App\Models\TipoColegio', 'id');
	}
	
	public function jornada()
	{
        return $this->HasMany('App\Models\Jornada', 'id_jornada');
	}
	
	public function calendario()
	{
        return $this->BelongsTo('App\Models\Calendario', 'id_calendario');
	}
	
	public function foto()
    {
        return $this->hasOne('App\Models\Foto',  'id_origen', 'id')->where('id_tipo_foto', 1);
	}
}
