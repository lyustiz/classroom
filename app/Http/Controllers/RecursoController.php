<?php

namespace App\Http\Controllers;

use App\Models\Recurso;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class RecursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $recurso = Recurso::with([
                                    'tipoRecurso:id,nb_tipo_recurso,id_tipo_archivo', 
                                    'grado:id,nb_grado', 
                                    'grupo:id,nb_grupo', 
                                    'archivo'
                                ])
                                ->get();
        
        return $recurso;
    }


    public function recursoGrado($idGrado)
    {
        $recurso = Recurso:: with([
                                    'tipoRecurso:id,nb_tipo_recurso,id_tipo_archivo,tx_icono,tx_color', 
                                    'grado:id,nb_grado', 
                                    'grupo:id,nb_grupo', 
                                    'archivo',
                                    'archivo.tipoArchivo:id,nb_tipo_archivo,tx_origen,tx_base_path'
                                ])
                                ->where('id_grado', $idGrado)
                                ->get();

        return $recurso;
    }

    public function recursoGrupo($idGrupo)
    {
        $recurso = Recurso:: with([
                                    'tipoRecurso:id,nb_tipo_recurso,id_tipo_archivo,tx_icono,tx_color', 
                                    'grado:id,nb_grado', 
                                    'grupo:id,nb_grupo', 
                                    'archivo',
                                    'archivo.tipoArchivo:id,nb_tipo_archivo,tx_origen,tx_base_path'
                                ])
                                ->where('id_grupo', $idGrupo)
                                ->get();

        return $recurso;
    }

    public function recursoDocente($idDocente)
    {
        $recurso = Recurso:: with([
                                    'tipoRecurso:id,nb_tipo_recurso,id_tipo_archivo,tx_icono,tx_color', 
                                    'grado:id,nb_grado', 
                                    'archivo',
                                    'archivo.tipoArchivo:id,nb_tipo_archivo,tx_origen,tx_base_path'
                                ])
                                ->whereHas('grupo.docente', function (Builder $query) use($idDocente) {
                                    $query->where('id_docente', $idDocente);
                                })
                                ->orderBy('id_grado', 'asc')
                                ->get();

        return $recurso;
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
            'id_tipo_recurso'   => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'id_grupo'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $recurso = recurso::create($request->all());

        return [ 'msj' => 'Recurso Agregado Correctamente', compact('recurso') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Recurso  $recurso
     * @return \Illuminate\Http\Response
     */
    public function show(Recurso $recurso)
    {
        return $recurso;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Recurso  $recurso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Recurso $recurso)
    {
        $validate = request()->validate([
            'id_tipo_recurso'   => 	'required|integer|max:999999999',
			'id_grado'          => 	'required|integer|max:999999999',
			'id_grupo'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $recurso = $recurso->update($request->all());

        return [ 'msj' => 'Recurso Actualizado' , compact('recurso')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Recurso  $recurso
     * @return \Illuminate\Http\Response
     */
    public function destroy(Recurso $recurso)
    {
        $recurso = $recurso->delete();
 
        return [ 'msj' => 'Recurso Eliminado' , compact('recurso')];
    }
}
