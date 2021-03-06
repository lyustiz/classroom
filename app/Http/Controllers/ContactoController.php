<?php

namespace App\Http\Controllers;

use App\Models\Contacto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ContactoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contacto = Contacto::with([])
                    ->get();
        
        return $contacto;
    }

    public function contactoTipoOrigen( $tipo, $origen )
    {
        $contacto = Contacto::with(['tipoContacto:id,nb_tipo_contacto'])
                            ->where('id_tipo_contacto', $tipo)
                            ->where('id_origen', $origen)
                            ->first();
        
        return $contacto;
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
            'id_tipo_contacto'  => 	'required|integer',
			'id_origen'        => 	'required|integer',
			'tx_email'          => 	'required|string|max:80',
			'tx_sitio_web'      => 	'nullable|string|max:80',
			'tx_facebook'       => 	'nullable|string|max:30',
			'tx_twitter'        => 	'nullable|string|max:30',
			'tx_instagram'      => 	'nullable|string|max:30',
			'tx_youtube'        => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $contacto = contacto::create($request->all());

        return [ 'msj' => 'Contacto Agregado Correctamente', compact('contacto') ];
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
            'id_tipo_contacto'  => 	'required|integer',
			'id_origen'        => 	'required|integer',
			'tx_email'          => 	'required|string|max:80',
			'tx_sitio_web'      => 	'nullable|string|max:80',
			'tx_facebook'       => 	'nullable|string|max:30',
			'tx_twitter'        => 	'nullable|string|max:30',
			'tx_instagram'      => 	'nullable|string|max:30',
			'tx_youtube'        => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $contacto = tap($contacto)->update($request->all());

        return [ 'msj' => 'Contacto Editado' , compact('contacto')];
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
 
        return [ 'msj' => 'Contacto Eliminado' , compact('contacto')];
    }
}
