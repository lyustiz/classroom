<?php

namespace App\Http\Controllers;

use App\Models\Status;
use Illuminate\Http\Request;

class StatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $statuss = Status::with(['usuario:id,nb_usuario'])
                        ->get();
        
        return $statuss;

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

            'nb_status'         => 'required',
            'nb_secundario'     => 'required',
            'co_status'         => 'required',
            'co_grupo'          => 'required',
            'id_padre'          => 'required',
            'tx_observaciones'  => 'required',
            'bo_activo'         => 'required',
            'id_usuario'        => 'required',
            
        ]);

        $status = Status::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', compact('status') ];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Status  $status
     * @return \Illuminate\Http\Response
     */
    public function show(Status $status)
    {
        return $status;

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Status  $status
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Status $status)
    {
        $validate = request()->validate([
            
            'nb_status'         => 'required',
            'nb_secundario'     => 'required',
            'co_status'         => 'required',
            'co_grupo'          => 'required',
            'id_padre'          => 'required',
            'tx_observaciones'  => 'required',
            'bo_activo'         => 'required',
            'id_usuario'        => 'required',

        ]);
        
        $status = $status->update($request->all());

        return [ 'msj' => 'Registro Editado' , compact('status')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Status  $status
     * @return \Illuminate\Http\Response
     */
    public function destroy(Status $status)
    {
        $status = $status->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('status')];

    }
}
