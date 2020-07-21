<?php

namespace App\Http\Controllers;

use App\Models\AlumnoMateria;
use App\Models\Materia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AlumnoMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $alumnoMateria = AlumnoMateria::with(['materia:id,nb_materia'])
                    ->get();
        
        return $alumnoMateria;
    }

    public function alumnoMateriaAlumnoGrado($idAlumno, $idGrado)
    {
        $alumnoMateria = AlumnoMateria::select('id','id_alumno','id_materia')
                                        ->with(['materia:id,nb_materia'])
                                        ->where('id_alumno', $idAlumno)
                                        ->where('id_grado', $idGrado)
                                        ->get();

        $materia       = Materia::select('id','nb_materia')
                                ->whereHas('grado', function ($query)  use ($idGrado){
                                    $query->where('grado.id', $idGrado);
                                })
                                ->whereNotIn('materia.id', $alumnoMateria->pluck('id_materia'))
                                ->get();

        $alumnoMateria = $this->formatData($alumnoMateria);

        return [ 'alumnoMateria' => $alumnoMateria, 'materia' => $materia] ;
    }


    function formatData($data)
    {
        $alumnoMateria = [];
        
        foreach ($data as $key => $row) {

            $alumnoMateria[] = [
                'id'         => $row->id,
                'id_materia' => $row->id_materia,
                'nb_materia' => $row->materia->nb_materia,
            ];
        }

        return $alumnoMateria;
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
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $alumnoMateria = alumnoMateria::create($request->all());

        $alumnoMateria->materia;

        return [ 'msj' => 'Materia Agregada Correctamente', 'alumnoMateria' => $alumnoMateria ];
    }

    public function storeAll(Request $request)
    {
        $validate = request()->validate([
            'id_calendario'     => 	'required|integer|max:999999999',
            'id_alumnos'        =>  'nullable|array',
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $delMateria = alumnoMateria::where('id_calendario', $request->id_calendario)
                                     ->where('id_grado', $request->id_grado)
                                     ->where('id_materia', $request->id_materia)
                                     ->delete();

        $inserMaterias = [];

        foreach ($request->id_alumnos as $id_alumno) {
            $inserMaterias[] = [
                        'id_calendario'     => $request->id_calendario,
                        'id_alumno'         => $id_alumno,
                        'id_grado'          => $request->id_grado,
                        'id_materia'        => $request->id_materia,
                        'id_status'         => $request->id_status,
                        'id_usuario'        => $request->id_usuario
            ];
        }

        $alumnoMateria = alumnoMateria::insert( $inserMaterias);


        $alumnoMateria = alumnoMateria::select('id','id_materia','id_alumno')
                                     ->where('id_calendario', $request->id_calendario)
                                     ->where('id_grado', $request->id_grado)
                                     ->where('id_materia', $request->id_materia)
                                     ->get();

        return [ 'msj' => 'Actualizado Correctamente', 'alumnoMateria' => $alumnoMateria ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AlumnoMateria  $alumnoMateria
     * @return \Illuminate\Http\Response
     */
    public function show(AlumnoMateria $alumnoMateria)
    {
        return $alumnoMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AlumnoMateria  $alumnoMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AlumnoMateria $alumnoMateria)
    {
        $validate = request()->validate([
            'id_calendario'     => 	'required|integer|max:999999999',
            'id_alumno'         => 	'required|integer|max:999999999',
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $alumnoMateria = $alumnoMateria->update($request->all());

        return [ 'msj' => 'Materia Editada' , compact('alumnoMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AlumnoMateria  $alumnoMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(AlumnoMateria $alumnoMateria)
    {
        $alumnoMateria = $alumnoMateria->delete();
 
        return [ 'msj' => 'Materia Eliminada' , compact('alumnoMateria')];
    }
}
