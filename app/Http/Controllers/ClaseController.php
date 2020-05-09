<?php

namespace App\Http\Controllers;

use App\Models\Clase;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ClaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clase = Clase::with([])
                    ->get();
        
        return $clase;
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
            'id_grado_materia'  => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'id_profesor'       => 	'required|integer',
			'fe_clase'          => 	'required|string|max:0',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $clase = clase::create($request->all());

        return [ 'msj' => 'Clase Agregado Correctamente', compact('clase') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function show(Clase $clase)
    {
        return $clase;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Clase $clase)
    {
        $validate = request()->validate([
            'id_grado_materia'  => 	'required|integer',
			'id_grupo'          => 	'required|integer',
			'id_profesor'       => 	'required|integer',
			'fe_clase'          => 	'required|string|max:0',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer',
			'id_usuario'        => 	'required|integer',
        ]);

        $clase = $clase->update($request->all());

        return [ 'msj' => 'Clase Editado' , compact('clase')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Clase  $clase
     * @return \Illuminate\Http\Response
     */
    public function destroy(Clase $clase)
    {
        $clase = $clase->delete();
 
        return [ 'msj' => 'Clase Eliminado' , compact('clase')];
    }
}
