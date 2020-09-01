<?php

namespace App\Http\Controllers;

use App\Models\Permiso;
use App\Models\Menu;
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

    public function permisoPerfilAsignacion($idPerfil)
    {
        $permisos = Permiso::select('id', 'id_menu', 'id_perfil','bo_select','bo_insert','bo_update','bo_delete','bo_admin','bo_default')
                                ->with(['perfil:id,nb_perfil', 'menu:id,nb_menu,tx_icono'])
                                ->where('id_perfil', $idPerfil)
                                ->get();

                            
        $menus  = Menu::whereNotIn('id', $permisos->pluck('id_menu'))
                        ->comboData()
                        ->activo()
                        ->visible()
                        ->orderBy('nu_orden', 'asc')
                        ->get();

        //$permisoPerfil = $this->formatData($permisoPerfil);

        return [ 'permisos' => $permisos, 'menus' => $menus] ;
    }


    function formatData($data)
    {
        $permisoPerfil = [];
        
        foreach ($data as $key => $row) {

            $permisoPerfil[] = [
                'id'         => $row->id,
                'id_perfil'  => $row->id_perfil,
                'nb_permiso' => $row->perfil->nb_permiso,
            ];
        }

        return $permisoPerfil;
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
