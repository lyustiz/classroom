<?php

namespace App\Http\Controllers;

use App\Models\Asistente;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AsistenteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $asistente = Asistente::with(['menu:id,nb_menu,tx_icono'])
                    ->orderBy('tx_grupo', 'asc')
                    ->orderBy('nu_orden', 'asc')
                    ->get();
        
        return $asistente;
    }

    public function asistentePerfil($nbPerfil)
    {
        $asistente = Asistente::with(['menu:id,nb_menu,tx_icono,tx_ruta'])
                    ->where('tx_grupo', $nbPerfil)
                    ->orderBy('tx_grupo', 'asc')
                    ->orderBy('nu_orden', 'asc')
                    ->get();
        
        return $asistente;
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
            'nb_asistente'      => 	'required|string|max:50',
			'id_menu'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'tx_color'          => 	'nullable|string|max:30',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_grupo'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:300',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $asistente = Asistente::create($request->all());
        
        $this->updateOrden( $asistente->tx_grupo, $asistente->id, $asistente->nu_orden);

        return [ 'msj' => 'Asistente Agregado Correctamente', compact('asistente') ];
    }

    public function updateOrden($grupo, $idAsistente, $nuevoOrden)
    {
        $asistentes = Asistente::where('tx_grupo', $grupo)->orderBy('nu_orden', 'asc')->get();

        $orden = 1;

        foreach ($asistentes as $key => $asistente) {
            
            if($asistente->id == $idAsistente)
            {
                continue;
            }
            
            if($orden == $nuevoOrden)
            {
                $orden++; 
            }

            $asistente->nu_orden = $orden; 
            $asistente->update(); 
            
            $orden++; 
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Asistente  $asistente
     * @return \Illuminate\Http\Response
     */
    public function show(Asistente $asistente)
    {
        return $asistente;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Asistente  $asistente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Asistente $asistente)
    {
        $validate = request()->validate([
            'nb_asistente'      => 	'required|string|max:50',
			'id_menu'           => 	'required|integer|max:999999999',
			'tx_descripcion'    => 	'nullable|string|max:300',
			'tx_color'          => 	'nullable|string|max:30',
			'nu_orden'          => 	'required|integer|max:999999999',
			'tx_grupo'          => 	'nullable|string|max:30',
			'tx_observaciones'  => 	'nullable|string|max:300',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);
        
        $update = $asistente->update($request->all());
        
        $this->updateOrden( $asistente->tx_grupo, $asistente->id, $asistente->nu_orden);

        return [ 'msj' => 'Asistente Editado' , compact('update')];
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Asistente  $asistente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Asistente $asistente)
    {
        
        $grupo = $asistente->tx_grupo;
        $delete = $asistente->delete();
        $this->updateOrden( $grupo, 0, 0);
 
        return [ 'msj' => 'Asistente Eliminado' , compact('delete')];
    }
}
