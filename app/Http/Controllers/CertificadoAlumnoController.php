<?php

namespace App\Http\Controllers;

use App\Models\CertificadoAlumno;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Builder;

class CertificadoAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return CertificadoAlumno::with([])
                    ->get();
    }

    public function certificadoAlumnoMateria($idAlumno, $idMateria) {
        return  CertificadoAlumno::with([
                    'certificado',
                    'certificado.planEvaluacion.periodo'
                ])
                ->whereHas('certificado', function (Builder $query) use($idMateria) {
                    $query->where('id_materia', $idMateria);
                })
                ->where('id_alumno', $idAlumno)
                ->get();
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
            'id_certificado'    => 	'nullable|string|max:200',
			'id_alumno'         => 	'nullable|string|max:200',
			'fe_aprobacion'     => 	'nullable|string|max:0',
			'tx_codigo'         => 	'nullable|string|max:200',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $certificadoAlumno = certificadoAlumno::create($request->all());

        return [ 'msj' => 'CertificadoAlumno Agregado Correctamente', compact('certificadoAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CertificadoAlumno  $certificadoAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(CertificadoAlumno $certificadoAlumno)
    {
        return $certificadoAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CertificadoAlumno  $certificadoAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CertificadoAlumno $certificadoAlumno)
    {
        $validate = request()->validate([
            'id_certificado'    => 	'nullable|string|max:200',
			'id_alumno'         => 	'nullable|string|max:200',
			'fe_aprobacion'     => 	'nullable|string|max:0',
			'tx_codigo'         => 	'nullable|string|max:200',
			'tx_observaciones'  => 	'nullable|string|max:200',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $certificadoAlumno = $certificadoAlumno->update($request->all());

        return [ 'msj' => 'CertificadoAlumno Editado' , compact('certificadoAlumno')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CertificadoAlumno  $certificadoAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(CertificadoAlumno $certificadoAlumno)
    {
        $certificadoAlumno = $certificadoAlumno->delete();
 
        return [ 'msj' => 'CertificadoAlumno Eliminado' , compact('certificadoAlumno')];
    }
}
