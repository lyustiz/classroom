<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoColegio extends Model
{
    protected $table 	  = 'tipo_colegio';

    protected $fillable   = [
                            'nb_tipo_colegio',
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
        return $this->BelongsTo('App\Models\Status', 'id_status')->where('co_grupo', 'GRAL');
    }
                           
    public function usuario()
    {
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    }

    public function colegio()
    {
        return $this->hasMany('App\Models\Colegio', 'id_tipo_colegio');
    }

                           
    //


}
