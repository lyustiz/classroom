<?php

namespace App\Http\Controllers;

use App\Models\Pariente;
use App\Models\AlumnoPariente;
use App\Http\Controllers\Traits\UsuarioTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ParienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pariente = Pariente::with([
                                    'alumno:alumno.id,nb_nombre,nb_apellido', 
                                    'parentesco:parentesco.id,nb_parentesco',
                                    'foto:id,tx_src,id_tipo_foto,id_origen',
                                    'foto.tipoFoto:id,tx_base_path',
                            ])
                            ->get();
        
        return $pariente;
    }

    public function parienteAlumno($idAlumno)
    {
        return  Pariente::with(['parentesco:id,nb_parentesco'])
                        ->whereHas('alumno', function ($query)  use ($idAlumno){
                            $query->where('alumno.id', $idAlumno);
                        })
                        ->get();
    }

    public function parienteSearch(Request $request)
    {
        return  Pariente::comboData()
                        ->whereDoesntHave('alumno', function ($query)  use ($request){
                            $query->where('alumno.id', $request->id_alumno);
                        })
                        ->activo()
                        ->search($request->tx_search)
                        ->get();
    }

    public function storeValidate(Request $request)
    {
        return  request()->validate([  
            'nb_apellido'         => 'required|string|max:30',
            'nb_apellido2'        => 'nullable|string|max:30',
            'nb_nombre'           => 'required|string|max:30',
            'nb_nombre2'          => 'nullable|string|max:30',
            'id_tipo_documento'   => 'required|integer|max:999999999',
            'tx_documento'        => 'required|string|max:12',
            'tx_sexo'             => 'required|string|max:1',
            'fe_nacimiento'       => 'required|date|before:today',
            'tx_nacionalidad'     => 'required|string|max:30',
            'tx_lugar_nacimiento' => 'required|string|max:80',
            'id_parentesco'       => 'required|integer|max:999999999',
            'id_estado_civil'     => 'required|integer|max:999999999',
            'tx_empresa'          => 'required|string|max:30',
            'tx_cargo'            => 'required|string|max:30',
            'tx_ocupacion'        => 'required|string|max:30',
            'tx_telefono'         => 'required|string|max:15',
            'tx_telefono2'        => 'required|string|max:15',
            'tx_telefono3'        => 'nullable|string|max:15',
            'tx_email'            => 'required|string|max:30',
            'tx_observaciones'    => 'nullable|string|max:100',
            'id_status'           => 'required|integer|max:999999999',
            'id_usuario'          => 'required|integer|max:999999999',
        ],
        [
            'tx_email.require' => 'El correo es requerido',
        ]);
    }


    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = $this->storeValidate($request);
       
        $pariente = pariente::create($request->all());

        $usuario = UsuarioTrait::usuarioOrigenTipo($pariente, 4) ;

        return [ 'msj' => 'Pariente Agregado Correctamente', compact('pariente', 'usuario') ];
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeByAlumno(Request $request, $idAlumno)
    {
        $validate = $this->storeValidate($request);

        $pariente = pariente::create($request->all());

        $alumnoPariente = AlumnoPariente::create([
                                'id_alumno'         => $idAlumno,
                                'id_pariente'       => $pariente->id,
                                'bo_acudiente'      => 1,
                                'id_status'         => 1,
                                'id_usuario'        => $pariente->id_usuario
                            ]);

        return [ 'msj' => 'Acudiente Agregado Correctamente', compact('pariente', 'alumnoPariente') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function show(Pariente $pariente)
    {
        return $pariente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pariente $pariente)
    {
        $validate = request()->validate([
            'nb_apellido'         => 'required|string|max:30',
            'nb_apellido2'        => 'nullable|string|max:30',
            'nb_nombre'           => 'required|string|max:30',
            'nb_nombre2'          => 'nullable|string|max:30',
            'id_tipo_documento'   => 'required|integer|max:999999999',
            'tx_documento'        => 'required|string|max:12',
            'tx_sexo'             => 'required|string|max:1',
            'fe_nacimiento'       => 'required|date|before:today',
            'tx_nacionalidad'     => 'required|string|max:30',
            'tx_lugar_nacimiento' => 'required|string|max:80',
            'id_parentesco'       => 'required|integer|max:999999999',
            'id_estado_civil'     => 'required|integer|max:999999999',
            'tx_empresa'          => 'required|string|max:30',
            'tx_cargo'            => 'required|string|max:30',
            'tx_ocupacion'        => 'required|string|max:30',
            'tx_telefono'         => 'required|string|max:15',
            'tx_telefono2'        => 'nullable|string|max:15',
            'tx_telefono3'        => 'nullable|string|max:15',
            'tx_email'            => 'required|string|max:30',
            'tx_observaciones'    => 'nullable|string|max:100',
            'id_status'           => 'required|integer|max:999999999',
            'id_usuario'          => 'required|integer|max:999999999',
        ],
        [
            'tx_email.require' => 'El correo es requerido',
        ]);

        $pariente = $pariente->update($request->all());

        return [ 'msj' => 'Acudiente Editado' , compact('pariente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pariente $pariente)
    {
        
        if( count($pariente->alumnoPariente) > 0 )
        {
            throw ValidationException::withMessages(['poseeAlumnos' => "El Acudiente posee Alumnos vinculados"]);
        }
        
        $usuario = $pariente->usuarioPariente;

        $perfiles = $usuario->usuarioPerfil;

        foreach ($perfiles as $perfil) {
            $perfil->delete();
        }
        
        $pariente = $pariente->delete();
 
        return [ 'msj' => 'Acudiente Eliminado' , compact('pariente')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pariente  $pariente
     * @return \Illuminate\Http\Response
     */
    public function destroyByAlumno($idPariente, $idAlumno)
    {
        $pariente = AlumnoPariente::where('id_alumno', $idAlumno)
                    ->where('id_pariente', $idPariente)
                    ->delete();
        
        return [ 'msj' => 'Acudiente Desvinculado' , compact('pariente')]; 
    }
}
