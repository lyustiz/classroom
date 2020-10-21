<?php

namespace App\Http\Controllers;

use App\Models\Asignacion;
use App\Models\TipoAsignacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AsignacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Asignacion::with([])
                    ->get();
    }

    public function asignacionGrupo($idGrupo)
    {
        $asignaciones =  Asignacion::with([
                                    'tipoAsignacion:id,nb_tipo_asignacion,tx_icono,tx_color',
                                    'materia:id,nb_materia',
                                    'tema:id,nb_tema',
                                    'origen'
                            ])
                            ->where('id_grupo', $idGrupo)
                            ->orderBy('fe_inicio', 'asc')
                            ->get();

        $tipoAsignacion =  TipoAsignacion::activo()->get();                

        return [
            'asignaciones'   => $this->formatData($asignaciones),
            'tipoAsignacion' => $tipoAsignacion
        ];
            
    }

    public function formatData($asignaciones)
    {
        $data = [];

        foreach ($asignaciones as $asignacion) //data[dia][tipo][materia]
        { 
            $data[$asignacion->fe_inicio][$asignacion->tipoAsignacion->nb_tipo_asignacion][$asignacion->materia->nb_materia][] = $asignacion;
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
            'id_grupo'           => 'required|integer|max:999999999',
			'id_tipo_asignacion' => 'required|integer|max:999999999',
			'id_materia'         => 'required|integer|max:999999999',
			'id_tema'            => 'required|integer|max:999999999',
			'id_origen'          => 'required|array',
			'tx_origen'          => 'required|string|max:80',
			'fe_inicio'          => 'required|date|before_or_equal:fe_fin',
            'fe_fin'             => 'nullable|date',
			'tx_observaciones'   => 'nullable|string|max:100',
			'id_status'          => 'required|integer|max:999999999',
            'id_usuario'         => 'required|integer|max:999999999',
        ]);

        $asignacion = [];
        
        foreach ($validate['id_origen'] as $id_origen) {
            $data = $validate;
            $data['id_origen'] = $id_origen;
            $asignacion[] = asignacion::create($data);
        }

        return [ 'msj' => 'Asignacion Agregada Correctamente', compact('asignacion') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Asignacion  $asignacion
     * @return \Illuminate\Http\Response
     */
    public function show(Asignacion $asignacion)
    {
        return $asignacion;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Asignacion  $asignacion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Asignacion $asignacion)
    {
        $validate = request()->validate([
            'id_grupo'          => 	'required|integer|max:999999999',
			'id_tipo_asignacion'=> 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'id_tema'           => 	'required|integer|max:999999999',
			'id_origen'         => 	'required|integer|max:999999999',
			'tx_origen'         => 	'required|string|max:80',
			'fe_inicio'         =>  'required|date|before_or_equal:fe_fin',
            'fe_fin'            =>  'nullable|date',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asignacion = $asignacion->update($request->all());

        return [ 'msj' => 'Asignacion Editado' , compact('asignacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Asignacion  $asignacion
     * @return \Illuminate\Http\Response
     */
    public function destroy(Asignacion $asignacion)
    {
        $asignacion = $asignacion->delete();
 
        return [ 'msj' => 'Asignacion Eliminado' , compact('asignacion')];
    }
}
