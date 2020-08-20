<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\AgendaResource;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $alumnos  = \DB::table('alumno')->count();
        $docentes = \DB::table('docente')->count();
        $archivos = \DB::table('archivo')->count();
        $fotos    = \DB::table('foto')->count();
        $recursos = \DB::table('recurso')->count();

        return [
            'alumnos'  => $alumnos,
            'docentes' => $docentes,
            'archivos' => $archivos + $fotos + $recursos
        ];
    }

    
    
}
