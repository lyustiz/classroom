<?php

namespace App\Http\Controllers;

use App\Models\Permiso;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PermisoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $permiso = Permiso::with([])
                    ->get();
        
        return $permiso;
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
            'id_menu'           => 	'required|integer|max:999999999',
			'id_perfil'         => 	'required|integer|max:999999999',
			'bo_select'         => 	'required|boolean',
			'bo_insert'         => 	'required|boolean',
			'bo_update'         => 	'required|boolean',
			'bo_delete'         => 	'required|boolean',
			'bo_admin'          => 	'required|boolean',
			'bo_default'        => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $permiso = permiso::create($request->all());

        return [ 'msj' => 'Permiso Agregado Correctamente', compact('permiso') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Permiso  $permiso
     * @return \Illuminate\Http\Response
     */
    public function show(Permiso $permiso)
    {
        return $permiso;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Permiso  $permiso
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Permiso $permiso)
    {
        $validate = request()->validate([
            'id_menu'           => 	'required|integer|max:999999999',
			'id_perfil'         => 	'required|integer|max:999999999',
			'bo_select'         => 	'required|boolean',
			'bo_insert'         => 	'required|boolean',
			'bo_update'         => 	'required|boolean',
			'bo_delete'         => 	'required|boolean',
			'bo_admin'          => 	'required|boolean',
			'bo_default'        => 	'required|boolean',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $permiso = $permiso->update($request->all());

        return [ 'msj' => 'Permiso Editado' , compact('permiso')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Permiso  $permiso
     * @return \Illuminate\Http\Response
     */
    public function destroy(Permiso $permiso)
    {
        $permiso = $permiso->delete();
 
        return [ 'msj' => 'Permiso Eliminado' , compact('permiso')];
    }
}
