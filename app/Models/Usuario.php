<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Usuario extends Authenticatable implements MustVerifyEmail, JWTSubject
{
	use Notifiable;
	
	protected $table 	  = 'usuario';

    protected $fillable   = [
							'id',
							'id_colegio',
	 	 	 	 	 	 	'nb_nombres',
	 	 	 	 	 	 	'nb_usuario',
	 	 	 	 	 	 	'password',
	 	 	 	 	 	 	'tx_email',
	 	 	 	 	 	 	'tx_foto',
							'id_tipo_usuario',
							'id_origen',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'verification',
	 	 	 	 	 	 	'email_verified_at',
	 	 	 	 	 	 	'remember_token',
	 	 	 	 	 	 	'api_token',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario',
	 	 	 	 	 	 	'created_at',
	 	 	 	 	 	 	'updated_at'
							]; 
							
	protected $hidden   = [ 'password', 'verification', 'remember_token', 'id_usuario', 'api_token', 'created_at', 'updated_at'];
           
	protected $casts = [
        'email_verified_at' => 'datetime',
	];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
	}

	public function getIsAdminAttribute()
    {
        return $this->id_usuario == 1;
	}


	public function getIsDocenteAttribute()
    {
        return $this->id_usuario == 2;
	}

	public function getIsAlumnoAttribute()
    {
        return $this->id_usuario == 3;
	}

	public function getIsAcudienteAttribute()
    {
        return $this->id_usuario == 4;
	}

	public function getIsEmpleadoAttribute()
    {
        return $this->id_usuario == 5;
	}

	public function getIsSecretariaAttribute()
    {
        return $this->id_usuario == 6;
	}
	
	public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
	}

	public function scopeComboData($query)
    {
        return $query->addSelect('id', 'nb_usuario', 'nb_nombres', 'id_tipo_usuario', 'id_origen');
    }

	public function status()
	{
        return $this->belongsTo('App\Models\Status', 'id_status');
    }
                           
	public function usuario()
	{
        return $this->belongsTo('App\Models\Usuario', 'id_usuario');
	}

	public function colegio()
	{
        return $this->belongsTo('App\Models\Colegio', 'id_colegio');
	}

	public function usuarioPerfil()
	{
        return $this->hasMany('App\Models\UsuarioPerfil', 'id_usuario');
	}
	
	public function perfil()
	{
        return $this->belongsToMany('App\Models\Perfil', 'usuario_perfil', 'id_usuario', 'id_perfil');
	}
	
	public function foto()
    {
        return $this->hasOne('App\Models\Foto',  'id_origen', 'id')->where('id_tipo_foto', 4);
	}

	public function alumno()
    {
        return $this->belongsTo('App\Models\Alumno',  'id_origen');
	}

	public function docente()
    {
        return $this->belongsTo('App\Models\Docente',  'id_origen');
	}

	public function pariente()
    {
        return $this->belongsTo('App\Models\Pariente',  'id_origen');
	}

	public function empleado()
    {
        return $this->belongsTo('App\Models\Empleado',  'id_origen');
	}

	public function tipoUsuario()
    {
        return $this->belongsTo('App\Models\TipoUsuario',  'id_tipo_usuario');
	}

	public function notificacion()
    {
        return $this->HasMany('App\Models\Notificacion',  'id_usuario', 'id_destinatario');
	}



	
}