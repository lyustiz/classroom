<?php

namespace App\Http\Controllers;

use App\Models\Status;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $status = Status::with([])
                    ->get();
        
        return $status;
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
            'nb_status'         => 	'required|string|max:20',
			'nb_secundario'     => 	'required|string|max:20',
			'co_status'         => 	'required|string|max:6',
			'co_grupo'          => 	'required|string|max:10',
			'id_padre'          => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'bo_activo'         => 	'required|boolean',
			'id_usuario'        => 	'required|integer',
        ]);

        $status = status::create($request->all());

        return [ 'msj' => 'Status Agregado Correctamente', compact('status') ];
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
            'nb_status'         => 	'required|string|max:20',
			'nb_secundario'     => 	'required|string|max:20',
			'co_status'         => 	'required|string|max:6',
			'co_grupo'          => 	'required|string|max:10',
			'id_padre'          => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'bo_activo'         => 	'required|boolean',
			'id_usuario'        => 	'required|integer',
        ]);

        $status = $status->update($request->all());

        return [ 'msj' => 'Status Editado' , compact('status')];
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
 
        return [ 'msj' => 'Status Eliminado' , compact('status')];
    }
}
