<?php

namespace App\Http\Controllers;

use App\Models\Certificado;
use App\Models\CertificadoPlantilla;
use App\Models\CertificadoAlumno;
use App\Models\Alumno;
use App\Models\PlanEvaluacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Storage;


class CertificadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Certificado::with([])
                    ->get();
    }

    public function certificadoGrupoMateria($idGrupo, $idMateria) {
        $certificado =  Certificado::with([
                            'certificadoAlumno:id,id_status,id_certificado,id_alumno'
                        ])
                        ->whereHas('planEvaluacion', function (Builder $query) use($idMateria, $idGrupo) {
                            $query->where('id_materia', $idMateria)
                                  ->where('id_grupo', $idGrupo)
                                  ->activo();
                        })
                        ->where('id_grupo', $idGrupo)
                        ->where('id_materia', $idMateria)
                        ->first();

        if( !$certificado ) {
            $certificado = CertificadoPlantilla::select(
                'tx_linea1','tx_linea2','tx_linea3','tx_observaciones'
            )->first();
        }

        return $certificado;
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
			'id_materia'        => 	'nullable|integer|max:999999999',
			'tx_linea1'         => 	'nullable|string|max:200',
			'tx_linea2'         => 	'nullable|string|max:200',
			'tx_linea3'         => 	'nullable|string|max:200',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $planEvaluacion = PlanEvaluacion::select('id')
                                        ->where([
                                            'id_grupo'   => $request->id_grupo,
                                            'id_materia' => $request->id_materia  
                                        ])->first();

        $txPath = 'base2.jpg';                              

        $request->merge([ 'id_plan_evaluacion' =>  $planEvaluacion->id,  'tx_path' => $txPath ]);

        $certificado = Certificado::create($request->all());

        $alumnos     = $this->certificadoAlumnos($certificado);

        return [ 'msj' => 'Certificado Generado Correctamente', 'certificado' => $certificado, 'certificadosAlumnos' => $alumnos  ];
    }


    public function certificadoAlumnos($certificado)
    {
        $certificadoAlumnos = [];

        $alumnos = Alumno::select('id')
                            ->whereHas('grupo', function (Builder $query) use($certificado) {
                                $query->where('id_grupo', $certificado->id_grupo);
                            })
                            ->get()
                            ->pluck('id');

        $codigo  =  str_pad($certificado->id, 5, "0", STR_PAD_LEFT) . '-' .  date('Y-m')  . '-';

        foreach ( $alumnos as $idAlumno) 
        {
            $certificadoAlumnos[] = [
                                    'id_certificado' => $certificado->id, 
                                    'id_alumno'      => $idAlumno,
                                    'fe_aprobacion'  => date('Y-m-d'),
                                    'tx_codigo'      => $codigo . $idAlumno,
                                    'id_usuario'     => $certificado->id_usuario,
                                    'id_status'      => 1,
                                    'created_at'     => date('Y-m-d H:i:s'),
                                ];
        }

        if(CertificadoAlumno::insert($certificadoAlumnos))
        {
           return  CertificadoAlumno::select('id', 'id_alumno', 'id_status')
                                    ->where('id_certificado', $certificado->id)
                                    ->get();
        }

        return [];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Certificado  $certificado
     * @return \Illuminate\Http\Response
     */
    public function show(Certificado $certificado)
    {
        return $certificado;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Certificado  $certificado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Certificado $certificado)
    {
        $validate = request()->validate([
			'tx_linea1'         => 	'nullable|string|max:200',
			'tx_linea2'         => 	'nullable|string|max:200',
			'tx_linea3'         => 	'nullable|string|max:200',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $certificado = $certificado->update($request->all());

        return [ 'msj' => 'Certificado Editado' , compact('certificado')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Certificado  $certificado
     * @return \Illuminate\Http\Response
     */
    public function destroy(Certificado $certificado)
    {
        $certificado = $certificado->delete();
 
        return [ 'msj' => 'Certificado Eliminado' , compact('certificado')];
    }
}
