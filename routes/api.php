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

    //Autenticacion
    Route::post('login',            'Auth\LoginController@login');
    Route::post('recover/password', 'UsuarioController@recoverPassword');
    Route::post('reset/password',   'UsuarioController@resetPassword');

});


Route::get('/crud/schemas',   'Crud@schemas');
Route::post('/crud/tables',   'Crud@tables');
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
Route::get('/status/grupo/{grupo}',             'StatusController@statusGrupo');
Route::apiResource('/status',                   'StatusController');
Route::apiResource('/tipoColegio',              'TipoColegioController');
Route::apiResource('/turno',                    'TurnoController');
Route::apiResource('/jornada',                  'JornadaController');
Route::apiResource('/tipoContacto',             'TipoContactoController');
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
Route::get('/cargo/list',                       'CargoController@list');
Route::apiResource('/cargo',                    'CargoController');
Route::get('/tipoDirectiva/list',               'TipoDirectivaController@list');
Route::apiResource('/tipoDirectiva',            'TipoDirectivaController');
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

Route::get('/alumno/{alumno}/partners',               'AlumnoController@alumnoPartners');
Route::get('/alumno/{alumno}/materias/docentes',      'AlumnoController@alumnoMateriasDocentes');
Route::get('/alumno/grupo/{grupo}/materia/{materia}', 'AlumnoController@alumnoGrupoMateria');

Route::get('/alumno/grupo/{grupo}',             'AlumnoController@alumnoGrupo');
Route::get('/alumno/sinGrado',                  'AlumnoController@alumnoSinGrado');
Route::get('/alumno/sinGrupo',                  'AlumnoController@alumnoSinGrupo');
Route::get('/alumno/pariente/{pariente}',       'AlumnoController@alumnoPariente');
Route::get('/alumno/matriculado/pariente/{pariente}',  'AlumnoController@alumnoMatriculadoPariente');
Route::post('/alumno/asignacion/search',        'AlumnoController@alumnoSearch');

Route::get('/alumno/prueba/{prueba}/grupo/{grupo}/materia/{materia}',  'AlumnoController@alumnoPruebaGrupoMateria');
Route::get('/alumno/prueba/{prueba}',           'AlumnoController@alumnoPrueba');
Route::get('/alumno/prueba/{prueba}/evaluacion/{evaluacion}',   'AlumnoController@alumnoPruebaEvaluacion');

Route::get('/alumno/evaluacion/{evaluacion}/grupo/{grupo}/materia/{materia}',  'AlumnoController@alumnoEvaluacionGrupoMateria');
Route::get('/alumno/evaluacion/{evaluacion}',   'AlumnoController@alumnoPrueba');

Route::apiResource('/alumno',                   'AlumnoController');
Route::apiResource('/tipoCondicion',            'TipoCondicionController');
Route::apiResource('/matricula',                'MatriculaController');

// -- PARIENTE -- //

Route::get('/pariente/alumno/{alumno}',         'ParienteController@parienteAlumno');
Route::post('/pariente/asignacion/search',      'ParienteController@parienteSearch');
Route::post('/pariente/alumno/{alumno}',        'ParienteController@storeByAlumno');
Route::delete('/pariente/{pariente}/alumno/{alumno}',   'ParienteController@destroyByAlumno');
Route::apiResource('/parentesco',               'ParentescoController');
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

