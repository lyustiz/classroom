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

    //Autenticacion
    Route::post('login',            'Auth\LoginController@login');
    Route::post('recover/password', 'UsuarioController@recoverPassword');
    Route::post('reset/password',   'UsuarioController@resetPassword');

});


Route::get('/crud/schemas', 'Crud@schemas');
Route::post('/crud/tables', 'Crud@tables');
Route::post('/crud/generate', 'Crud@generate');



Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('logout',         'Auth\LoginController@logout');


Route::group(['prefix'=>'v1'], function() {

// -- DATOS MAESTROS -- //
Route::apiResource('/status',               'StatusController');
Route::apiResource('/tipoColegio',          'TipoColegioController');
Route::apiResource('/calendario',           'CalendarioController');
Route::apiResource('/turno',                'TurnoController');
Route::apiResource('/jornada',              'JornadaController');
Route::apiResource('/tipoDirectiva',        'TipoDirectivaController');
Route::apiResource('/tipoPago',             'TipoPagoController');
Route::apiResource('/telefono',             'TelefonoController');
Route::apiResource('/tipoTelefono',         'TipoTelefonoController');
Route::apiResource('/tipoDocumento',        'TipoDocumentoController');
Route::apiResource('/documento',            'DocumentoController');
Route::apiResource('/ubicacion',            'UbicacionController');
Route::apiResource('/estadoCivil',          'EstadoCivilController');

// -- COLEGIO -- //
Route::put('/colegio/location/{colegio}',   'ColegioController@location');
Route::get('/colegio/usuario/{idUsuario}',  'ColegioController@colegioUsuario');
Route::apiResource('/colegio',              'ColegioController');
Route::get('/contacto/tipo/{tipo}/origen/{origen}',  'ContactoController@contactoTipoOrigen');
Route::apiResource('/contacto',             'ContactoController');
Route::apiResource('/suscripcion',          'SuscripcionController');
Route::apiResource('/pago',                 'PagoController');
Route::apiResource('/estructura',           'EstructuraController');
Route::apiResource('/aula',                 'AulaController');
Route::apiResource('/cargo',                'CargoController');
Route::apiResource('/directiva',            'DirectivaController');
Route::apiResource('/empleado',             'EmpleadoController');

// -- LOCATION -- //
Route::apiResource('/pais',                 'PaisController');
Route::apiResource('/departamento',         'DepartamentoController');
Route::get('/ciudad/departamento/{departamento}',  'CiudadController@ciudadDepartamento');
Route::apiResource('/ciudad',               'CiudadController');
Route::get('/comuna/ciudad/{ciudad}',       'ComunaController@comunaCiudad');
Route::apiResource('/comuna',               'ComunaController');
Route::get('/zona/comuna/{comuna}',         'ZonaController@zonaComuna');
Route::apiResource('/zona',                 'ZonaController');
Route::get('/barrio/zona/{zona}',           'BarrioController@barrioZona');
Route::apiResource('/barrio',               'BarrioController');

// -- ALUMNO -- //
Route::get('/alumno/sinGrado',              'AlumnoController@alumnoSinGrado');
Route::get('/alumno/sinGrupo',              'AlumnoController@alumnoSinGrupo');
Route::apiResource('/alumno',               'AlumnoController');
Route::apiResource('/pariente',             'ParienteController');
Route::apiResource('/parentesco',           'ParentescoController');
Route::apiResource('/grupoAlumno',          'GrupoAlumnoController');
Route::apiResource('/gradoAlumno',          'GradoAlumnoController');

// -- DOCENTE -- //
Route::apiResource('/docente',              'DocenteController');
Route::get('/docenteMateria/docente/{docente}', 'DocenteMateriaController@docenteMateriaDocente');
Route::apiResource('/docenteMateria',       'DocenteMateriaController', ['parameters' => ['docenteMateria' => 'docenteMateria']]);
Route::get('/docenteGrupo/docente/{docente}',   'DocenteGrupoController@docenteGrupoDocente');
Route::apiResource('/docenteGrupo',         'DocenteGrupoController');

// -- GESTION ACADEMICA -- //
Route::apiResource('/periodo',              'PeriodoController');
Route::apiResource('/nivel',                'NivelController');
Route::apiResource('/grado',                'GradoController');
Route::apiResource('/grupo',                'GrupoController');
Route::apiResource('/areaEstudio',          'AreaEstudioController');
Route::get('/materia/areaEstudio/{AreaEstudio}', 'MateriaController@materiaAreaEstudio');
Route::apiResource('/materia',              'MateriaController', ['parameters' => ['materia' => 'materia']]);
Route::apiResource('/clase',                'ClaseController');
Route::apiResource('/calificacion',         'CalificacionController');
Route::apiResource('/tipoCalificacion',     'TipoCalificacionController');
Route::apiResource('/nivelCalificacion',    'NivelCalificacionController');
Route::apiResource('/gradoMateria',         'GradoMateriaController');
Route::apiResource('/inasistencia',         'InasistenciaController'); //TODO: ASISTENCIA
Route::apiResource('/grupoCalificacion',    'GrupoCalificacionController');

// -- HORARIO -- //
Route::apiResource('/horaAcademica',        'HoraAcademicaController');
Route::get('/cargaHoraria/horaAcademica/{idHoraAcademica}',  'CargaHorariaController@horaAcademica');
Route::apiResource('/cargaHoraria',         'CargaHorariaController', ['parameters' => ['cargaHoraria' => 'cargaHoraria']]);
Route::apiResource('/actividadCargaHoraria','ActividadCargaHorariaController');
Route::apiResource('/actividad',            'ActividadController');
Route::apiResource('/horario',              'HorarioController');

// -- PLAN EVALUACION -- //
Route::apiResource('/tipoEvaluacion',       'TipoEvaluacionController');
Route::apiResource('/planEvaluacion',       'PlanEvaluacionController');
Route::get('/detalleEvaluacion/planEvaluacion/{idPlanEvaluacion}',  'DetalleEvaluacionController@detallePlanEvaluacion');
Route::get('/planEvaluacion/grupo/{grupo}/periodo/{periodo}', 'PlanEvaluacionController@planEvaluacionGrupoPeriodo');
Route::apiResource('/detalleEvaluacion',    'DetalleEvaluacionController');

// -- FOTOS / ARCHIVOS -- //
Route::get('/foto/tipoFoto/{idTipoFoto}/origen/{origenId}',          'FotoController@fotoTipoOrigen');
Route::apiResource('/foto',                 'FotoController');
Route::apiResource('/tipoFoto',             'TipoFotoController');

Route::get('/archivo/tipoArchivo/{idTipoArchivo}/origen/{origenId}', 'ArchivoController@archivoTipoOrigen');
Route::apiResource('/archivo',              'ArchivoController');
Route::apiResource('/tipoArchivo',          'TipoArchivoController');

// --  CONFIGURACION  -- //
Route::apiResource('/configuracion',        'ConfiguracionController');

// -- GESTION USUARIO -- //
Route::apiResource('/tipoUsuario',          'TipoUsuarioController');
Route::apiResource('/usuario',              'UsuarioController');

Route::apiResource('/tipoContacto',         'TipoContactoController');
Route::apiResource('/menu',                 'MenuController');
Route::apiResource('/perfil',               'PerfilController');
Route::apiResource('/permiso',              'PermisoController');
Route::apiResource('/usuarioPerfil',        'UsuarioPerfilController');
Route::apiResource('/modulo',               'ModuloController');
Route::apiResource('/menu',                 'MenuController');
Route::apiResource('/modulo',               'ModuloController');
Route::apiResource('/menu',                 'MenuController');

Route::apiResource('/feriado',     'FeriadoController');
Route::apiResource('/tipoFeriado',     'TipoFeriadoController');
Route::apiResource('/tipoFeriado',     'TipoFeriadoController');
Route::apiResource('/feriado',     'FeriadoController');
Route::apiResource('/feriado',     'FeriadoController');
Route::apiResource('/tipoAgenda',     'TipoAgendaController');
Route::apiResource('/agenda',     'AgendaController');
Route::apiResource('/tipoActividad',     'TipoActividadController');
//newRoutes

});
