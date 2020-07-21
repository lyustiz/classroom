<?php

namespace App\Http\Controllers;

use App\Models\DocenteMateria;
use App\Models\Materia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DocenteMateriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $docenteMateria = DocenteMateria::with(['materia:id,nb_materia'])->get();
                    
        return $docenteMateria;
    }

    public function docenteMateriaDocente($idDocente)
    {
        $docenteMateria = DocenteMateria::select('id','id_docente','id_materia')
                                        ->with(['materia:id,nb_materia'])
                                        ->where('id_docente', $idDocente)
                                        ->get();

        $materia     = Materia::whereNotIn('id', $docenteMateria->pluck('id_materia'))->get();

        $docenteMateria = $this->formatData($docenteMateria);

        return [ 'docenteMateria' => $docenteMateria, 'materia' => $materia] ;
    }


    function formatData($data)
    {
        $docenteMateria = [];
        
        foreach ($data as $key => $row) {

            $docenteMateria[] = [
                'id'         => $row->id,
                'id_materia' => $row->id_materia,
                'nb_materia' => $row->materia->nb_materia,
            ];
        }

        return $docenteMateria;
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
            'id_docente'        => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $docenteMateria = docenteMateria::create($request->all());

        $docenteMateria->materia;

        return [ 'msj' => 'Materia Agregada Correctamente', 'docenteMateria' => $docenteMateria ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DocenteMateria  $docenteMateria
     * @return \Illuminate\Http\Response
     */
    public function show(DocenteMateria $docenteMateria)
    {
        return $docenteMateria;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DocenteMateria  $docenteMateria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DocenteMateria $docenteMateria)
    {
        $validate = request()->validate([
            'id_docente'        => 	'required|integer|max:999999999',
			'id_materia'        => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $docenteMateria = $docenteMateria->update($request->all());

        return [ 'msj' => 'Materia Editada' , compact('docenteMateria')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DocenteMateria  $docenteMateria
     * @return \Illuminate\Http\Response
     */
    public function destroy(DocenteMateria $docenteMateria)
    {
        $docenteMateria = $docenteMateria->delete();
 
        return [ 'msj' => 'Materia Eliminada' , compact('docenteMateria')];
    }
}
