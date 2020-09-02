<?php

namespace App\Http\Controllers;

use App\Models\UsuarioPerfil;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UsuarioPerfilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $usuarioPerfil = UsuarioPerfil::with(['usuario:id,nb_usuario,nb_nombres', 'perfil:id,nb_perfil,tx_icono'])
                    ->get();
        
        return $usuarioPerfil;
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
            'id_usuario'        => 	'required|integer|max:999999999',
			'id_perfil'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario_ed'     => 	'required|integer|max:999999999',
        ]);

        $usuarioPerfil = usuarioPerfil::create($request->all());

        return [ 'msj' => 'UsuarioPerfil Agregado Correctamente', compact('usuarioPerfil') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\UsuarioPerfil  $usuarioPerfil
     * @return \Illuminate\Http\Response
     */
    public function show(UsuarioPerfil $usuarioPerfil)
    {
        return $usuarioPerfil;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UsuarioPerfil  $usuarioPerfil
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UsuarioPerfil $usuarioPerfil)
    {
        $validate = request()->validate([
            'id_usuario'        => 	'required|integer|max:999999999',
			'id_perfil'         => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario_ed'     => 	'required|integer|max:999999999',
        ]);

        $usuarioPerfil = $usuarioPerfil->update($request->all());

        return [ 'msj' => 'UsuarioPerfil Editado' , compact('usuarioPerfil')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UsuarioPerfil  $usuarioPerfil
     * @return \Illuminate\Http\Response
     */
    public function destroy(UsuarioPerfil $usuarioPerfil)
    {
        $usuarioPerfil = $usuarioPerfil->delete();
 
        return [ 'msj' => 'UsuarioPerfil Eliminado' , compact('usuarioPerfil')];
    }
}
