<?php

namespace App\Http\Controllers;

use App\Models\Clase;
use App\Models\Asistencia;
use App\Models\Alumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Carbon\Carbon;

class ClaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Clase::with([])
                    ->get();
    }

    public function claseDocente($idDocente)
    {
        return Clase::with([ 'grado:grado.id,nb_grado', 
                             'grupo:grupo.id,nb_grupo,id_grado',
                             'materia.areaEstudio:id,tx_color', 
                             'asistencia' ,
                             'asistencia.alumno:alumno.id,nb_nombre,nb_nombre2,nb_apellido,nb_apellido2', 
                             'asistencia.alumno.foto',  
                             'asistentes:asistencia.id,id_alumno,id_clase' 
                            ])
                    ->where('id_docente', $idDocente)
                    ->orderBy('fe_clase', 'desc')
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
            'id_grado'          => 	'required|integer|max:999999999',
			'id_grupo'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_docente'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge([ 'fe_clase' => Carbon::now() ]);

        $clase = Clase::create($request->all());

        $asistencia = $this->asistenciaClase($clase);

        return [ 'msj' => 'Clase Iniciada Correctamente', 'clase' => $clase, 'asistencia' => $asistencia ];
    }

    public function asistenciaClase(Clase $clase)
    {
        $alumnos  = Alumno::select('id')
                            ->whereHas('matricula', function (Builder $query) use($clase) {
                                $query->where('id_grupo', $clase->id_grupo);
                            })
                            ->activo()
                            ->get();
        
        $asistencias = [];

        foreach ($alumnos as $alumno) 
        {
            $asistencias[] = [
                                'id_clase'   => $clase->id,
                                'id_alumno'  => $alumno->id,
                                'id_usuario' => $clase->id_usuario,
                                'id_status'  => 1,
                            ];
        }

        return Asistencia::insert($asistencias);
    }
    
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function show(Clase $clase)
    {
        return $clase;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Clase $clase)
    {
        $validate = request()->validate([
            'id_grado'          => 	'required|integer|max:999999999',
			'id_grupo'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_docente'        => 	'required|integer|max:999999999',
			'fe_clase'          => 	'required|date',
			'fe_completada'     => 	'nullable|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $clase = $clase->update($request->all());

        return [ 'msj' => 'Clase Actualizada' , compact('clase')];
    }


    public function close(Request $request, Clase $clase)
    {
        $validate = request()->validate([
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge([ 'fe_completada' => date("Y-m-d H:i:s") ]);

        $clase = $clase->update($request->all());

        return [ 'msj' => 'Clase Culminada' , compact('clase')];
    }




    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Clase $clase)
    {
        $clase = $clase->delete();
 
        return [ 'msj' => 'Clase Eliminada' , compact('clase')];
    }
}
