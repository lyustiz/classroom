<?php

namespace App\Http\Controllers;

use App\Models\PruebaAlumno;
use App\Models\RespuestaAlumno;
use App\Models\Calificacion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;
use Carbon\Carbon;

class PruebaAlumnoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pruebaAlumno = PruebaAlumno::with([])
                    ->get();
        
        return $pruebaAlumno;
    }

    public function pruebaAlumnoPrueba($idPrueba)
    {
        return  PruebaAlumno::with(['prueba'])
                            ->where('id_prueba', $idPrueba)
                            ->get();
    }

    public function pruebaAlumnoAlumno($idAlumno)
    {
        return  PruebaAlumno::with(['prueba'])
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
            'id_prueba'         => 	'required|integer|max:999999999',
            'id_alumnos'         => 'required|array',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $pruebaAlumno = [];

        foreach ($request->id_alumnos as $key => $id_alumno) 
        {
            $pruebaAlumno[] = PruebaAlumno::firstOrCreate(
                ['id_prueba'  => $request->id_prueba,  'id_alumno' => $id_alumno],
                ['id_usuario' => $request->id_usuario, 'id_status' => 1]
            ); 
        }

        return [ 'msj' => 'Alumno(s) Agregado(s) Correctamente', compact('pruebaAlumno') ];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PruebaAlumno  $pruebaAlumno
     * @return \Illuminate\Http\Response
     */
    public function show(PruebaAlumno $pruebaAlumno)
    {
        return $pruebaAlumno;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PruebaAlumno  $pruebaAlumno
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PruebaAlumno $pruebaAlumno)
    {
        $validate = request()->validate([
            'id_prueba'         => 	'required|integer|max:999999999',
            'id_alumno'         => 	'required|integer|max:999999999',
			'fe_prueba'         => 	'required|string|max:0',
			'hh_inicio'         => 	'required|string|max:0',
			'hh_fin'            => 	'required|string|max:0',
			'nu_calificacion'   => 	'required|integer|max:999999999',
			'tx_observaciones'  => 	'nullable|string|max:100',
			'id_status'         => 	'required|integer|max:999999999',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        $request->merge(['id_status' => 1]);

        $pruebaAlumno = $pruebaAlumno->update($request->all());

        return [ 'msj' => 'Alumnos Actualizados' , compact('pruebaAlumno')];
    }

    
    public function iniciar(Request $request, PruebaAlumno $pruebaAlumno)
    {
        $validate = request()->validate([
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);

        if($pruebaAlumno->id_status > 5)
        {
            throw ValidationException::withMessages(['status' => 'La prueba ya ha sido ejecutada']);
        }
 
        $date = Carbon::now();

        if($pruebaAlumno->id_status < 5)
        {
            $request->merge([
                'fe_prueba'  => $date->toDateString(),
                'hh_inicio'  => $date->toTimeString(),
                'id_status'  => 5,
            ]);

            $nu_minutos = $pruebaAlumno->prueba->nu_minutos;

        } else {

            $fechaActual  = Carbon::now();
            $fechaInicio  = new Carbon($pruebaAlumno->fe_prueba. ' ' . $pruebaAlumno->hh_inicio);
            $nu_minutos   = $fechaActual->diffInMinutes($fechaInicio);
        }

        $update = $pruebaAlumno->update($request->all());
        
        return [ 'msj' => 'Prueba Iniciada' ,  'nu_minutos' => $nu_minutos];
    }


    public function finalizar(Request $request, PruebaAlumno $pruebaAlumno)
    {
        $validate = request()->validate([
			'id_usuario'   => 	'required|integer|max:999999999',
        ]);

        $date = Carbon::now();

        $request->merge([
            'hh_fin'       =>   $date->toTimeString(),
            'id_status'    => 6
        ]);

        $pruebaAlumno = $pruebaAlumno->update($request->all());

        return [ 'msj' => 'Prueba Finalizada' , compact('pruebaAlumno')];
    }

    public function evaluar(Request $request, PruebaAlumno $pruebaAlumno)
    {
        $validate = request()->validate([
            'id_usuario'   => 	'required|integer|max:999999999',
            'respuestas'   =>   'nullable|array',
        ]);

        $respuestas = RespuestaAlumno::where('id_alumno', $pruebaAlumno->id_alumno)
                                     ->where('id_prueba', $pruebaAlumno->id_prueba)
                                     ->get(); 

        $nuCalificacion = 0;
      
        foreach ($respuestas as $key => $repuesta) 
        {
            $idxEvaluada  = array_search($repuesta->id, array_column($request->respuestas, 'id'));
            
            if($idxEvaluada !== false)
            {
                $valorEvaluada = $request->respuestas[$idxEvaluada]['value'];
                $repuesta->update(['nu_valor' => $valorEvaluada ]);
            }

            $nuCalificacion += ($repuesta->nu_valor !== null) ?  $repuesta->nu_valor : 0;
        }
       
        $calificacion   =  Calificacion::where('nu_calificacion', '>=', (round($nuCalificacion, 0, PHP_ROUND_HALF_UP )) )->first(); //TODO grupo calificacion
        
        $request->merge([
            'nu_calificacion' => $nuCalificacion,
            'id_calificacion' => $calificacion->id,
            'id_status'       => 7
        ]);
      
        $pruebaAlumno = $pruebaAlumno->update($request->except('respuestas'));

        return [ 'msj' => 'Prueba Evaluada' , compact('pruebaAlumno','calificacion')];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PruebaAlumno  $pruebaAlumno
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $validate = request()->validate([
            'id_prueba_alumno'  => 	'required|array',
			'id_usuario'        => 	'required|integer|max:999999999',
        ]);
        
        $pruebaAlumno = PruebaAlumno::destroy($request->id_prueba_alumno);
 
        return [ 'msj' => 'Alumno(s) Eliminado(s)' , compact('pruebaAlumno')]; 
    }
}
