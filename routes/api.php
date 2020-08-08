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


Route::group(['prefix'=>'v1'], function() 
{

// -- GRAL -- //
Route::apiResource('/home',                 'HomeController');

// -- DATOS MAESTROS -- //
Route::put('/status/resource',                  'StatusController@updateResource');
Route::apiResource('/status',                   'StatusController');
Route::apiResource('/tipoColegio',              'TipoColegioController');
Route::apiResource('/calendario',               'CalendarioController');
Route::apiResource('/turno',                    'TurnoController');
Route::apiResource('/jornada',                  'JornadaController');
Route::apiResource('/tipoContacto',             'TipoContactoController');
Route::apiResource('/tipoDirectiva',            'TipoDirectivaController');
Route::apiResource('/tipoPago',                 'TipoPagoController');
Route::apiResource('/telefono',                 'TelefonoController');
Route::apiResource('/tipoTelefono',             'TipoTelefonoController');
Route::apiResource('/tipoDocumento',            'TipoDocumentoController');
Route::apiResource('/documento',                'DocumentoController');
Route::apiResource('/ubicacion',                'UbicacionController');
Route::apiResource('/estadoCivil',              'EstadoCivilController');

// -- COLEGIO -- //
Route::put('/colegio/location/{colegio}',       'ColegioController@location');
Route::get('/colegio/usuario/{idUsuario}',      'ColegioController@colegioUsuario');
Route::apiResource('/colegio',                  'ColegioController');
Route::get('/contacto/tipo/{tipo}/origen/{origen}',  'ContactoController@contactoTipoOrigen');
Route::apiResource('/contacto',                 'ContactoController');
Route::apiResource('/suscripcion',              'SuscripcionController');
Route::apiResource('/pago',                     'PagoController');
Route::apiResource('/estructura',               'EstructuraController');
Route::apiResource('/aula',                     'AulaController');
Route::apiResource('/cargo',                    'CargoController');
Route::apiResource('/directiva',                'DirectivaController');
Route::apiResource('/empleado',                 'EmpleadoController');

// -- LOCATION -- //
Route::apiResource('/pais',                     'PaisController');
Route::apiResource('/departamento',             'DepartamentoController');
Route::get('/ciudad/departamento/{departamento}',     'CiudadController@ciudadDepartamento');
Route::apiResource('/ciudad',                   'CiudadController');
Route::get('/comuna/ciudad/{ciudad}',           'ComunaController@comunaCiudad');
Route::apiResource('/comuna',                   'ComunaController');
Route::get('/zona/comuna/{comuna}',             'ZonaController@zonaComuna');
Route::apiResource('/zona',                     'ZonaController');
Route::get('/barrio/zona/{zona}',               'BarrioController@barrioZona');
Route::apiResource('/barrio',                   'BarrioController');

// -- ALUMNO -- //
Route::get('/alumno/{alumno}/partners',         'AlumnoController@alumnoPartners');
Route::get('/alumno/{alumno}/materias/docentes',       'AlumnoController@alumnoMateriasDocentes');
Route::get('/alumno/grupo/{grupo}/materia/{materia}',  'AlumnoController@alumnoGrupoMateria');
Route::get('/alumno/prueba/{prueba}/grupo/{grupo}/materia/{materia}',  'AlumnoController@alumnoPruebaGrupoMateria');
Route::get('/alumno/grupo/{grupo}',             'AlumnoController@alumnoGrupo');
Route::get('/alumno/sinGrado',                  'AlumnoController@alumnoSinGrado');
Route::get('/alumno/sinGrupo',                  'AlumnoController@alumnoSinGrupo');
Route::get('/alumno/pariente/{pariente}',       'AlumnoController@alumnoPariente');
Route::get('/alumno/matriculado/pariente/{pariente}',  'AlumnoController@alumnoMatriculadoPariente');
Route::post('/alumno/asignacion/search',        'AlumnoController@alumnoSearch');
Route::apiResource('/alumno',                   'AlumnoController');

Route::apiResource('/tipoCondicion',            'TipoCondicionController');
Route::apiResource('/matricula',                'MatriculaController');

// -- PARIENTE -- //
Route::apiResource('/parentesco',               'ParentescoController');
Route::get('/pariente/alumno/{alumno}',         'ParienteController@parienteAlumno');
Route::post('/pariente/asignacion/search',      'ParienteController@parienteSearch');
Route::post('/pariente/alumno/{alumno}',        'ParienteController@storeByAlumno');
Route::delete('/pariente/{pariente}/alumno/{alumno}',   'ParienteController@destroyByAlumno');
Route::apiResource('/pariente',                 'ParienteController');
Route::apiResource('/alumnoPariente',           'AlumnoParienteController');

// -- SANCIONES -- //
Route::get('/incidencia/alumno/{alumno}',       'IncidenciaController@incidenciaAlumno');
Route::apiResource('/incidencia',               'IncidenciaController',   ['parameters' => ['incidencia' => 'incidencia']]);
Route::apiResource('/tipoFalta',                'TipoFaltaController',     ['parameters' => ['tipoFalta' => 'tipoFalta']]);
Route::apiResource('/tipoSancion',              'TipoSancionController');

Route::get('/alumnoMateria/alumno/{alumno}/grado/{grado}', 'AlumnoMateriaController@alumnoMateriaAlumnoGrado');
Route::post('/alumnoMateria/storeAll',          'AlumnoMateriaController@storeAll');
Route::apiResource('/alumnoMateria',            'AlumnoMateriaController', ['parameters' => ['alumnoMateria' => 'alumnoMateria']]);

// -- DOCENTE -- //
Route::get('/docente/materia/{materia}',        'DocenteController@docenteMateria');
Route::apiResource('/docente',                  'DocenteController');
Route::get('/docenteMateria/docente/{docente}', 'DocenteMateriaController@docenteMateriaDocente');
Route::apiResource('/docenteMateria',           'DocenteMateriaController', ['parameters' => ['docenteMateria' => 'docenteMateria']]);

// -- GESTION ACADEMICA -- //
Route::GET('/periodo/calendario/{calendario}',  'PeriodoController@periodoCalendario');
Route::get('/periodo/list',                     'PeriodoController@list');
Route::apiResource('/periodo',                  'PeriodoController');
Route::apiResource('/nivel',                    'NivelController');
Route::get('/grado/planEvaluacion/docente/{docente}/periodo/{periodo}', 'GradoController@gradoPlanEvaluacionDocentePeriodo');
Route::get('/grado/planEvaluacion/docente/{docente}',    'GradoController@GradoPlanEvaluacionDocente');
Route::get('/grado/grupo/docente/{docente}',    'GradoController@gradoGrupoDocente');
Route::get('/grado/materia/docente/{docente}',  'GradoController@gradoMateriaDocente');
Route::get('/grado/MateriaAlumno',              'GradoController@gradoMateriaAlumno');
Route::get('/grado/planEvaluacion',             'GradoController@gradoPlanEvaluacion');
Route::get('/grado/list',                       'GradoController@list');
Route::apiResource('/grado',                    'GradoController');

Route::get('/grupo/grado/{grado}',              'GrupoController@grupoGrado');
Route::get('/grupo/alumnos/docente/{docente}',  'GrupoController@grupoAlumnosDocente');
Route::get('/grupo/list',                       'GrupoController@list');
Route::apiResource('/grupo',                    'GrupoController');
Route::get('/grupoMateria/grupo/{grupo}',       'GrupoMateriaController@grupoMateriaGrupo');
Route::apiResource('/grupoMateria',             'GrupoMateriaController', ['parameters' => ['grupoMateria' => 'grupoMateria']]);

Route::apiResource('/areaEstudio',              'AreaEstudioController');
Route::get('/materia/areaEstudio/{area}',       'MateriaController@materiaAreaEstudio');
Route::get('/materia/docente/alumno/{alumno}',  'MateriaController@materiaDocenteAlumno');
Route::get('/materia/grado/{grado}',            'MateriaController@materiaGrado');
Route::get('/materia/grupo/{grupo}',            'MateriaController@materiaGrupo');
Route::get('/materia/grupo/{grupo}/docente/{docente}',  'MateriaController@materiaGrupoDocente');
Route::get('/materia/alumno/{alumno}',          'MateriaController@materiaAlumno');
Route::apiResource('/materia',                  'MateriaController', ['parameters' => ['materia' => 'materia']]);
Route::apiResource('/clase',                    'ClaseController');
Route::apiResource('/calificacion',             'CalificacionController');
Route::apiResource('/tipoCalificacion',         'TipoCalificacionController');
Route::apiResource('/nivelCalificacion',        'NivelCalificacionController');
Route::apiResource('/gradoMateria',             'GradoMateriaController');
Route::apiResource('/inasistencia',             'InasistenciaController'); //TODO: ASISTENCIA
Route::apiResource('/grupoCalificacion',        'GrupoCalificacionController');

// -- HORARIO -- // 
Route::apiResource('/horaAcademica',            'HoraAcademicaController');
Route::get('/cargaHoraria/horario/{horario}',   'CargaHorariaController@cargaHorariaHorario');
Route::apiResource('/cargaHoraria',             'CargaHorariaController', ['parameters' => ['cargaHoraria' => 'cargaHoraria']]);

Route::get('/detalleHorario/horario/{horario}', 'DetalleHorarioController@detalleByHorarioId');
Route::post('/detalleHorario/alumno/fecha',     'DetalleHorarioController@detalleHorarioAlumnoFecha');
Route::apiResource('/detalleHorario',           'DetalleHorarioController');
Route::get('/horario/grupo/{grupo}',            'HorarioController@horarioGrupo');
Route::get('/horario/alumno/{alumno}',          'HorarioController@horarioAlumno');
Route::get('/horario/docente/{docente}',        'HorarioController@horarioDocente');
Route::apiResource('/horario',                  'HorarioController');

// -- PLAN EVALUACION -- //
Route::get('/planEvaluacion/grupo/{grupo}/periodo/{periodo}/materia/{materia}',  'PlanEvaluacionController@planEvaluacionGrupoPeriodoMateria');
Route::get('/planEvaluacion/grupo/{grupo}/periodo/{periodo}',  'PlanEvaluacionController@planEvaluacionGrupoPeriodo');
Route::get('/planEvaluacion/docente/{docente}/periodo/{periodo}',  'PlanEvaluacionController@planEvaluacionDocentePeriodo');

Route::put('/planEvaluacion/status/{planEvaluacion}',  'PlanEvaluacionController@updateStatus');
Route::apiResource('/planEvaluacion',           'PlanEvaluacionController');
Route::apiResource('/tipoEvaluacion',           'TipoEvaluacionController');

// -- EVALUACION -- //
Route::get('/evaluacion/planEvaluacion/{planEvaluacion}',  'EvaluacionController@evaluacionPlan');
Route::get('/evaluacion/grupo/{grupo}',         'EvaluacionController@evaluacionGrupo');
Route::get('/evaluacion/docente/{docente}',     'EvaluacionController@evaluacionDocente');
Route::apiResource('/evaluacion',               'EvaluacionController');
Route::apiResource('/evaluacionAlumno',         'EvaluacionAlumnoController');

// -- AGENDA -- //
Route::apiResource('/tipoFeriado',              'TipoFeriadoController');
Route::apiResource('/feriado',                  'FeriadoController');
Route::apiResource('/tipoAgenda',               'TipoAgendaController');
Route::apiResource('/agenda',                   'AgendaController');
Route::apiResource('/tipoActividad',            'TipoActividadController');

// -- FOTOS / ARCHIVOS -- //
Route::get('/foto/tipoFoto/{tipoFoto}/origen/{origenId}',  'FotoController@fotoTipoOrigen');
Route::apiResource('/foto',                     'FotoController');
Route::apiResource('/tipoFoto',                 'TipoFotoController');

Route::get('/archivo/tipoArchivo/{tipoArchivo}/origen/{origenId}', 'ArchivoController@archivoTipoOrigen');
Route::apiResource('/archivo',                  'ArchivoController');
Route::apiResource('/tipoArchivo',              'TipoArchivoController');

Route::apiResource('/tipoRecurso',              'TipoRecursoController');
Route::get('/recurso/grado/{grado}',            'RecursoController@recursoGrado');
Route::get('/recurso/grupo/{grupo}',            'RecursoController@recursoGrupo');
Route::apiResource('/recurso',                  'RecursoController');

// -- GESTION USUARIO -- //
Route::apiResource('/tipoUsuario',              'TipoUsuarioController');
Route::apiResource('/usuario',                  'UsuarioController');
Route::apiResource('/menu',                     'MenuController');
Route::apiResource('/perfil',                   'PerfilController');
Route::apiResource('/permiso',                  'PermisoController');
Route::apiResource('/usuarioPerfil',            'UsuarioPerfilController');
Route::apiResource('/modulo',                   'ModuloController');
Route::apiResource('/menu',                     'MenuController');
Route::apiResource('/modulo',                   'ModuloController');
Route::apiResource('/menu',                     'MenuController');

//Notificaciones
Route::get('/notificacion/combos',              'NotificacionController@combos');
Route::get('/notificacion/destinatario/{tipoDestinatario}',  'NotificacionController@destinatario');
Route::get('/notificacion/destinatario/{tipoDestinatario}/{idDestinatario}',  'NotificacionController@destinatarioById');
Route::apiResource('/notificacion',             'NotificacionController');
Route::apiResource('/tipoNotificacion',         'TipoNotificacionController');
Route::apiResource('/tipoPrioridad',            'TipoPrioridadController');
Route::apiResource('/tipoDestinatario',         'TipoDestinatarioController');

// --  CONFIGURACION  -- //
Route::apiResource('/configuracion',            'ConfiguracionController');

// --  PRUEBA  -- //

Route::get('/prueba/grado/{grado}',             'PruebaController@pruebaGrado');
Route::get('/prueba/docente/{docente}/grado/{grado}/materia/{materia}',  'PruebaController@pruebaDocenteGradoMateria');
Route::get('/prueba/docente/{docente}',         'PruebaController@pruebaDocente');

Route::get('/prueba/docente/{docente}/grado/{grado}/materia/{materia}/asignada',   'PruebaController@pruebaDocenteGradoMateriaAsignada');
Route::get('/prueba/docente/{docente}/grado/{grado}/materia/{materia}/pendiente',  'PruebaController@pruebaDocenteGradoMateriaPendiente');
Route::get('/prueba/docente/{docente}/ejecutar','PruebaController@pruebaDocenteEjecutar');
Route::get('/prueba/docente/{docente}/evaluar', 'PruebaController@pruebaDocenteEvaluar');

Route::put('/prueba/asignar/{prueba}',          'PruebaController@asignar');
Route::put('/prueba/ejecutar/{prueba}',         'PruebaController@ejecutar');
Route::put('/prueba/cancelar/{prueba}',         'PruebaController@cancelar');
Route::put('/prueba/reiniciar/{prueba}',        'PruebaController@reiniciar');

Route::get('/prueba/{prueba}/grado/{grado}/importar',  'PruebaController@pruebaGradoImportar');
Route::apiResource('/prueba',                   'PruebaController', ['parameters' => ['prueba' => 'cargaHorapruebaria']]);

Route::apiResource('/tipoPregunta',             'TipoPreguntaController',['parameters' => ['tipoPregunta' => 'tipoPregunta']]);
Route::post('/pregunta/importar',               'PreguntaController@importar');
Route::get('/pregunta/prueba/{prueba}',         'PreguntaController@preguntaPrueba');
Route::apiResource('/pregunta',                 'PreguntaController', ['parameters' => ['pregunta' => 'pregunta']]);

Route::get('/respuesta/pregunta/{pregunta}',    'RespuestaController@respuestaPregunta');
Route::apiResource('/respuesta',                'RespuestaController', ['parameters' => ['respuesta' => 'respuesta']]);

Route::get('/pruebaAlumno/alumno/{alumno}',     'PreguntaController@pruebaAlumnoAlumno');
Route::get('/pruebaAlumno/prueba/{prueba}',     'PreguntaController@pruebaAlumnoPrueba');
Route::apiResource('/pruebaAlumno',             'PruebaAlumnoController');
Route::apiResource('/respuestaAlumno',          'RespuestaAlumnoController');


//newRoutes


Route::fallback(function () {
    return response('Ruta Invalida', 200);
});

});
