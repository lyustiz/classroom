<?php

namespace App\Http\Controllers;

use App\Models\AsignacionAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AsignacionAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return AsignacionAlumno::with([])
                    ->get();
    }

    public function asignacionAlumnoAlumno($idAlumno)  //TODO  Extraer Querys
    {

        $asignaciones = AsignacionAlumno::with([
                                    'asignacion:id,id_tipo_asignacion,id_materia,id_tema,id_origen,tx_origen,fe_inicio,fe_fin',
                                    'asignacion.tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color',
                                    'asignacion.materia:id,nb_materia',
                                    'asignacion.tema:id,nb_tema',
                                    'asignacion.origen'
                            ])
                            ->where('id_alumno', $idAlumno)
                            ->get(); 

        return $this->formatData($asignaciones);
    }

    public function formatData($asignacionesAlumno)
    {
        $data = [];

        foreach ($asignacionesAlumno as $asignacionAlumno) //data[tipo][materia]
        { 
            $asignacion = $asignacionAlumno->asignacion;
            $data[$asignacion->tipoAsignacion->nb_tipo_asignacion][] = $asignacionAlumno;
        }

        return $data;
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
            'id_asignacion'     => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'fe_completado'     => 	'nullable|date',
			'nu_calificacion'   => 	'required|integer|max:999999999',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'fe_acceso'         => 	'nullable|integer|max:999999999',
			'nu_accesos'        => 	'nullable|integer|max:999999999',
			'nu_minutos'        => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asignacionAlumno = asignacionAlumno::create($request->all());

        return [ 'msj' => 'AsignacionAlumno Agregado Correctamente', compact('asignacionAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AsignacionAlumno  $asignacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(AsignacionAlumno $asignacionAlumno)
    {
        return $asignacionAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AsignacionAlumno  $asignacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AsignacionAlumno $asignacionAlumno)
    {
        $validate = request()->validate([
            'id_asignacion'     => 	'required|integer|max:999999999',
			'id_alumno'         => 	'required|integer|max:999999999',
			'fe_completado'     => 	'nullable|date',
			'nu_calificacion'   => 	'required|integer|max:999999999',
			'id_calificacion'   => 	'required|integer|max:999999999',
			'fe_acceso'         => 	'nullable|integer|max:999999999',
			'nu_accesos'        => 	'nullable|integer|max:999999999',
			'nu_minutos'        => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asignacionAlumno = $asignacionAlumno->update($request->all());

        return [ 'msj' => 'AsignacionAlumno Editado' , compact('asignacionAlumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AsignacionAlumno  $asignacionAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(AsignacionAlumno $asignacionAlumno)
    {
        $asignacionAlumno = $asignacionAlumno->delete();
 
        return [ 'msj' => 'AsignacionAlumno Eliminado' , compact('asignacionAlumno')];
    }
}
