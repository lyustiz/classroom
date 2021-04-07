<?php

namespace App\Http\Controllers;

use App\Models\Empleado;
use App\Http\Controllers\Traits\UsuarioTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EmpleadoController extends Controller
{
    use UsuarioTrait;
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $empleado = Empleado::with(['cargo:id,nb_cargo',
                                    'estadoCivil:id,nb_estado_civil',
                                    'tipoDocumento:id,nb_tipo_documento',
                                    'departamento:id,nb_departamento',
                                    'ciudad:id,nb_ciudad'])
                    ->get();
        

        return $empleado;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = request()->validate([
            'nb_apellido'       => 	'required|string|max:30',
			'nb_apellido2'      => 	'nullable|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'nullable|string|max:30',
			'id_estado_civil'   => 	'required|integer|max:999999999',
			'tx_sexo'           => 	'required|string|max:1',
			'fe_nacimiento'     => 	'required|date|before:today',
			'id_tipo_documento' => 	'required|integer|max:999999999',
			'tx_documento'      => 	'required|string|max:12',
			'tx_lugar_nacimiento'=> 'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:80',
			'id_departamento'   => 	'required|integer|max:999999999',
			'id_ciudad'         => 	'required|integer|max:999999999',
			'tx_email'          => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:15',
			'tx_telefono_movil' => 	'required|string|max:15',
            'id_cargo'          => 	'required|integer|max:999999999',
            'tx_foto'           =>  'nullable|string|max:100',
            'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ],
        [
            'tx_email.require' => 'El correo es requerido',
        ]);

        $empleado = empleado::create($request->all());

        $usuario = UsuarioTrait::usuarioOrigenTipo($empleado, 5) ;

        return [ 'msj' => 'Empleado Agregado Correctamente', compact('empleado', 'usuario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Empleado  $empleado
     * @return \Illuminate\Http\Response
     */
    public function show(Empleado $empleado)
    {
        return $empleado;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Empleado  $empleado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Empleado $empleado)
    {
        $validate = request()->validate([
            'nb_apellido'       => 	'required|string|max:30',
			'nb_apellido2'      => 	'nullable|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'nullable|string|max:30',
			'id_estado_civil'   => 	'required|integer|max:999999999',
			'tx_sexo'           => 	'required|string|max:1',
			'fe_nacimiento'     => 	'required|date|before:today',
			'id_tipo_documento' => 	'required|integer|max:999999999',
			'tx_documento'      => 	'required|string|max:12',
			'tx_lugar_nacimiento'=> 'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:80',
			'id_departamento'   => 	'required|integer|max:999999999',
			'id_ciudad'         => 	'required|integer|max:999999999',
			'tx_email'          => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:15',
			'tx_telefono_movil' => 	'required|string|max:15',
            'id_cargo'          => 	'required|integer|max:999999999',
            'tx_foto'           =>  'nullable|string|max:100',
            'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ],
        [
            'tx_email.require' => 'El correo es requerido'
        ]);

        $empleado = $empleado->update($request->all());

        return [ 'msj' => 'Empleado Editado' , compact('empleado')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Empleado  $empleado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Empleado $empleado)
    {
        
        $usuario = $empleado->usuarioEmpleado;

        $perfiles = $usuario->usuarioPerfil;

        foreach ($perfiles as $perfil) {
            $perfil->delete();
        }

        $usuario->update(['id_status' => 2]);
        
        $empleado = $empleado->delete();
 
        return [ 'msj' => 'Empleado Eliminado' , compact('empleado')];
    }
}
