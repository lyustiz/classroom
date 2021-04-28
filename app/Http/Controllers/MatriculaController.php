<?php

namespace App\Http\Controllers;

use App\Models\Matricula;
use App\Models\Usuario;
use App\Models\AlumnoMateria;
use App\Models\GradoMateria;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Jobs\SendWelcomeEmail;


class MatriculaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $matricula = Matricula::with([])
                    ->get();
        
        return $matricula;
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
            'id_calendario'     => 	'required|integer|max:999999999',
            'id_alumno'         => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'id_grupo'          => 	'nullable|integer|max:999999999',
			'fe_matricula'      => 	'required|date',
			'id_tipo_condicion' => 	'required|integer|max:999999999',
			'id_colegio_origen' => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $matricula = Matricula::create($request->all());

        $this->sendWelcomeMail($matricula);

        $materias  = $this->storeMateriasAlumno($matricula);

        return [ 'msj' => 'Matricula Agregada Correctamente', compact( 'matricula', 'materias' ) ];
    }


    public function storeMateriasAlumno($matricula)
    {
        $materias  = GradoMateria::select('id_materia')->where('id_grado', $matricula->id_grado)->get();

        $storeMaterias = [];

        foreach ($materias as $materia) {
           
            $storeMaterias[] =  [
                                    'id_calendario' => $matricula->id_calendario,
                                    'id_alumno'     => $matricula->id_alumno,
                                    'id_grado'      => $matricula->id_grado,  
                                    'id_materia'    => $materia->id_materia,
                                    'id_status'     => $matricula->id_status,
                                    'id_usuario'    => $matricula->id_usuario
                                ];
        }

        

        return AlumnoMateria::insert($storeMaterias);
    }



    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Matricula  $matricula
     * @return \Illuminate\Http\Response
     */
    public function show(Matricula $matricula)
    {
        return $matricula;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Matricula  $matricula
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Matricula $matricula)
    {
        $validate = request()->validate([
            'id_calendario'     => 	'required|integer|max:999999999',
            'id_alumno'         => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'id_grupo'          => 	'nullable|integer|max:999999999',
			'fe_matricula'      => 	'required|date',
			'id_tipo_condicion' => 	'required|integer|max:999999999',
			'id_colegio_origen' => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $matricula = $matricula->update($request->all());

        return [ 'msj' => 'Matricula Actualizada' , compact('matricula')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Matricula  $matricula
     * @return \Illuminate\Http\Response
     */
    public function destroy(Matricula $matricula)
    {
        $matricula = $matricula->delete();
 
        return [ 'msj' => 'Matricula Eliminada' , compact('matricula')];
    }

    public function prepareMail(Matricula $matricula)
    {
        
        $usuario =  $matricula->alumno->usuarioAlumno;

        return   [
                  'usuario' => $usuario,
                  'detail' =>  [ 'mail' => $usuario->tx_email, 'usuario' => $usuario->nb_usuario, 'nombre' => $usuario->nb_nombres ]
        ];

    }

    public function sendWelcomeMail(Matricula $matricula)
    {
        $data   = $this->prepareMail($matricula);

        SendWelcomeEmail::dispatch($data['detail']);

        $usuario =  $data['usuario'];

        $usuario->welcome_at = date('Y-m-d H:i:s');

        $usuario->save();
    }
}
