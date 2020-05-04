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
//registro



Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('logout',         'Auth\LoginController@logout');


Route::group(['prefix'=>'v1'], function() {

    Route::post('/comercio/info',           'ComercioController@comercioInfo');
    Route::put('/comercio/info',            'ComercioController@comercioInfoUpdate');
    Route::put('/comercio/location',        'ComercioController@comercioLocation');
    Route::post('/comercio/search',         'ComercioController@comercioSearch');
    Route::put('/comercio/{comercio}/openclose',      'ComercioController@comercioOpenClose');
    
    Route::apiResource('/usuario',          'UsuarioController');
    Route::apiResource('/status',           'StatusController');
    Route::apiResource('/pais',             'PaisController', ['parameters' => ['pais' => 'pais']]);
    Route::apiResource('/departamento',     'DepartamentoController');
    Route::apiResource('/ciudad',           'CiudadController');
    Route::apiResource('/zona',             'ZonaController');
    Route::apiResource('/comuna',           'ComunaController');
    Route::apiResource('/barrio',           'BarrioController');
    Route::apiResource('/tipoUsuario',      'TipoUsuarioController');
    Route::apiResource('/tipoServicio',     'TipoServicioController');
    Route::apiResource('/tipoFoto',         'TipoFotoController');
    Route::apiResource('/tipoPago',         'TipoPagoController');
    Route::apiResource('/tipoTelefono',     'TipoTelefonoController');
    Route::apiResource('/categoria',        'CategoriaController', ['parameters' => ['categoria' => 'categoria']]);
    Route::apiResource('/tipoComercio',     'TipoComercioController');
    Route::apiResource('/comercio',         'ComercioController');
    Route::apiResource('/comercioCategoria','ComercioCategoriaController', ['parameters' => ['comercioCategoria' => 'comercioCategoria']]);
    Route::apiResource('/telefono',         'TelefonoController');
    Route::apiResource('/horario',          'HorarioController');
    Route::apiResource('/contacto',         'ContactoController');
    Route::apiResource('/foto',             'FotoController');
    Route::apiResource('/pago',             'PagoController');
    Route::apiResource('/subcripcion',      'SubcripcionController');
    Route::apiResource('/valoracion',       'ValoracionController');

    Route::get('/comuna/zona/{id_zona}',             'ComunaController@comunaZona');
    
    Route::get('/barrio/zona/{id_zona}',             'BarrioController@barrioZona');
    Route::get('/barrio/comuna/{id_comuna}',         'BarrioController@barrioComuna');

    Route::get('/comercio/categoria/{id_categoria}/{tipoDespacho}', 'ComercioController@comercioCategoria');
    Route::get('/comercio/barrio/{id_barrio}',       'ComercioController@comercioBarrio');
    Route::get('/comercio/usuario/{id_usuario}',     'ComercioController@comercioUsuario');

    Route::get('/valoracion/comercio/{id_comercio}/{id_usuario}', 'ValoracionController@valoracionComercio');

    Route::put('/usuario/email/{usuario}',           'UsuarioController@updateEmail');
    Route::put('/usuario/password/{usuario}',        'UsuarioController@updatePassword');
    
    

});