Route::get('/calendario/list',                  'CalendarioController@list');
Route::put('/calendario/{calendario}/status',   'CalendarioController@updateStatus');
Route::apiResource('/calendario',               'CalendarioController');
Route::get('/periodo/calendario/{calendario}',  'PeriodoController@periodoCalendario');
Route::get('/periodo/list',                     'PeriodoController@list');
Route::put('/periodo/{periodo}/status',         'PeriodoController@updateStatus');
Route::apiResource('/periodo',                  'PeriodoController');
Route::apiResource('/nivel',                    'NivelController');
Route::get('/grado/planEvaluacion/docente/{docente}/periodo/{periodo}', 'GradoController@gradoPlanEvaluacionDocentePeriodo');
Route::get('/grado/planEvaluacion/docente/{docente}',   'GradoController@GradoPlanEvaluacionDocente');
Route::get('/grado/materia/docente/{docente}',  'GradoController@gradoMateriaDocente');
Route::get('/grado/grupo/materia/alumno/docente/{docente}',    'GradoController@gradoGrupoMateriaAlumnoDocente');
Route::get('/grado/grupo/docente/{docente}',    'GradoController@gradoGrupoDocente');
Route::get('/grado/materia/docente/{docente}',  'GradoController@gradoMateriaDocente');
Route::get('/grado/MateriaAlumno',              'GradoController@gradoMateriaAlumno');
Route::get('/grado/planEvaluacion',             'GradoController@gradoPlanEvaluacion');
Route::get('/grado/list',                       'GradoController@list');
Route::apiResource('/grado',                    'GradoController');
Route::get('/gradoMateria/grado/{grado}/asignacion',   'GradoMateriaController@gradoMateriaAsignacion');
Route::apiResource('/gradoMateria',             'GradoMateriaController', ['parameters' => ['gradoMateria' => 'gradoMateria']]);

Route::get('/grupo/grado/{grado}',              'GrupoController@grupoGrado');
Route::get('/grupo/docente/{docente}',          'GrupoController@grupoDocente');
Route::get('/grupo/alumnos/docente/{docente}',  'GrupoController@grupoAlumnosDocente');
Route::get('/grupo/list',                       'GrupoController@list');
Route::apiResource('/grupo',                    'GrupoController');
Route::get('/grupoMateria/grupo/{grupo}',       'GrupoMateriaController@grupoMateriaGrupo');
Route::apiResource('/grupoMateria',             'GrupoMateriaController', ['parameters' => ['grupoMateria' => 'grupoMateria']]);

Route::apiResource('/areaEstudio',              'AreaEstudioController');
Route::get('/materia/areaEstudio/{area}',       'MateriaController@materiaAreaEstudio');
Route::get('/materia/docente/alumno/{alumno}',  'MateriaController@materiaDocenteAlumno');
Route::get('/materia/grupo/alumno/docente/{docente}',  'MateriaController@materiaGrupoAlumnoDocente');
Route::get('/materia/grado/{grado}',            'MateriaController@materiaGrado');
Route::get('/materia/grupo/{grupo}',            'MateriaController@materiaGrupo');
Route::get('/materia/grupo/{grupo}/docente/{docente}',  'MateriaController@materiaGrupoDocente');
Route::get('/materia/grupo/{grupo}/docente/{docente}/activa',  'MateriaController@materiaGrupoDocenteActiva');
Route::get('/materia/evaluacion/alumno/{alumno}',       'MateriaController@materiaEvaluacionAlumno');
Route::get('/materia/alumno/{alumno}',          'MateriaController@materiaAlumno');
Route::apiResource('/materia',                  'MateriaController', ['parameters' => ['materia' => 'materia']]);
Route::get('/calificacion/{grupoCalificacion}', 'CalificacionController@calificacionGrupo');
Route::apiResource('/calificacion',             'CalificacionController');
Route::apiResource('/tipoCalificacion',         'TipoCalificacionController');
Route::apiResource('/nivelCalificacion',        'NivelCalificacionController');;
Route::apiResource('/grupoCalificacion',        'GrupoCalificacionController');

// -- HORARIO -- // 

Route::apiResource('/horaAcademica',            'HoraAcademicaController');
Route::get('/cargaHoraria/horario/{horario}',   'CargaHorariaController@cargaHorariaHorario');
Route::get('/cargaHoraria/{horaAcademica}',     'CargaHorariaController@cargaHorariaHoraAcademica');
Route::apiResource('/cargaHoraria',             'CargaHorariaController', ['parameters' => ['cargaHoraria' => 'cargaHoraria']]);

Route::get('/detalleHorario/horario/{horario}', 'DetalleHorarioController@detalleByHorarioId');
Route::post('/detalleHorario/alumno/fecha',     'DetalleHorarioController@detalleHorarioAlumnoFecha');
Route::apiResource('/detalleHorario',           'DetalleHorarioController');
Route::get('/horario/grupo/{grupo}',            'HorarioController@horarioGrupo');
Route::get('/horario/alumno/{alumno}',          'HorarioController@horarioAlumno');
Route::get('/horario/docente/{docente}',        'HorarioController@horarioDocente');
Route::apiResource('/horario',                  'HorarioController');

