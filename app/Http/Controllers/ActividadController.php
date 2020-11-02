<?php

namespace App\Http\Controllers;

use App\Models\Actividad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ActividadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Actividad::with([])
                    ->get();
    }

    public function actividadTema($idTema)
    {
        return Actividad::where('id_tema', $idTema)
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
            'nb_actividad'      => 	'required|string|max:100',
			'id_tema'           => 	'required|integer|max:999999999',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividad = actividad::create($request->all());

        return [ 'msj' => 'Actividad Agregada Correctamente', compact('actividad') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Actividad  $actividad
     * @return \Illuminate\Http\Response
     */
    public function show(Actividad $actividad)
    {
        return $actividad->load([
                                    'actividadPregunta',
                                    'actividadPregunta.tipoPregunta',
                                    'actividadPregunta.actividadRespuesta',
                                    'foto:id,tx_src,id_tipo_foto,id_origen',
                                    'foto.tipoFoto:id,tx_base_path',
                                ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Actividad  $actividad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Actividad $actividad)
    {
        $validate = request()->validate([
            'nb_actividad'      => 	'required|string|max:100',
			'id_tema'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:2000',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $actividad = $actividad->update($request->all());

        return [ 'msj' => 'Actividad actualizada' , compact('actividad')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Actividad  $actividad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Actividad $actividad)
    {
        $actividad = $actividad->delete();
 
        return [ 'msj' => 'Actividad Eliminada' , compact('actividad')];
    }
}
