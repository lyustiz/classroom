<?php

namespace App\Http\Controllers;

use App\Models\Tema;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\ValidationException;

class TemaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Tema::with(['grado:id,nb_grado', 'materia:id,nb_materia'])
                    ->where('id', '<>', 0)
                    ->get();
    }

    public function temaGradoMateria( $idGrado, $idMateria )
    {
        return Tema::comboData()
                    ->where('id_grado',   $idGrado)
                    ->where('id_materia', $idMateria)
                    ->activo()
                    ->get();
    }

    public function temaGradoMateriaGrupo( $idGrado, $idMateria, $idGrupo)
    {
        return Tema::comboData()
                    ->where('id_grado',   $idGrado)
                    ->where('id_materia', $idMateria)
                    ->whereHas('planTema', function (Builder $query) use($idGrupo, $idMateria) {
                        $query->where('id_grupo', $idGrupo)
                              ->whereHas('planEvaluacion', function (Builder $query) use($idGrupo, $idMateria) {
                                    $query->where('id_grupo', $idGrupo)
                                          ->where('id_materia', $idMateria)
                                          ->has('periodoActivo')
                                          ->activo();
                                });
                    })
                    ->activo()
                    ->get();
    }

    public function temaGrupoMateria( $idGrupo, $idMateria )
    {
        return Tema::comboData()
                    ->whereHas('grado.grupo', function (Builder $query) use($idGrupo) {
                        $query->where('id_grupo', $idGrupo)->activo();
                    })
                    ->where('id_materia', $idMateria)
                    ->activo()
                    ->get();
    }

    public function temaRecursos($idTema)
    {
        return Tema::with([
                          'enlace:enlace.id,nb_enlace,id_tipo_enlace,id_tema,tx_descripcion,tx_url',
                          'enlace.tipoEnlace:tipo_enlace.id,nb_tipo_enlace,tx_icono,tx_color',  
                          'recurso',
                          'actividad:actividad.id,nb_actividad,id_tema,tx_descripcion',
                          'prueba',
                          'tarea',
                    ])
                    ->comboData()
                    ->find($idTema);
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
            'nb_tema'           => 	'nullable|string|max:80',
            'nu_tema'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'nu_nivel'          => 	'nullable|integer|max:999999999',
			'nu_peso'           => 	'nullable|integer|max:999999999',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tema = tema::create($request->all());

        return [ 'msj' => 'Tema Agregado Correctamente', compact('tema') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tema  $tema
     * @return \Illuminate\Http\Response
     */
    public function show(Tema $tema)
    {
        return $tema;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tema  $tema
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tema $tema)
    {
        $validate = request()->validate([
            'nb_tema'           => 	'nullable|string|max:80',
            'nu_tema'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'nu_nivel'          => 	'nullable|integer|max:999999999',
			'nu_peso'           => 	'nullable|integer|max:999999999',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $tema = $tema->update($request->all());

        return [ 'msj' => 'Tema Editado' , compact('tema')];
    }

    /** 
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tema  $tema
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tema $tema)
    {
        if( count($tema->planTema) > 0 )
        {
            throw ValidationException::withMessages(['poseePlanEvaluacion' => "Posee Plan de Evaluacion(es) asociado(s)"]);
        }

        if( count($tema->actividad) > 0 )
        {
            throw ValidationException::withMessages(['poseeActividad' => "Posee Plan de Actividad(es) asociada(s)"]);
        }

        if( count($tema->enlace) > 0 )
        {
            throw ValidationException::withMessages(['poseeEnlace' => "Posee Plan de Enlace(es) asociado(s)"]);
        }

        if( count($tema->recurso) > 0 )
        {
            throw ValidationException::withMessages(['poseeRecurso' => "Posee Plan de Lectura(s) asociada(s)"]);
        }

        if( count($tema->prueba) > 0 )
        {
            throw ValidationException::withMessages(['poseePrueba' => "Posee Plan de Cuestionario(s) asociado(s)"]);
        }

        if( count($tema->tarea) > 0 )
        {
            throw ValidationException::withMessages(['poseeTarea' => "Posee Plan de Tarea(s) asociada(s)"]);
        }
        
        $tema = $tema->delete();
 
        return [ 'msj' => 'Tema Eliminado' , compact('tema')];
    }
}
