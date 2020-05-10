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
Route::apiResource('/alumno',          'AlumnoController');
Route::apiResource('/barrio',          'BarrioController');
Route::apiResource('/calendario',      'CalendarioController');
Route::apiResource('/calificacion',    'CalificacionController');
Route::apiResource('/ciudad',          'CiudadController');
Route::apiResource('/clase',           'ClaseController');
Route::apiResource('/colegio',         'ColegioController');
Route::apiResource('/comuna',          'ComunaController');
Route::apiResource('/contacto',        'ContactoController');
Route::apiResource('/departamento',    'DepartamentoController');
Route::apiResource('/directiva',       'DirectivaController');
Route::apiResource('/documento',       'DocumentoController');
Route::apiResource('/foto',            'FotoController');
Route::apiResource('/gradoMateria',    'GradoMateriaController');
Route::apiResource('/grupo',           'GrupoController');
Route::apiResource('/horario',         'HorarioController');
Route::apiResource('/inasistencia',    'InasistenciaController');
Route::apiResource('/nivel',           'NivelController');
Route::apiResource('/pago',            'PagoController');
Route::apiResource('/pais',            'PaisController');
Route::apiResource('/parentesco',      'ParentescoController');
Route::apiResource('/pariente',        'ParienteController');
Route::apiResource('/periodo',         'PeriodoController');
Route::apiResource('/profesor',        'ProfesorController');
Route::apiResource('/profesorMateria', 'ProfesorMateriaController');
Route::apiResource('/status',          'StatusController');
Route::apiResource('/suscripcion',     'SuscripcionController');
Route::apiResource('/telefono',        'TelefonoController');
Route::apiResource('/tipoColegio',     'TipoColegioController');
Route::apiResource('/tipoDirectiva',   'TipoDirectivaController');
Route::apiResource('/tipoFoto',        'TipoFotoController');
Route::apiResource('/tipoPago',        'TipoPagoController');
Route::apiResource('/tipoTelefono',    'TipoTelefonoController');
Route::apiResource('/tipoUsuario',     'TipoUsuarioController');
Route::apiResource('/usuario',         'UsuarioController');
Route::apiResource('/zona',            'ZonaController');
Route::apiResource('/jornada',         'JornadaController');


Route::apiResource('/cargo',     'CargoController');
Route::apiResource('/turno',     'TurnoController');
Route::apiResource('/horaAcademica',     'HoraAcademicaController');
//newRoutes

});