// -- AGENDA -- //

Route::apiResource('/tipoFeriado',              'TipoFeriadoController');
Route::apiResource('/feriado',                  'FeriadoController');
Route::apiResource('/tipoAgenda',               'TipoAgendaController');
Route::apiResource('/agenda',                   'AgendaController');
Route::apiResource('/tipoActividad',            'TipoActividadController');
Route::apiResource('/agendaActividad',          'AgendaActividadController');

// -- GESTION USUARIO -- //

Route::apiResource('/tipoUsuario',              'TipoUsuarioController');
Route::get('/usuario/lote/tipo/{tipo}',         'UsuarioController@usuarioLoteTipo');
Route::put('/usuario/{usuario}/email',          'UsuarioController@updateEmail');
Route::put('/usuario/{usuario}/password',       'UsuarioController@updatePassword');
Route::put('/usuario/{usuario}/resetPassword',  'UsuarioController@resetPassword');
Route::apiResource('/usuario',                  'UsuarioController');

Route::apiResource('/perfil',                   'PerfilController');
Route::get('/permiso/perfil/{perfil}/asignacion', 'PermisoController@permisoPerfilAsignacion');
Route::apiResource('/permiso',                  'PermisoController');
Route::apiResource('/usuarioPerfil',            'UsuarioPerfilController');
Route::apiResource('/modulo',                   'ModuloController');
Route::get('/menu/combo',                       'MenuController@combo');
Route::apiResource('/menu',                     'MenuController');

// -- Notificaciones -- //
Route::get('/notificacion/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/all',        'NotificacionController@all');
Route::get('/notificacion/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/read',        'NotificacionController@read');
Route::get('/notificacion/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/unread',      'NotificacionController@unread');
Route::put('/notificacion/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/markreadall', 'NotificacionController@markReadAll');
Route::put('/notificacion/{notificacion}/unread', 'NotificacionController@markUnread');
Route::put('/notificacion/{notificacion}/read',   'NotificacionController@markRead');
Route::put('/notificacion/{notificacion}/all',    'NotificacionController@markRead');

Route::get('/notificacion/combos',                                           'NotificacionController@combos');
Route::get('/notificacion/destinatario/{tipoDestinatario}',                  'NotificacionController@destinatario');
Route::get('/notificacion/destinatario/{tipoDestinatario}/{idDestinatario}', 'NotificacionController@destinatarioById');

Route::post('/notificacion/reportarEvaluacion', 'NotificacionController@reportarEvaluacion');

Route::post('/notificacion/grupo/{grupo}',      'NotificacionController@notificarGrupo');


Route::apiResource('/notificacion',             'NotificacionController');
Route::apiResource('/tipoNotificacion',         'TipoNotificacionController');
Route::apiResource('/tipoPrioridad',            'TipoPrioridadController');
Route::apiResource('/tipoDestinatario',         'TipoDestinatarioController');

// -- MENSAJE -- //

Route::get('/mensaje/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/read',   'MensajeController@read');
Route::get('/mensaje/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/unread', 'MensajeController@unread');
Route::put('/mensaje/destinatario/{destinatario}/tipoDestinatario/{tipoDestinatario}/markreadall', 'MensajeController@markReadAll');
Route::put('/mensaje/{mensaje}/unread', 'MensajeController@markUnread');
Route::put('/mensaje/{mensaje}/read',   'MensajeController@markRead');

Route::get('/mensaje/combos',                                           'MensajeController@combos');
Route::get('/mensaje/destinatario/{tipoDestinatario}',                  'MensajeController@destinatario');
Route::get('/mensaje/destinatario/{tipoDestinatario}/{idDestinatario}', 'MensajeController@destinatarioById');
Route::apiResource('/mensaje',                                          'MensajeController');
Route::apiResource('/tipoMensaje',              'TipoMensajeController');

// --  CONFIGURACION  -- //

Route::apiResource('/configuracion',            'ConfiguracionController');

// -- PLAN EVALUACION -- //

