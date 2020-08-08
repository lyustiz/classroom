<?php

namespace App\Http\Controllers;

use App\Models\Prueba;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class PruebaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $prueba = Prueba::with([
                                'grado:id,nb_grado', 
                                'grupo:id,nb_grupo', 
                                'materia:id,nb_materia',
                                'docente:id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2'
                                ])
                                ->get();
        
        return $prueba;
    }

    public function pruebaDocente($idDocente)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo','materia:id,nb_materia'])
                      ->where('id_docente', $idDocente)
                      ->get();
    }

    public function pruebaDocenteGradoMateria($idDocente, $idGrado, $idMateria)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo','materia:id,nb_materia', 'status:id,nb_status'])
                      ->where('id_docente', $idDocente)
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
                      ->get();
    }

    public function pruebaDocenteGradoMateriaPendiente($idDocente, $idGrado, $idMateria)
    {
        return  Prueba::with(['grado:id,nb_grado','materia:id,nb_materia'])
                      ->where('id_docente', $idDocente)
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
                      ->pendiente()
                      ->get();
    }

    public function pruebaDocenteGradoPendiente($idDocente, $idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo','materia:id,nb_materia'])
                      ->where('id_docente', $idDocente)
                      ->pendiente()
                      ->get();
    }

    public function pruebaDocenteGradoMateriaAsignada($idDocente, $idGrado, $idMateria)
    {
        return  Prueba::with([
                            'grado:grado.id,nb_grado', 
                            'grupo:grupo.id,nb_grupo',
                            'materia:materia.id,nb_materia', 
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento'
                       ])
                      ->where('id_docente', $idDocente)
                      ->where('id_grado', $idGrado)
                      ->where('id_materia', $idMateria)
                      ->asignada()
                      ->get();
    }

    public function pruebaDocenteEjecutar($idDocente)
    {
        return  Prueba::with([
                            'status:id,nb_status,tx_color,tx_icono',
                            'grado:grado.id,nb_grado', 
                            'grupo:grupo.id,nb_grupo',
                            'materia:materia.id,nb_materia', 
                            'pregunta:id,nb_pregunta',
                            'pregunta.tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color',
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento'
                       ])
                      ->where('id_docente', $idDocente)
                      ->ejecutar()
                      ->get();
    }

    public function pruebaDocenteEvaluar($idDocente)
    {
        return  Prueba::with([
                            'status:id,nb_status,tx_color,tx_icono',
                            'grado:grado.id,nb_grado',
                            'grupo:grupo.id,nb_grupo',
                            'materia:materia.id,nb_materia', 
                            'pregunta:id,nb_pregunta',
                            'pregunta.tipoPregunta:id,nb_tipo_pregunta,tx_icono,tx_color',
                            'alumno:alumno.id,nb_apellido,nb_apellido2,nb_nombre,nb_nombre2,tx_documento'
                       ])
                      ->where('id_docente', $idDocente)
                      ->orderBy('fe_prueba', 'desc')
                      ->evaluar()
                      ->get();
    }

    public function pruebaGrado($idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                      ->where('id_grado', $idGrado)
                      ->get();
    }

    public function pruebaGradoImportar($id_prueba, $idGrado)
    {
        return  Prueba::with(['grado:id,nb_grado', 'grupo:id,nb_grupo'])
                      ->where('id_grado', $idGrado)
                      ->where('id', '<>', $id_prueba)
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
            'nb_prueba'         => 	  'required|string|max:100',
            'id_grado'          => 	  'required|integer|max:999999999',
            'id_grupo'          => 	  'nullable|integer|max:999999999',
            'id_materia'        => 	  'required|integer|max:999999999',
            'id_docente'        => 	  'required|integer|max:999999999',
			'id_evaluacion_detalle'=> 'nullable|integer|max:999999999',
			'bo_ver_resultado'  => 	  'required|boolean',
			'nu_minutos'        => 	  'nullable|integer|max:999999999',
			'fe_prueba'         => 	  'nullable|date',
			'hh_inicio'         =>    'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'            =>    'nullable|date_format:"H:i"',
			'nu_valor_total'    => 	  'nullable|integer|max:999999999',
			'tx_observaciones'  => 	  'nullable|string|max:100',
			'id_status'         => 	  'required|integer|max:999999999',
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);

        $prueba = prueba::create($request->all());

        return [ 'msj' => 'Prueba Agregado Correctamente', compact('prueba') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function show(Prueba $prueba)
    {
        return $prueba;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
            'nb_prueba'         => 	  'required|string|max:100',
            'id_grado'          => 	  'required|integer|max:999999999',
            'id_grupo'          => 	  'nullable|integer|max:999999999',
            'id_materia'        => 	  'required|integer|max:999999999',
            'id_docente'        => 	  'required|integer|max:999999999',
			'id_evaluacion_detalle'=> 'nullable|integer|max:999999999',
			'bo_ver_resultado'  => 	  'required|boolean',
			'nu_minutos'        => 	  'nullable|integer|max:999999999',
			'fe_prueba'         => 	  'nullable|date',
			'hh_inicio'         =>    'nullable|date_format:"H:i"|before:hh_fin"',
            'hh_fin'            =>    'nullable|date_format:"H:i"',
			'nu_valor_total'    => 	  'nullable|integer|max:999999999',
			'tx_observaciones'  => 	  'nullable|string|max:100',
			'id_status'         => 	  'required|integer|max:999999999',
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Actualizada' , compact('prueba')];
    }

    public function asignar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
            'id_evaluacion_detalle' =>    'required|integer|max:999999999',
            'id_grupo'              => 	  'required|integer|max:999999999',
			'id_usuario'            => 	  'required|integer|max:999999999',
        ]);

        $request->merge(['id_status' => $prueba->asignada()]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Asignada' , compact('prueba')];
    }


    public function ejecutar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'bo_ver_resultado'  => 	  'required|boolean',
			'nu_minutos'        => 	  'required|integer|max:999999999',
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);
        
        $date = Carbon::now();

        $request->merge([
            'fe_prueba'        => $date->toDateString(),
            'hh_inicio'        => $date->toTimeString(),
            'hh_fin'           => $date->addMinute($request->nu_minutos)->toTimeString(),
            'nu_valor_total'   => $prueba->pregunta()->sum('nu_valor'),
            'id_status'        => $prueba->ejecucion(),
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba en Ejecucion' , compact('prueba')];
    }

    public function cancelar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'id_usuario'      => 	  'required|integer|max:999999999',
        ]);
        
        $request->merge([
            'fe_prueba'       => null,
            'hh_inicio'       => null,
            'hh_fin'          => null,
            'nu_valor_total'  => null,
            'id_status'       => $prueba->asignada()
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Cancelada' , compact('prueba')];
    }

    public function reiniciar(Request $request, Prueba $prueba)
    {
        $validate = request()->validate([
			'id_usuario'        => 	  'required|integer|max:999999999',
        ]);
        
        $request->merge([
            'fe_prueba'       => null,
            'hh_inicio'       => null,
            'hh_fin'          => null,
            'nu_valor_total'  => null,
            'id_status'       => $prueba->asignada()
        ]);

        $prueba = $prueba->update($request->all());

        return [ 'msj' => 'Prueba Reiniciada' , compact('prueba')];
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Prueba  $prueba
     * @return \Illuminate\Http\Response
     */
    public function destroy(Prueba $prueba)
    {
        $prueba = $prueba->delete();
 
        return [ 'msj' => 'Prueba Eliminado' , compact('prueba')];
    }
}
