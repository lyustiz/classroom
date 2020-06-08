<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menu = Menu::with([])
                    ->get();
        
        return $menu;
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
            'nb_menu'           => 	'required|string|max:40',
			'id_modulo'         => 	'nullable|integer|max:999999999',
			'tx_ruta'           => 	'required|string|max:50',
			'tx_path'           => 	'required|string|max:50',
			'tx_icono'          => 	'required|string|max:50',
			'tx_target'         => 	'required|string|max:50',
			'nu_orden'          => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $menu = menu::create($request->all());

        return [ 'msj' => 'Menu Agregado Correctamente', compact('menu') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show(Menu $menu)
    {
        return $menu;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Menu $menu)
    {
        $validate = request()->validate([
            'nb_menu'           => 	'required|string|max:40',
			'id_modulo'         => 	'nullable|integer|max:999999999',
			'tx_ruta'           => 	'required|string|max:50',
			'tx_path'           => 	'required|string|max:50',
			'tx_icono'          => 	'required|string|max:50',
			'tx_target'         => 	'required|string|max:50',
			'nu_orden'          => 	'nullable|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $menu = $menu->update($request->all());

        return [ 'msj' => 'Menu Editado' , compact('menu')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Menu $menu)
    {
        $menu = $menu->delete();
 
        return [ 'msj' => 'Menu Eliminado' , compact('menu')];
    }
}