Route::get('/planEvaluacion/grupo/{grupo}/periodo/{periodo}/materia/{materia}',  'PlanEvaluacionController@planEvaluacionGrupoPeriodoMateria');
Route::get('/planEvaluacion/grupo/{grupo}/periodo/{periodo}',     'PlanEvaluacionController@planEvaluacionGrupoPeriodo');
Route::get('/planEvaluacion/docente/{docente}/periodo/{periodo}', 'PlanEvaluacionController@planEvaluacionDocentePeriodo');
Route::get('/planEvaluacion/alumno/{alumno}',  'PlanEvaluacionController@planEvaluacionAlumno');
Route::get('/planEvaluacion/calificacion/alumno/{alumno}','PlanEvaluacionController@PlanEvaluacionCalificacionAlumno');
Route::get('/planEvaluacion/calificacion/alumno/{alumno}/materia/{materia}','PlanEvaluacionController@PlanEvaluacionCalificacionAlumnoMateria');
Route::put('/planEvaluacion/status/{planEvaluacion}',     'PlanEvaluacionController@updateStatus');
Route::apiResource('/planEvaluacion',           'PlanEvaluacionController');
Route::apiResource('/tipoEvaluacion',           'TipoEvaluacionController');
Route::apiResource('/planPlantilla',     'PlanPlantillaController');

Route::get('/planDetalle/combos',                                        'PlanDetalleController@combos');
Route::get('/planDetalle/planEvaluacion/{planEvaluacion}',               'PlanDetalleController@planDetallePlanEvaluacion');
Route::put('/planDetalle/planEvaluacion/{planEvaluacion}/grupo/{grupo}', 'PlanDetalleController@updatePlanesDetalle');

Route::get('/tema/grupo/{grupo}/materia/{materia}', 'TemaController@temaGrupoMateria');
Route::get('/tema/grado/{grado}/materia/{materia}', 'TemaController@temaGradoMateria');
Route::get('/tema/grado/{grado}/materia/{materia}/grupo/{grupo}', 'TemaController@temaGradoMateriaGrupo');
Route::get('/tema/{tema}/recursos',                 'TemaController@temaRecursos');
Route::get('/tema/planEvaluacion/{planEvaluacion}', 'TemaController@temaPlanEvaluacion');
Route::apiResource('/tema',                         'TemaController', ['parameters' => ['tema' => 'tema']]);

Route::get('/planTema/planEvaluacion/{planEvaluacion}/grupo/{grupo}/materia/{materia}', 'PlanTemaController@planTemaGrupoMateria');
Route::get('/planTema/planEvaluacion/{planEvaluacion}', 'PlanTemaController@planTemaPlanEvaluacion');
Route::get('/planTema/detallePlan/{detallePlan}',   'PlanTemaController@planTemadetallePlan');
Route::apiResource('/planTema',                     'PlanTemaController', ['parameters' => ['planTema' => 'planTema']]);

Route::get('/rasgo/grupo/{grupo}/materia/{materia}/asignacion',       'RasgoController@rasgoGrupoMateriaAsignacion');
Route::apiResource('/rasgo',                        'RasgoController');


//TOOLS//
// Route::get('/fixPlanes',   'PlanEvaluacionController@fixPlanDetalles');

// -- EVALUACION -- //

Route::get('/evaluacion/planEvaluacion/{planEvaluacion}',   'EvaluacionController@evaluacionPlan');
Route::get('/evaluacion/materia/{materia}/grupo/{grupo}',   'EvaluacionController@evaluacionMateriaGrupo');
Route::get('/evaluacion/materia/{materia}/alumno/{alumno}', 'EvaluacionController@evaluacionMateriaAlumno');
Route::get('/evaluacion/materia/{materia}/grupo/{grupo}/prueba',  'EvaluacionController@evaluacionMateriaGrupoPrueba');
Route::get('/evaluacion/grupo/{grupo}',                     'EvaluacionController@evaluacionGrupo');
Route::get('/evaluacion/alumno/{alumno}',                   'EvaluacionController@evaluacionAlumno');
Route::get('/evaluacion/docente/{docente}',                 'EvaluacionController@evaluacionDocente');
Route::put('/evaluacion/asignar/{evaluacion}',              'EvaluacionController@asignar');
Route::put('/evaluacion/cerrar/{evaluacion}',               'EvaluacionController@cerrar');

