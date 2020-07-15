<?php

namespace App\Http\Controllers;

use App\Models\DocenteGrupo;
use App\Models\Grupo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class DocenteGrupoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $docenteGrupo = DocenteGrupo::with([])
                    ->get();
        
        return $docenteGrupo;
    }

    public function docenteGrupoAsignacion($idDocente)
    {
        $docenteGrupo = DocenteGrupo::select('id','id_docente','id_grupo')
                                        ->with(['grupo:id,nb_grupo'])
                                        ->where('id_docente', $idDocente)
                                        ->get();

        $grupo        = Grupo::whereNotIn('id', $docenteGrupo->pluck('id_grupo'))->get();

        $docenteGrupo = $this->formatData($docenteGrupo);

        return [ 'docenteGrupo' => $docenteGrupo, 'grupo' => $grupo] ;
    }

    public function docenteGrupoDocente($idDocente)
    {
        return Grupo::select('id','nb_grupo')
                    ->whereHas('docente', function (Builder $query) use($idDocente) {
                        $query->where('id_docente', $idDocente);
                    })
                    ->where('id_status', 1)
                    ->get();
    }

    function formatData($data)
    {
        $docenteGrupo = [];
        
        foreach ($data as $key => $row) {

            $docenteGrupo[] = [
                'id'       => $row->id,
                'id_grupo' => $row->id_grupo,
                'nb_grupo' => $row->grupo->nb_grupo,
            ];
        }

        return $docenteGrupo;
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
			'id_grupo'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $docenteGrupo = docenteGrupo::create($request->all());

        $docenteGrupo->grupo;

        return [ 'msj' => 'Grupo Agregada Correctamente', 'docenteGrupo' => $docenteGrupo ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DocenteGrupo  $docenteGrupo
     * @return \Illuminate\Http\Response
     */
    public function show(DocenteGrupo $docenteGrupo)
    {
        return $docenteGrupo;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DocenteGrupo  $docenteGrupo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DocenteGrupo $docenteGrupo)
    {
        $validate = request()->validate([
            'id_docente'        => 	'required|integer|max:999999999',
			'id_grupo'          => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $docenteGrupo = $docenteGrupo->update($request->all());

        return [ 'msj' => 'DocenteGrupo Editado' , compact('docenteGrupo')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DocenteGrupo  $docenteGrupo
     * @return \Illuminate\Http\Response
     */
    public function destroy(DocenteGrupo $docenteGrupo)
    {
        $docenteGrupo = $docenteGrupo->delete();

        return [ 'msj' => 'Grupo Eliminado' , compact('docenteGrupo')];
    }
}
