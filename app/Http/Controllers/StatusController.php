<?php

namespace App\Http\Controllers;

use App\Models\Status;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;

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

    public function statusGrupo($coGrupo)
    {
        return Status::where('co_grupo', $coGrupo)
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
            'nb_status'         => 	'required|string|max:20',
			'nb_secundario'     => 	'required|string|max:20',
			'co_status'         => 	'required|string|max:6',
            'co_grupo'          => 	'required|string|max:10',
            'tx_icono'          => 	'nullable|string|max:30',
            'tx_color'          => 	'nullable|string|max:30',
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
            'tx_icono'          => 	'nullable|string|max:30',
            'tx_color'          => 	'nullable|string|max:30',
			'id_padre'          => 	'required|integer',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'bo_activo'         => 	'required|boolean',
			'id_usuario'        => 	'required|integer',
        ]);

        $status = $status->update($request->all());

        return [ 'msj' => 'Status Editado' , compact('status')];
    }


    /**
     * Actualiza el estatus de Cualquier recurso/tabla.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PlanEvaluacion  $planEvaluacion
     * @return \Illuminate\Http\Response
     */
    public function updateResource(Request $request)
    {
        $validate = request()->validate([
            
            'resource'          => 	'required|string|max:64',
            'id'                => 	'required|integer|max:999999999',
            'id_status'         => 	'required|integer|max:999999999',
            'id_usuario'        => 	'required|integer|max:999999999',
            
        ]);

        $tableName    = Str::snake($request->resource);

        $updated = \DB::table($tableName)
                    ->where('id', $request->id)
                    ->update([
                                'id_status'  => $request->id_status,
                                'id_usuario' => $request->id_usuario
                                ]);

        $resourceName = ucwords(implode(' ',preg_split('/(?=[A-Z])/', $request->resource)));
        
        if($updated)   
        {
            $status   =  Status::select('nb_status')->find($request->id_status);
            
            return [ 'msj' => "$resourceName $status->nb_status" , 'updated' => $updated]; 

        } else {

            return  [ 'msj' => "Error al Actualizar el estatus de $resourceName" , 'updated' => $updated];
        }                    
                            
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