Route::get('/evaluacionAlumno/alumno/{alumno}',             'EvaluacionAlumnoController@evaluacionAlumnoAlumno');
Route::get('/evaluacionAlumno/evaluacion/{evaluacion}',     'EvaluacionAlumnoController@evaluacionAlumnoEvaluacion');
Route::get('/evaluacionAlumno/alumno/{alumno}',             'EvaluacionAlumnoController@evaluacionAlumnoAlumno');
Route::get('/evaluacionAlumno/grupo/{grupo}',               'EvaluacionAlumnoController@evaluacionAlumnoGrupo');
Route::get('/evaluacionAlumno/materia/grupo/{grupo}/docente/{docente}',       'EvaluacionAlumnoController@evaluacionAlumnoMateriaGrupoDocente');

Route::put('/evaluacionAlumno/{evaluacionAlumno}/completada', 'EvaluacionAlumnoController@completada');
Route::put('/evaluacionAlumno/{evaluacionAlumno}/acceso',     'EvaluacionAlumnoController@acceso');

// -- PRUEBA -- //
Route::put('/evaluacionAlumno/{evaluacionAlumno}/iniciarPrueba',   'EvaluacionAlumnoController@iniciarPrueba');
Route::put('/evaluacionAlumno/{evaluacionAlumno}/finalizarPrueba', 'EvaluacionAlumnoController@finalizarPrueba');
Route::put('/evaluacionAlumno/{evaluacionAlumno}/evaluar',         'EvaluacionAlumnoController@evaluar');

Route::get('/prueba/{prueba}/evaluacion/{evaluacion}/evaluacionAlumno/{evaluacionAlumno}', 'PruebaController@pruebaEvaluacionAlumno');
Route::get('/prueba/docente/{docente}/grado/{grado}/materia/{materia}',  'PruebaController@pruebaDocenteGradoMateria');
Route::get('/prueba/grado/{grado}',                    'PruebaController@pruebaGrado');
Route::get('/prueba/tema/{tema}',                      'PruebaController@pruebaTema');
Route::get('/prueba/grado/{grado}/materia/{materia}',  'PruebaController@pruebaGradoMateria');

Route::get('/tipoPregunta/actividad',           'TipoPreguntaController@tipoPreguntaActividad');

Route::get('/pregunta/prueba/{prueba}/alumno/{alumno}/pendiente',  'PreguntaController@preguntaPruebaAlumnoPendiente');
Route::get('/pregunta/prueba/{prueba}/alumno/{alumno}/evaluacion', 'PreguntaController@preguntaPruebaAlumnoEvaluacion');
Route::get('/pregunta/{orden}/prueba/{prueba}/alumno/{alumno}/',   'PreguntaController@preguntaOrdenPruebaAlumno');
Route::get('/pregunta/prueba/{prueba}',         'PreguntaController@preguntaPrueba');
Route::post('/pregunta/importar',               'PreguntaController@importar');

Route::put('/respuesta/{respuesta}/nombre',     'RespuestaController@updateNombre');
Route::put('/respuesta/{respuesta}/correcta',   'RespuestaController@updateCorrecta');
Route::get('/respuesta/pregunta/{pregunta}',    'RespuestaController@respuestaPregunta');

Route::apiResource('/prueba',                   'PruebaController', ['parameters' => ['prueba' => 'prueba']]);
Route::apiResource('/respuesta',                'RespuestaController', ['parameters' => ['respuesta' => 'respuesta']]);
Route::apiResource('/tipoPregunta',             'TipoPreguntaController',['parameters' => ['tipoPregunta' => 'tipoPregunta']]);
Route::apiResource('/pregunta',                 'PreguntaController', ['parameters' => ['pregunta' => 'pregunta']]);
Route::apiResource('/respuestaAlumno',          'RespuestaAlumnoController');

// -- TAREA -- //

