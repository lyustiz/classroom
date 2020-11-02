<?php

namespace App\Http\Controllers;

use App\Models\Asistencia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class AsistenciaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Asistencia::with([])
                    ->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function storeAll(Request $request)
    {
        $validate = request()->validate([
            'id_clase'          => 	'required|integer|max:999999999',
			'id_alumnos'        =>  'required|array',
			'bo_asistencia'     => 	'required|array',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        
        $date        =  Carbon::now();
        $asistencias = [];

        foreach ($request->id_alumnos as $idAlumno) 
        {
            $asistencias []  = [
                                'id_clase'         => $request->id_clase,
                                'id_alumno'        => $idAlumno,
                                'bo_asistencia'    => in_array($idAlumno, $request->bo_asistencia),
                                'id_status'        => $request->id_status,
                                'id_usuario'       => $request->id_usuario,
                                'fe_asistencia'    => $date ,
                                'fe_asistencia'    => $date ,
                            ];  
        }

        $asistencia = Asistencia::insert($asistencias);

        return [ 'msj' => 'Asistencia cargada Correctamente', compact('asistencia') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function show(Asistencia $asistencia)
    {
        return $asistencia;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Asistencia $asistencia)
    {
        $validate = request()->validate([
			'bo_asistencia'     => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge([ 'fe_asistencia' => Carbon::now() ]);

        $asistencia = $asistencia->update($request->all());

        return [ 'msj' => 'Asistencia Actualizada' , compact('asistencia')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Asistencia  $asistencia
     * @return \Illuminate\Http\Response
     */
    public function destroy(Asistencia $asistencia)
    {
        $asistencia = $asistencia->delete();
 
        return [ 'msj' => 'Asistencia Eliminado' , compact('asistencia')];
    }
}
