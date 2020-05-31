<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'guest:api'], function () {

    //registro
    Route::post('register',         'Auth\RegisterController@register');
    Route::post('register-commerce','Auth\RegisterController@registerCommerce');

    // Email Verification
    Route::post('verify',           'UsuarioController@verify');
    Route::post('email/resend',     'UsuarioController@resend');

    //Autenticacion
    Route::post('login',            'Auth\LoginController@login');
    Route::post('recover/password', 'UsuarioController@recoverPassword');
    Route::post('reset/password',   'UsuarioController@resetPassword');

    //Route::post('recaptcha',      'Auth\CaptchaController@checkToken');
});


Route::get('/crud/schemas', 'Crud@schemas');
Route::post('/crud/tables', 'Crud@tables');
Route::post('/crud/generate', 'Crud@generate');



Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('logout',         'Auth\LoginController@logout');


Route::group(['prefix'=>'v1'], function() {

    /* 
    Route::put('/comercio/{comercio}/openclose',      'ComercioController@comercioOpenClose');

     */
Route::apiResource('/barrio',            'BarrioController');
Route::apiResource('/calendario',        'CalendarioController');
Route::apiResource('/calificacion',      'CalificacionController');
Route::apiResource('/ciudad',            'CiudadController');
Route::apiResource('/clase',             'ClaseController');
Route::apiResource('/colegio',           'ColegioController');
Route::apiResource('/comuna',            'ComunaController');
Route::apiResource('/contacto',          'ContactoController');
Route::apiResource('/departamento',      'DepartamentoController');
Route::apiResource('/directiva',         'DirectivaController');
Route::apiResource('/documento',         'DocumentoController');
Route::apiResource('/foto',              'FotoController');
Route::apiResource('/gradoMateria',      'GradoMateriaController');
Route::apiResource('/inasistencia',      'InasistenciaController');
Route::apiResource('/nivel',             'NivelController');
Route::apiResource('/pago',              'PagoController');
Route::apiResource('/pais',              'PaisController');
Route::apiResource('/parentesco',        'ParentescoController');
Route::apiResource('/pariente',          'ParienteController');
Route::apiResource('/periodo',           'PeriodoController');
Route::apiResource('/profesor',          'ProfesorController');
Route::apiResource('/profesorMateria',   'ProfesorMateriaController');
Route::apiResource('/status',            'StatusController');
Route::apiResource('/suscripcion',       'SuscripcionController');
Route::apiResource('/telefono',          'TelefonoController');
Route::apiResource('/tipoColegio',       'TipoColegioController');
Route::apiResource('/tipoDirectiva',     'TipoDirectivaController');
Route::apiResource('/tipoFoto',          'TipoFotoController');
Route::apiResource('/tipoPago',          'TipoPagoController');
Route::apiResource('/tipoTelefono',      'TipoTelefonoController');
Route::apiResource('/tipoUsuario',       'TipoUsuarioController');
Route::apiResource('/usuario',           'UsuarioController');
Route::apiResource('/zona',              'ZonaController');
Route::apiResource('/jornada',           'JornadaController');
Route::apiResource('/cargo',             'CargoController');
Route::apiResource('/turno',             'TurnoController');
Route::apiResource('/horaAcademica',     'HoraAcademicaController');
Route::apiResource('/grado',             'GradoController');
Route::apiResource('/grupoCalificacion', 'GrupoCalificacionController');
Route::apiResource('/calificacion',      'CalificacionController');
Route::apiResource('/tipoCalificacion',  'TipoCalificacionController');
Route::apiResource('/nivelCalificacion', 'NivelCalificacionController');
Route::apiResource('/ubicacion',         'UbicacionController');
Route::apiResource('/estructura',        'EstructuraController');
Route::apiResource('/aula',              'AulaController');
Route::apiResource('/empleado',          'EmpleadoController');
Route::apiResource('/estadoCivil',       'EstadoCivilController');
Route::apiResource('/tipoDocumento',     'TipoDocumentoController');
Route::apiResource('/docente',           'DocenteController');
Route::apiResource('/areaEstudio',       'AreaEstudioController');
Route::apiResource('/grupo',             'GrupoController');
Route::apiResource('/actividad',         'ActividadController');
Route::apiResource('/horario',           'HorarioController');


Route::get('/materia/areaEstudio/{idAreaEstudio}', 'MateriaController@materiaAreaEstudio');
Route::apiResource('/materia',                     'MateriaController', ['parameters' => ['materia' => 'materia']]);


Route::get('/cargaHoraria/horaAcademica/{idHoraAcademica}',      'CargaHorariaController@horaAcademica');
Route::apiResource('/cargaHoraria',      'CargaHorariaController', ['parameters' => ['cargaHoraria' => 'cargaHoraria']]);


Route::apiResource('/actividadCargaHoraria',        'ActividadCargaHorariaController');

Route::get('/alumno/sinGrado',            'AlumnoController@alumnoSinGrado');
Route::get('/alumno/sinGrupo',            'AlumnoController@alumnoSinGrupo');
Route::apiResource('/alumno',            'AlumnoController');


Route::apiResource('/grupoAlumno',     'GrupoAlumnoController');
Route::apiResource('/configuracion',     'ConfiguracionController');
Route::apiResource('/gradoAlumno',     'GradoAlumnoController');
Route::apiResource('/pariente',     'ParienteController');
Route::apiResource('/pariente',     'ParienteController');
Route::apiResource('/pariente',     'ParienteController');
Route::apiResource('/pariente',     'ParienteController');
Route::apiResource('/tipoEvaluacion',     'TipoEvaluacionController');

Route::apiResource('/planEvaluacion',     'PlanEvaluacionController');

Route::get('/detalleEvaluacion/planEvaluacion/{idPlanEvaluacion}',  'DetalleEvaluacionController@detallePlanEvaluacion');
Route::apiResource('/detalleEvaluacion',     'DetalleEvaluacionController');
Route::apiResource('/tipoArchivo',     'TipoArchivoController');


Route::get('/archivo/tipoArchivo/{idTipoArchivo}/origen/{origenId}',     'ArchivoController@archivoTipoOrigen');
Route::apiResource('/archivo',     'ArchivoController');
//newRoutes

});
