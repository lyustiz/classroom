<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    protected $table 	= 'status';
    
    protected $fillable =   [
                            'nb_status',
                            'nb_secundario',
                            'co_status',
                            'co_grupo',
                            'id_padre',
                            'tx_observaciones',
                            'bo_activo',
                            'id_usuario',
                            'created_at',
                            'updated_at'
                            ];

    protected $hidden   = [ 'created_at', 'updated_at'];


    public function usuario(){
    
        return $this->BelongsTo('App\Models\Usuario', 'id_usuario');
    
    }

    public function pais(){

        return $this->HasMany('App\Models\Pais', 'id_status');

    }

    public function departamento(){

        return $this->HasMany('App\Models\Departamento', 'id_status');

    }

    public function ciudad(){

        return $this->HasMany('App\Models\Ciudad', 'id_status');

    }

    public function zona(){

        return $this->HasMany('App\Models\Zona', 'id_status');

    }

    public function comuna(){

        return $this->HasMany('App\Models\Comuna', 'id_status');

    }

    public function barrio(){

        return $this->HasMany('App\Models\Barrio', 'id_status');

    }

    public function tipoServicio(){

        return $this->HasMany('App\Models\TipoServicio', 'id_status');

    }
    
    public function tipoFoto(){

        return $this->HasMany('App\Models\TipoFoto', 'id_status');

    }

    public function tipoPago(){

        return $this->HasMany('App\Models\TipoPago', 'id_status');

    }

    public function tipoTelefono(){

        return $this->HasMany('App\Models\TipoTelefono', 'id_status');

    }

    public function categoria(){

        return $this->HasMany('App\Models\Categoria', 'id_status');

    }

    public function comercio(){

        return $this->HasMany('App\Models\Comercio', 'id_status');

    }

    public function comercioCategoria(){

        return $this->HasMany('App\Models\Comercio_Categoria', 'id_status');

    }

    public function telefono(){

        return $this->HasMany('App\Models\Telefono', 'id_status');

    }

    public function horario(){

        return $this->HasMany('App\Models\Horario', 'id_status');

    }

    public function contacto(){

        return $this->HasMany('App\Models\Contacto', 'id_status');

    }

    public function foto(){

        return $this->HasMany('App\Models\Foto', 'id_status');

    }

    public function pago(){

        return $this->HasMany('App\Models\Pago', 'id_status');

    }

    public function subcripcion(){

        return $this->HasMany('App\Models\Subcripcion', 'id_status');

    }
    
    public function valoracion(){

        return $this->HasMany('App\Models\Valoracion', 'id_status');

    }

}
