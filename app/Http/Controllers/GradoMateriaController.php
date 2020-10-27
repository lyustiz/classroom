<?php

namespace App\Http\Controllers;

use App\Models\GradoMateria;
use App\Models\Materia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GradoMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gradoMateria = GradoMateria::with([
                                            'grado:id,nb_grado',
                                            'materia:id,nb_materia',
                                            ])
                    ->orderBy('id_grado', 'asc')
                    ->orderBy('id_materia', 'asc')
                    ->get();
        
        return $gradoMateria;
    }

    public function gradoMateriaAsignacion($idGrado)
    {
        $gradoMateria = GradoMateria::select('id','id_grado','id_materia')
                                        ->with(['materia:id,nb_materia'])
                                        ->where('id_grado', $idGrado)
                                        ->get();

        $materia     = Materia::whereNotIn('id', $gradoMateria->pluck('id_materia'))->get();

        $gradoMateria = $this->formatData($gradoMateria);

        return [ 'gradoMateria' => $gradoMateria, 'materia' => $materia] ;
    }


    function formatData($data)
    {
        $gradoMateria = [];
        
        foreach ($data as $key => $row) {

            $gradoMateria[] = [
                'id'         => $row->id,
                'id_materia' => $row->id_materia,
                'nb_materia' => $row->materia->nb_materia,
            ];
        }

        return $gradoMateria;
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
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $gradoMateria = gradoMateria::create($request->all())->load('materia');

        $gradoMateria->materia;   

        return [ 'msj' => 'Materia Agregada Correctamente', 'gradoMateria' => $gradoMateria  ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GradoMateria  $gradoMateria
     * @return \Illuminate\Http\Response
     */
    public function show(GradoMateria $gradoMateria)
    {
        return $gradoMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GradoMateria  $gradoMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GradoMateria $gradoMateria)
    {
        $validate = request()->validate([
            'id_grado'          => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $gradoMateria = $gradoMateria->update($request->all());

        return [ 'msj' => 'Materia Editada' , compact('gradoMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GradoMateria  $gradoMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(GradoMateria $gradoMateria)
    {
        $gradoMateria = $gradoMateria->delete();
 
        return [ 'msj' => 'Materia Eliminada' , compact('gradoMateria')];
    }
}
