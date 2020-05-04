<?php

namespace App\Http\Controllers;

use App\Models\Contacto;
use Illuminate\Http\Request;

class ContactoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contactos = Contacto::with(['status'])
                             ->get();
        
        return $contactos;
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
            
            'id_comercio'       => 'required|integer',
            'tx_email'          => 'bail|email|required|max:80',
            'tx_sitio_web'      => 'nullable|max:80',
            'tx_facebook'       => 'nullable|max:30',
            'tx_twitter'        => 'nullable|max:30',
            'tx_instagram'      => 'nullable|max:30',
            'tx_youtube'        => 'nullable|max:30',
            'tx_observaciones'  => 'nullable|max:30',
            'id_usuario'        => 'required|integer',
            
        ]);

        $request->merge(['id_status' => 1]);

        $contacto = Contacto::create($request->all());

        return [ 'msj' => 'Registro Agregado Correctamente', 'contacto' =>  $contacto];
    
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Contacto  $contacto
     * @return \Illuminate\Http\Response
     */
    public function show(Contacto $contacto)
    {
        return $contacto;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Contacto  $contacto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Contacto $contacto)
    {
        $validate = request()->validate([

            'id_comercio'       => 'required',
            'tx_email'          => 'bail|email|required',
            'tx_sitio_web'      => 'nullable',
            'tx_facebook'       => 'nullable',
            'tx_twitter'        => 'nullable',
            'tx_instagram'      => 'nullable',
            'tx_youtube'        => 'nullable',
            'tx_observaciones'  => 'nullable',
            'id_usuario'        => 'required',

        ]);
        
        $contacto = $contacto->update($request->all());

        return [ 'msj' => 'Informacion de Contacto Actualizada' , compact('contacto')];
    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Contacto  $contacto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Contacto $contacto)
    {
        $contacto = $contacto->delete();
 
        return [ 'msj' => 'Registro Eliminado' , compact('contacto')];

    }
}
