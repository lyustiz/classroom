<?php

namespace App\Http\Controllers;

use App\Models\Barrio;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class BarrioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $barrios = Barrio::with(['status'])
                        ->get();
        
        return $barrio;

    }

    /**
     * Listar Barrio por COmuna     
     *
     * @return \Illuminate\Http\Response
     */
    public function barrioComuna($id_comuna)
    {
        $barrios =  Barrio::select('id', 'nb_barrio', 'tx_latitud', 'tx_longitud')
                          ->where('id_comuna', $id_comuna)
                          ->where('id_status', 1)
                          ->orderby('nb_barrio')
                          ->get();

        return $barrios;
    }

    /**
     * Listar Barrio por Zona     
     *
     * @return \Illuminate\Http\Response
     */
    public function barrioZona($id_zona)
    {
        $barrios =  Barrio::whereHas('comuna', function (Builder $query) use ( $id_zona ){
                        $query->where('id_zona', $id_zona);
                    })
                    ->select('id', 'nb_barrio')
                    ->where('id_status', 1)
                    ->orderby('nb_barrio')
                    ->get();

        return $barrios;
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
            'co_barrio'         => 'required',
            'nb_barrio'         => 'required',
            'id_comuna'         => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',
        ]);
    
        $barrio = Barrio::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('barrio') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Barrio  $barrio
     * @return \Illuminate\Http\Response
     */
    public function show(Barrio $barrio)
    {
        return $barrio;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Barrio  $barrio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Barrio $barrio)
    {
        $validate = request()->validate([

            'co_barrio'         => 'required',
            'nb_barrio'         => 'required',
            'id_comuna'         => 'required',
            'tx_latitud'        => 'required',
            'tx_longitud'       => 'required',
            'tx_observaciones'  => 'required',
            'id_status'         => 'required',
            'id_usuario'        => 'required',

        ]);
            
        $barrio = $barrio->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('barrio')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Barrio  $barrio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Barrio $barrio)
    {
        $barrio = $barrio->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('barrio')];

    }
}
