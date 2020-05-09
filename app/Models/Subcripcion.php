<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subcripcion extends Model
{
    protected $table 	  = 'subcripcion';

    protected $fillable   = [
                            'id_colegio',
	 	 	 	 	 	 	'aa_lectivo',
	 	 	 	 	 	 	'mo_cobro',
	 	 	 	 	 	 	'mo_pagado',
	 	 	 	 	 	 	'mo_saldo',
	 	 	 	 	 	 	'tx_observaciones',
	 	 	 	 	 	 	'id_status',
	 	 	 	 	 	 	'id_usuario'
                            ]; 
    
    protected $hidden     = [
                            'created_at',
	 	 	 	 	 	 	'updated_at'
                            ]; 
                           
    public function status(){

        return $this->BelongsTo('App\Models\Status', 'id_status');

    }
                           
    public function usuario(){

        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');

    }

                           
    //


}