Route::get('/evaluacionAlumno/{evaluacionAlumno}/archivos',       'EvaluacionAlumnoController@evaluacionAlumnoArchivo');
Route::put('/evaluacionAlumno/{evaluacionAlumno}/finalizarTarea', 'EvaluacionAlumnoController@finalizarTarea');
Route::get('/tarea/evaluacion/{evaluacion}/evaluacionAlumno/{evaluacionAlumno}',  'TareaController@tareaEvaluacionAlumno');
Route::get('/tarea/grado/{grado}/materia/{materia}',  'TareaController@tareaGradoMateria');
Route::get('/tarea/tema/{tema}',                      'TareaController@tareaTema');
Route::apiResource('/tarea',                    'TareaController');
Route::apiResource('/tipoTarea',                'TipoTareaController');

Route::apiResource('/evaluacion',               'EvaluacionController');
Route::apiResource('/evaluacionAlumno',         'EvaluacionAlumnoController');

// -- ASIGNACION -- //

// enlace
Route::get('/enlace/tipoEnlace/{tipoEnlace}/tema/{tema}',               'EnlaceController@enlaceTipoEnlaceTema');
Route::apiResource('/enlace',                   'EnlaceController');
Route::apiResource('/tipoEnlace',               'TipoEnlaceController');

// actividad
Route::get('/actividad/tema/{tema}',            'ActividadController@actividadTema');
Route::apiResource('/actividad',                'ActividadController');
Route::apiResource('/tipoActividad',            'TipoActividadController');
Route::get('/actividadPregunta/actividad/{actividad}',     'ActividadPreguntaController@actividadPreguntaActividad');
Route::apiResource('/actividadPregunta',        'ActividadPreguntaController', ['parameters' => ['actividadPregunta' => 'actividadPregunta']]);
Route::put('/actividadRespuesta/{actividadRespuesta}/nombre',   'ActividadRespuestaController@updateNombre');
Route::put('/actividadRespuesta/{actividadRespuesta}/correcta', 'ActividadRespuestaController@updateCorrecta');
Route::get('/actividadRespuesta/pregunta/{pregunta}',     'ActividadRespuestaController@actividadRespuestaPregunta');
Route::apiResource('/actividadRespuesta',       'ActividadRespuestaController', ['parameters' => ['actividadRespuesta' => 'actividadRespuesta']]);

// -- LIBRO -- //

Route::get('/libro/grado/{grado}',              'LibroController@libroGrado');
Route::apiResource('/libro',                    'LibroController');
Route::apiResource('/pagina',                   'PaginaController', ['parameters' => ['pagina' => 'pagina']]);

// --  REPORTES  -- //
Route::post('/reporte/generate',                'Reportes\ReporteController@generate');
Route::post('/reporte/execute',                 'Reportes\ReporteController@execute');
Route::post('/reporte/execute/excel',           'Reportes\ReporteController@executeExcel');

// --  MEET  -- //
Route::get('meet/{usuario}',                    'MeetController@index');
Route::post('meet/auth/{usuario}',              'MeetController@auth');

// --  ASISSTENTE  -- //
Route::get('/asistente/perfil/{perfil}',        'AsistenteController@asistentePerfil');
Route::apiResource('/asistente',                'AsistenteController');
Route::apiResource('/asistenteDetalle',         'AsistenteDetalleController');
//BOOT
Route::post('/botman',                    'BotmanController@talk');


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
Route::get('/recurso/docente/{docente}',        'RecursoController@recursoDocente');
Route::get('/recurso/tipoRecurso/{tipoRecurso}/tema/{tema}',  'RecursoController@recursoTipoRecursoTema');
Route::apiResource('/recurso',                  'RecursoController');

// --  CLASE  -- //
Route::get('/clase/docente/{docente}',          'ClaseController@claseDocente');
Route::get('/clase/alumno/{alumno}',          'ClaseController@claseAlumno');
Route::put('/clase/{clase}/close',              'ClaseController@close');
Route::apiResource('/clase',                    'ClaseController');
Route::apiResource('/asistencia',               'AsistenciaController', ['parameters' => ['asistencia' => 'asistencia']]);


Route::apiResource('/sede',     'SedeController');
//newRoutes

Route::fallback(function () {
    return response('Ruta Invalida', 403);
});

});









