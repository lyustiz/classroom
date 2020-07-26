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
	
	public function scopeActivo($query)
    {
        return $query->where('id_status', 1);
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
	
	public function perfil()
	{
        return $this->belongsToMany('App\Models\Perfil', 'usuario_perfil', 'id_usuario', 'id_perfil');
	}
	
	public function foto()
    {
        return $this->hasOne('App\Models\Foto',  'id_origen', 'id')->where('id_tipo_foto', 4);
    }

}