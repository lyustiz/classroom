<?php

namespace App\Http\Controllers;

use App\Models\GrupoMateria;
use App\Models\Materia;
use App\Models\Grupo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GrupoMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grupoMateria = GrupoMateria::with(['materia:id,nb_materia'])->get();
        
        return $grupoMateria;
    }

    public function grupoMateriaGrupo($idGrupo)
    {
        $grupoMateria = GrupoMateria::select('id','id_grupo','id_materia')
                                        ->with(['materia:id,nb_materia'])
                                        ->where('id_grupo', $idGrupo)
                                        ->get();

        $materia     = Materia::select('id','nb_materia')
                                ->whereHas('grado.grupo', function ($query)  use ($idGrupo){
                                    $query->where('grupo.id', $idGrupo);
                                })
                                ->whereNotIn('id', $grupoMateria->pluck('id_materia'))
                                ->get();

        $grupoMateria = $this->formatData($grupoMateria);

        return [ 'grupoMateria' => $grupoMateria, 'materia' => $materia] ;
    }


    function formatData($data)
    {
        $grupoMateria = [];
        
        foreach ($data as $key => $row) {

            $grupoMateria[] = [
                'id'         => $row->id,
                'id_materia' => $row->id_materia,
                'nb_materia' => $row->materia->nb_materia,
            ];
        }

        return $grupoMateria;
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
            'id_grupo'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupoMateria = grupoMateria::create($request->all());

        $grupoMateria->materia;

        return [ 'msj' => 'Materia Agregada Correctamente', 'grupoMateria' => $grupoMateria ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GrupoMateria  $grupoMateria
     * @return \Illuminate\Http\Response
     */
    public function show(GrupoMateria $grupoMateria)
    {
        return $grupoMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GrupoMateria  $grupoMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GrupoMateria $grupoMateria)
    {
        $validate = request()->validate([
            'id_grupo'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $grupoMateria = $grupoMateria->update($request->all());

        return [ 'msj' => 'Materia Editada' , compact('grupoMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GrupoMateria  $grupoMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(GrupoMateria $grupoMateria)
    {
        $grupoMateria = $grupoMateria->delete();
 
        return [ 'msj' => 'Materia Eliminada' , compact('grupoMateria')];
    }
}
