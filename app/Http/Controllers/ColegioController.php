<?php

namespace App\Http\Controllers;

use App\Models\Colegio;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ColegioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $colegio = Colegio::with(['tipoColegio'])
                    ->get();
        
        return $colegio;
    }


    public function colegioUsuario($idUsuario)
    {
        $colegio = Colegio::with(['tipoColegio:id,nb_tipo_colegio', 
                                  'calendario:id,nb_calendario,aa_escolar,fe_inicio,fe_fin',
                                  'calendario.periodoActivo:periodo.id,nb_periodo,id_calendario,fe_inicio,fe_fin'
                                ])
                          ->where('id_usuario', $idUsuario)
                          ->first();
        
        return $colegio;
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
            'nb_colegio'        => 	'required|string|max:50',
            'tx_codigo'         => 	'nullable|string|max:20',
			'id_tipo_colegio'   => 	'required|integer',
            'id_calendario'     => 	'required|integer',
            'id_jornada'        => 	'required|integer',
			'tx_telefono'       => 	'required|string|max:80',
            'nu_estudiantes'    => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $colegio = colegio::create($request->all());

        $colegio->tx_codigo =  date('Y') . str_pad($colegio->id, 5, "0", STR_PAD_LEFT);
        
        $colegio->save();

        $calendario = $colegio->calendario;

        \Cache::put('colegio', $colegio );

        return [ 'msj' => 'Colegio Agregado Correctamente', compact('colegio') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Colegio  $colegio
     * @return \Illuminate\Http\Response
     */
    public function show(Colegio $colegio)
    {
        return $colegio;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Colegio  $colegio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Colegio $colegio)
    {
        $validate = request()->validate([
            'nb_colegio'        => 	'required|string|max:50',
			'id_tipo_colegio'   => 	'required|integer',
            'id_calendario'     => 	'required|integer',
            'id_jornada'        => 	'required|integer',
			'tx_telefono'       => 	'required|string|max:20',
            'nu_estudiantes'    => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $colegio = tap($colegio)->update($request->all());

        \Cache::put('colegio', $colegio );

        return [ 'msj' => 'Colegio Actualizado' , compact('colegio')];
    }

    public function location(Request $request, Colegio $colegio)
    {
        $validate = request()->validate([
            'id_departamento' => 'required|integer',
            'id_ciudad'       => 'required|integer',
            'id_zona'         => 'required|integer',
            'id_comuna'       => 'required|integer',
            'id_barrio'       => 'required|integer',
            'tx_direccion'    => 'nullable|string|max:80',
            'nu_latitud'      => 'nullable|string|max:20',
            'nu_longitud'     => 'nullable|string|max:20',
            'id_usuario'      => 'required|integer',
        ]);

        $colegio = tap($colegio)->update($request->all());

        return [ 'msj' => 'Localizacion del Colegio Actualizada' , compact('colegio')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Colegio  $colegio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Colegio $colegio)
    {
        $colegio = $colegio->delete();
 
        return [ 'msj' => 'Colegio Eliminado' , compact('colegio')];
    }
}
