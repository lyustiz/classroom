<?php

namespace App\Http\Controllers;

use App\Models\Alumno;
use App\Http\Controllers\Traits\UsuarioTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;

class AlumnoController extends Controller
{
    use UsuarioTrait;
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Alumno::with([
                                'grado:grado.id,nb_grado', 
                                'grupo:grupo.id,nb_grupo',
                                'matricula:id,id_alumno,id_grado,id_grupo,fe_matricula,id_tipo_condicion,id_colegio_origen,tx_observaciones',
                                'foto:id,tx_src,id_tipo_foto,id_origen',
                                'foto.tipoFoto:id,tx_base_path',
                            ])
                            ->ordenApellido()
                            ->get();
    }

    public function list()
    {
        return Alumno::get();
    }

    public function alumnoGrupo($idGrupo)
    {
        $alumno = Alumno::select('id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2','tx_documento','fe_nacimiento')
                        ->whereHas('matricula', function (Builder $query) use($idGrupo) {
                            $query->where('id_grupo', $idGrupo)->activo();
                        })
                        ->ordenApellido()
                        ->activo()
                        ->get();
        
        return $alumno;
    }

    public function alumnoDetalleGrupo($idGrupo)
    {
        $alumno = Alumno::with([
                                'matricula:id,id_alumno,id_grado,id_grupo,fe_matricula,id_tipo_condicion,id_colegio_origen,tx_observaciones',
                                'foto:id,tx_src,id_tipo_foto,id_origen',
                                'foto.tipoFoto:id,tx_base_path',
                                'usuarioAlumno:id,nb_nombres,nb_usuario,tx_email,welcome_at,id_origen'
                            ])
                        ->select('id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2','tx_documento','fe_nacimiento')
                        ->whereHas('matricula', function (Builder $query) use($idGrupo) {
                            $query->where('id_grupo', $idGrupo)->activo();
                        })
                        ->ordenApellido()
                        ->activo()
                        ->get();
        
        return $alumno;
    }


    public function alumnoGrupoMateria($idGrupo, $idMateria)
    {
        return Alumno::select('id','nb_apellido','nb_apellido2','nb_nombre','nb_nombre2','tx_documento','fe_nacimiento')
                        ->where('id_status', 1)
                        ->whereHas('matricula', function (Builder $query) use($idGrupo) {
                            $query->where('id_grupo', $idGrupo)->activo();
                        })
                        ->whereHas('materia', function (Builder $query) use($idMateria) {
                            $query->where('materia.id', $idMateria);
                        })
                        ->ordenApellido()
                        ->activo()
                        ->get();
    }

    //evaluacion

    public function alumnoEvaluacionGrupoMateria($idEvaluacion, $idGrupo, $idMateria)
    {
        return  Alumno::with([
                                'evaluacionAlumno' => function($query) use ( $idEvaluacion ){
                                    $query->where('id_evaluacion' , $idEvaluacion);
                                },
                            ])
                            ->comboData()
                            ->ordenApellido()
                            ->activo()
                            ->whereHas('matricula', function (Builder $query) use($idGrupo) {
                                $query->where('id_grupo', $idGrupo)->activo();
                            })
                            ->whereHas('materia', function (Builder $query) use($idMateria) {
                                $query->where('materia.id', $idMateria);
                            })
                            ->get();
    }

    public function alumnoEvaluacion($idEvaluacion)
    {
        return  Alumno::with([
                                'evaluacionAlumno' => function($query) use ( $idEvaluacion ){
                                    $query->where('id_evaluacion' , $idEvaluacion);
                                },
                            ])
                            ->comboData()
                            ->ordenApellido()
                            ->activo()
                            ->whereHas('evaluacionAlumno', function (Builder $query) use($idEvaluacion) {
                                $query->where('id_evaluacion', $idEvaluacion);
                            })
                            ->get();
    }

    //prueba
    public function alumnoPruebaGrupoMateria($idPrueba, $idGrupo, $idMateria)
    {
        return  Alumno::with([
                                'pruebaAlumno'=> function($query) use ( $idPrueba ){
                                    $query->where('id_prueba' , $idPrueba);
                                },
                            ])
                            ->comboData()
                            ->ordenApellido()
                            ->activo()
                            ->whereHas('matricula', function (Builder $query) use($idGrupo) {
                                $query->where('id_grupo', $idGrupo)->activo();
                            })
                            ->whereHas('materia', function (Builder $query) use($idMateria) {
                                $query->where('materia.id', $idMateria);
                            })
                            ->get();

    }

    public function alumnoPruebaEvaluacion($idPrueba, $idEvaluacion)
    {
        return  Alumno::with([
                                'pruebaAlumno'=> function($query) use ( $idPrueba ){
                                    $query->where('id_prueba' , $idPrueba);
                                },
                            ])
                            ->whereHas('evaluacionAlumno', function (Builder $query) use($idEvaluacion) {
                                $query->where('id_evaluacion', $idEvaluacion);
                            })
                            ->whereDoesntHave('prueba', function (Builder $query) use($idPrueba, $idEvaluacion) {
                                $query->where('prueba.id', '<>', $idPrueba)
                                      ->where('id_evaluacion', $idEvaluacion);
                            })
                            ->comboData()
                            ->ordenApellido()
                            ->activo()
                            ->get();
    }

    public function alumnoPrueba($idPrueba)
    {
        return  Alumno::with([
                                'pruebaAlumno' => function($query) use ( $idPrueba ){
                                    $query->where('id_prueba' , $idPrueba);
                                },
                                'pruebaAlumno.calificacion:id,nb_calificacion,nu_calificacion'
                            ])
                            ->comboData()
                            ->ordenApellido()
                            ->activo()
                            ->whereHas('pruebaAlumno', function (Builder $query) use($idPrueba) {
                                $query->where('id_prueba', $idPrueba);
                            })
                            ->get();
    }

    public function alumnoSinGrupo()
    {
        $alumno = Alumno::doesntHave('grupoAlumno')
                        ->comboData()
                        ->ordenApellido()
                        ->activo()
                        ->get();
        
        return $alumno;
    }

    public function alumnoSinGrado()
    {
        $alumno = Alumno::doesntHave('gradoAlumno')
                        ->comboData()
                        ->activo()
                        ->get();
        
        return $alumno;
    }

    public function alumnoPariente($idPariente)
    {
        return  Alumno::with([
                            'foto:foto.id,tx_src,id_tipo_foto,id_origen',
                            'foto.tipoFoto:tipo_foto.id,tx_base_path',
                            'grado:grado.id,nb_grado',
                            'grupo:grupo.id,nb_grupo'
                        ])
                        ->whereHas('pariente', function ($query)  use ($idPariente){
                            $query->where('pariente.id', $idPariente);
                        })
                        ->get();
    }

    public function alumnoMatriculadoPariente($idPariente)
    {
        return  Alumno::with([
                            'foto:foto.id,tx_src,id_tipo_foto,id_origen',
                            'foto.tipoFoto:tipo_foto.id,tx_base_path',
                            'grado:grado.id,nb_grado',
                            'grupo:grupo.id,nb_grupo'
                        ])
                        ->whereHas('pariente', function ($query)  use ($idPariente){
                            $query->where('pariente.id', $idPariente);
                        })
                        ->has('matricula')
                        ->get();
    }

    public function alumnoPartners($idAlumno)
    {
        return Alumno::with([
                            'foto:foto.id,tx_src,id_tipo_foto,id_origen',
                            'foto.tipoFoto:tipo_foto.id,tx_base_path'
                        ])
                        ->comboData()
                        ->whereHas('grupo.alumno', function ($query)  use ($idAlumno){
                            $query->where('alumno.id', $idAlumno);
                        })
                        ->where('id', '<>' , $idAlumno)
                        ->activo()
                        ->get();
    }

    public function alumnoSearch(Request $request)
    {
        return Alumno::whereDoesntHave('pariente', function ($query)  use ($request){
                    $query->where('pariente.id', $request->id_pariente);
                })
                ->activo()
                ->search($request->tx_search)
                ->get();
    }

    public function alumnoMateriasDocentes($idAlumno)
    {
        $idPeriodo = 1; //TODO    = \Auth::user();//->colegio->calendario->periodoActivo->nb_periodo;
        
        return Alumno::with([
                            'grado:grado.id,nb_grado',
                            'grupo:grupo.id,nb_grupo',
                            'grupo.planEvaluacion' => function($query) use ( $idPeriodo ){
                                $query->where('id_periodo' , $idPeriodo);
                            },
                            'grupo.planEvaluacion.materia:materia.id,nb_materia',
                            'grupo.planEvaluacion.docente:docente.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2',
                        ])
                        ->comboData()
                        ->find($idAlumno);
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
			'tx_sexo'           => 	'required|string|max:1',
			'fe_nacimiento'     => 	'required|date|before:today',
			'id_tipo_documento' => 	'required|integer|max:999999999',
			'tx_documento'      => 	'required|string|max:12',
			'tx_lugar_nacimiento'=> 'nullable|string|max:80',
			'tx_nacionalidad'   => 	'required|string|max:30',
			'tx_direccion'      => 	'required|string|max:80',
			'id_departamento'   => 	'required|integer|max:999999999',
			'id_ciudad'         => 	'required|integer|max:999999999',
			'tx_email'          => 	'required|string|max:30',
			'tx_telefono'       => 	'required|string|max:15',
			'tx_telefono2'      => 	'nullable|string|max:15',
			'tx_telefono3'      => 	'nullable|string|max:15',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ],
        [
            'tx_email.require' => 'El correo es requerido',
        ]);

        $alumno  = alumno::create($request->all());

        $usuario = UsuarioTrait::usuarioOrigenTipo($alumno, 3) ;

        return [ 'msj' => 'Alumno Agregado Correctamente', compact('alumno', 'usuario') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Alumno  $alumno
     * @return \Illuminate\Http\Response
     */
    public function show(Alumno $alumno)
    {
        return $alumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Alumno  $alumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Alumno $alumno)
    {
        $validate = request()->validate([
            'nb_apellido'       => 	'required|string|max:30',
			'nb_apellido2'      => 	'nullable|string|max:30',
			'nb_nombre'         => 	'required|string|max:30',
			'nb_nombre2'        => 	'nullable|string|max:30',
			'tx_sexo'           => 	'required|string|max:1',
			'fe_nacimiento'     => 	'required|date|before:today',
			'id_tipo_documento' => 	'required|integer|max:999999999',
			'tx_documento'      => 	'required|string|max:12',
			'tx_lugar_nacimiento'=> 'nullable|string|max:80',
			'tx_nacionalidad'   => 	'nullable|string|max:30',
			'tx_direccion'      => 	'required|string|max:80',
			'id_departamento'   => 	'required|integer|max:999999999',
			'id_ciudad'         => 	'required|integer|max:999999999',
			'tx_email'          => 	'nullable|string|max:30',
			'tx_telefono'       => 	'nullable|string|max:15',
			'tx_telefono2'      => 	'nullable|string|max:15',
			'tx_telefono3'      => 	'nullable|string|max:15',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ],
        [
            'tx_email.require' => 'El correo es requerido',
        ]);

        $alumno = $alumno->update($request->all());

        return [ 'msj' => 'Alumno Editado' , compact('alumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Alumno  $alumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(Alumno $alumno)
    {
        if( count($alumno->matricula) > 0 )
        {
            throw ValidationException::withMessages(['poseeMatricula' => "El Alumno posee Matricula"]);
        }

        if( count($alumno->materia) > 0 )
        {
            throw ValidationException::withMessages(['poseeMateria' => "El Alumno posee materia(s) asociada(s)"]);
        }

        if( count($alumno->EvaluacionAlumno) > 0 )
        {
            throw ValidationException::withMessages(['poseeEvaluacion' => "El Alumno posee Evaluaciones(s) asignadas(s)"]);
        }
        
        if( count($alumno->pariente) > 0 )
        {
            throw ValidationException::withMessages(['poseePariente' => "El Alumno tiene vinculado a un Acudiente"]);
        }

        $usuario = $alumno->usuarioAlumno;

        $perfiles = $usuario->usuarioPerfil;

        foreach ($perfiles as $perfil) {
            $perfil->delete();
        }

        $usuario->update(['id_status' => 2]);
        
        $alumno = $alumno->delete();
 
        return [ 'msj' => 'Alumno Eliminado' , compact('alumno')];
    }
}
