<?php

namespace App\Http\Controllers;

use App\Models\Incidencia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IncidenciaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $incidencia = Incidencia::with([])
                    ->get();
        
        return $incidencia;
    }

    public function incidenciaAlumno($idAlumno)
    {
        return  Incidencia::with([
                                    'tipoFalta:id,nb_tipo_falta,tx_icono,tx_color',
                                    'tipoSancion:id,nb_tipo_sancion'
                                ])
                            ->where('id_alumno', $idAlumno)
                            ->orderBy('fe_incidencia', 'desc')
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
            'id_alumno'         => 	'required|integer|max:999999999',
			'fe_incidencia'     => 	'required|date',
			'id_tipo_falta'     => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:200',
			'id_tipo_sancion'   => 	'required|integer|max:999999999',
			'tx_sancion'        => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $incidencia = incidencia::create($request->all());

        return [ 'msj' => 'Incidencia Agregado Correctamente', compact('incidencia') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Incidencia  $incidencia
     * @return \Illuminate\Http\Response
     */
    public function show(Incidencia $incidencia)
    {
        return $incidencia;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Incidencia  $incidencia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Incidencia $incidencia)
    {
        $validate = request()->validate([
            'id_alumno'         => 	'required|integer|max:999999999',
			'fe_incidencia'     => 	'required|date',
			'id_tipo_falta'     => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:200',
			'id_tipo_sancion'   => 	'required|integer|max:999999999',
			'tx_sancion'        => 	'nullable|string|max:100',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);
        
        $incidencia = $incidencia->update($request->all());

        return [ 'msj' => 'Incidencia Editado' , compact('incidencia')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Incidencia  $incidencia
     * @return \Illuminate\Http\Response
     */
    public function destroy(Incidencia $incidencia)
    {
        $incidencia = $incidencia->delete();
 
        return [ 'msj' => 'Incidencia Eliminado' , compact('incidencia')];
    }
}
