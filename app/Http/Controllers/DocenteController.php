<?php

namespace App\Http\Controllers;

use App\Models\Docente;
use App\Http\Controllers\Traits\UsuarioTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;


class DocenteController extends Controller
{
    use UsuarioTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $docente = Docente::with([
                                    'foto:id,tx_src,id_tipo_foto,id_origen',
                                    'foto.tipoFoto:id,tx_base_path',
                                ])
                                ->get();
        
        return $docente;
    }

    public function docenteMateria($idMateria)
    {
        return  Docente::select('id', 'nb_apellido', 'nb_apellido2', 'nb_nombre', 'nb_nombre2')
                        ->whereHas('docenteMateria', function (Builder $query) use($idMateria) {
                            $query->where('id_materia', $idMateria);
                        })
                        ->get();
    }

    public function list()
    {
        return Docente::select('nb_apellido', 'nb_apellido2', 'nb_nombre', 'nb_nombre2')
                          ->get();
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
			'nb_apellido2'      => 	'required|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'required|string|max:30',
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
            'tx_foto'           =>  'nullable|string|max:100',
            'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $docente = docente::create($request->all());

        $usuario = UsuarioTrait::usuarioOrigenTipo($docente, 2) ;

        return [ 'msj' => 'Docente Agregado Correctamente', compact('docente', 'usuario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Docente  $docente
     * @return \Illuminate\Http\Response
     */
    public function show(Docente $docente)
    {
        return $docente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Docente  $docente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Docente $docente)
    {
        $validate = request()->validate([
            'nb_apellido'       => 	'required|string|max:30',
			'nb_apellido2'      => 	'required|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'required|string|max:30',
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
            'tx_foto'           =>  'nullable|string|max:100',
            'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $docente = $docente->update($request->all());

        return [ 'msj' => 'Docente Editado' , compact('docente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Docente  $docente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Docente $docente)
    {
        $docente = $docente->delete();
 
        return [ 'msj' => 'Docente Eliminado' , compact('docente')];
    }
}
