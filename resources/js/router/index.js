import Vue    from 'vue'
import Router from 'vue-router'
Vue.use(Router)

//secciones
import Login                 from '@pages/login/login';
import RecoverPassword       from '@pages/login/RecoverPassword'; 
import Welcome               from '@pages/welcome/Welcome';
import Home                  from '@pages/home/home';

//acudiente
import BandejaAcudiente      from '@pages/bandejaAcudiente/dashboard';
import MenuAcudiente         from '@pages/bandejaAcudiente/index'; 

//alumno
import BandejaAlumno         from '@pages/bandejaAlumno/dashboard';
import MenuAlumno            from '@pages/bandejaAlumno/index'; 
import AsignacionAlumno      from '@pages/bandejaAlumno/asignacion/AppAsignacionAlumno';
import BibliotecaAlumno      from '@pages/bandejaAlumno/biblioteca/AppBiblioteca';

//docente
import BandejaDocente        from '@pages/BandejaDocente/dashboard';
import MenuProfesor          from '@pages/bandejaDocente/index'; 
import Clase                 from '@pages/clase/AppClase';
import GestionTema           from '@pages/BandejaDocente/tema/GestionTema';
import AppPlanificador       from '@pages/BandejaDocente/asignacion/AppPlanificador';
import AsignacionSeguimiento from '@pages/BandejaDocente/asignacion/AsignacionSeguimiento';

//admin
import BandejaAdmin          from '@pages/admin/dashboard';
import MenuAdmin             from '@pages/admin/index'; 

//colegio
import AppColegio            from '@pages/colegio/AppColegio';
import TipoColegio           from '@pages/tipoColegio/tipoColegio';
import Estructura            from '@pages/estructura/estructura';
import Aula                  from '@pages/aula/aula';
import Cargos                from '@pages/cargo/cargo';
import TipoDirectiva         from '@pages/tipoDirectiva/tipoDirectiva';
import Directiva             from '@pages/directiva/directiva';
import Empleado              from '@pages/empleado/empleado';
import Calendario            from '@pages/calendario/calendario';
import Periodo               from '@pages/periodo/periodo';
import Turno                 from '@pages/turno/turno';
//import Jornada             from '@pages/jornada/jornada';

//localizacion-contacto
import Pais                  from '@pages/pais/pais';
import Departamento          from '@pages/departamento/departamento';
import Ciudad                from '@pages/ciudad/ciudad';
import Zona                  from '@pages/zona/zona';
import Comuna                from '@pages/comuna/comuna';
//import Contacto              from '@pages/contacto/contacto';
//import TipoContacto          from '@pages/tipoContacto/tipoContacto';
//import Telefono              from '@pages/telefono/telefono';
//import TipoTelefono          from '@pages/tipoTelefono/tipoTelefono';

//agenda
import Agenda                from '@pages/Agenda/Agenda';
import TipoAgenda            from '@pages/tipoAgenda/tipoAgenda';
import AgendaActividad       from '@pages/agendaActividad/agendaActividad';
import Feriado               from '@pages/feriado/feriado';

//Gestion Academica
import Nivel                 from '@pages/nivel/nivel';
import Grado                 from '@pages/grado/grado';
import Grupo                 from '@pages/grupo/grupo';
import AreaEstudio           from '@pages/areaEstudio/areaEstudio';
import Materia               from '@pages/materia/materia';
import GrupoCalificacion     from '@pages/grupoCalificacion/grupoCalificacion';
import NivelCalificacion     from '@pages/nivelCalificacion/nivelCalificacion';
import HoraAcademica         from '@pages/horaAcademica/horaAcademica';
import Horario               from '@pages/horario/horario';
//import GradoMateria        from '@pages/gradoMateria/gradoMateria';
//import CargaHoraria        from '@pages/cargaHoraria/cargaHoraria';
//import Calificacion        from '@pages/calificacion/calificacion';

//evaluacion
import TipoEvaluacion        from '@pages/tipoEvaluacion/tipoEvaluacion';
import AppPlanEvaluacion     from '@pages/planEvaluacion/AppPlanEvaluacion';
//import PlanEvaluacion      from '@pages/planEvaluacion/planEvaluacion'; 

//docente
import Docente               from '@pages/docente/docente';

//alumno
import Alumno                from '@pages/alumno/alumno';
import TipoCondicion         from '@pages/tipoCondicion/tipoCondicion';
import TipoFalta             from '@pages/tipoFalta/tipoFalta';
import TipoSancion           from '@pages/tipoSancion/tipoSancion';
import Pariente              from '@pages/pariente/pariente';
const Parentesco             =  () => import('@pages/parentesco/parentesco');

//general
import Asistente             from '@pages/asistente/asistente';
import EstadoCivil           from '@pages/estadoCivil/estadoCivil';
import Status                from '@pages/status/status';
import Configuracion         from '@pages/configuracion/configuracion';

//subscripcion-pago
//import Suscripcion         from '@pages/suscripcion/suscripcion';
//import TipoPago            from '@pages/tipoPago/tipoPago';
//import Pago                from '@pages/pago/pago';

//archivos
import Archivo               from '@pages/archivo/archivo';
import TipoArchivo           from '@pages/tipoArchivo/tipoArchivo';
import Documento             from '@pages/documento/documento';
import TipoDocumento         from '@pages/tipoDocumento/tipoDocumento';
import Foto                  from '@pages/foto/foto';
import TipoFoto              from '@pages/tipoFoto/tipoFoto';
import TipoRecurso           from '@pages/tipoRecurso/tipoRecurso';
import Recurso               from '@pages/recurso/recurso';

//gestion usuario
import TipoUsuario           from '@pages/tipoUsuario/tipoUsuario';
import Usuario               from '@pages/usuario/usuario';
import Modulo                from '@pages/modulo/modulo';
import Menu                  from '@pages/menu/menu';
import Perfil                from '@pages/perfil/perfil';
import UsuarioPerfil         from '@pages/usuarioPerfil/usuarioPerfil';
import Permiso               from '@pages/permiso/permiso';

//libros
import Tema                  from  '@pages/tema/tema'; 
import Libro                 from  '@pages/libro/libro';  
import Pagina                from  '@pages/pagina/pagina'; 

//prueba
import TipoPregunta          from '@pages/tipoPregunta/tipoPregunta'; 
import Prueba                from '@pages/prueba/prueba';
import Pregunta              from '@pages/pregunta/pregunta';
import Respuesta             from '@pages/respuesta/respuesta';
import PruebaAlumno          from '@pages/pruebaAlumno/pruebaAlumno';
import RespuestaAlumno       from '@pages/respuestaAlumno/respuestaAlumno';

import Actividad             from '@pages/actividad/actividad';      
import Enlace                from '@pages/enlace/enlace';     
import TipoEnlace            from '@pages/tipoEnlace/tipoEnlace';     

//notificaciones
import TipoDestinatario      from '@pages/tipoDestinatario/tipoDestinatario';
import TipoPrioridad         from '@pages/tipoPrioridad/tipoPrioridad';
import TipoNotificacion      from '@pages/tipoNotificacion/TipoNotificacion';
import Notificacion          from '@pages/notificacion/notificacion';

//mensajes
import TipoMensaje           from '@pages/tipoMensaje/TipoMensaje';
import Mensaje               from '@pages/mensaje/Mensaje';

//meeet
import MeetDocente           from '@components/meet/docente/meetDocente';
import MeetAlumno            from '@components/meet/alumno/meetAlumno';

//report
/* import AppReporte         from '@pages/reportes/AppReporte' */

//tools
import PageNotFound     from  '@pages/404/NotFound'
import Crud             from  '@pages/crud/crud'

let isAuthenticated = true;
export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
    routes: [
        {
          path: '/',
          name: 'welcome',
          label: 'Welcome',
          icon: 'mdi-home',
          profile: '',
          visible: false,
          component: Welcome,
        },
        {
            path: '/home',
            name: 'home',
            label: 'Home',
            icon: 'mdi-view-dashboard',
            profile: 'secretaria',
            visible: true,
            component: Home,
        },
        {
            path: '/bandeja-docente',
            label: 'Docente',
            icon: 'mdi-account-tie',
            profile: 'docente',
            visible: true,
            component: MenuProfesor,

            children: [
                {
                    path: '',
                    name: 'bandeja-docente',
                    label: 'Bandeja',
                    icon:   'mdi-tray-full',
                    profile: 'docente',
                    visible: true,
                    component: BandejaDocente,
                },

                { 
                    path: 'gestion-tema',
                    name: 'gestion-tema',
                    label: 'Gestion de Contenidos',
                    icon:  'mdi-inbox-multiple',
                    profile: 'docente',
                    visible: true,
                    component: GestionTema
                },

                { 
                    path: 'planificador-docente',
                    name: 'planificador-docente',
                    label: 'Planificador',
                    icon:  'mdi-calendar-multiselect',
                    profile: 'docente',
                    visible: true,
                    component: AppPlanificador
                },

                { 
                    path: 'seguimiento-actividades',
                    name: 'seguimiento-actividades',
                    label: 'Seguimiento',
                    icon: 'mdi-calendar-search',
                    profile: 'docente',
                    visible: true,
                    component: AsignacionSeguimiento
                },

                {
                    path: 'clase-docente',
                    name: 'clase-docente',
                    label: 'Clase',
                    icon:   'mdi-google-classroom',
                    profile: 'docente',
                    visible: true,
                    component: Clase,
                },

                { 
                    path: 'meet-docente',
                    name: 'meet-docente',
                    label: 'Aula Virtual',
                    icon: 'mdi-video-plus',
                    profile: 'docente',
                    visible: true,
                    component: MeetDocente
                },
            ]
        },
        {
            path: '/bandeja-alumno',
            label: 'Alumno',
            icon: 'mdi-school',
            profile: 'alumno',
            visible: true,
            component: MenuAlumno,
            
            children: [
                {
                    path: '',
                    name: 'bandeja-alumno',
                    label: 'Bandeja',
                    icon:   'mdi-tray-full',
                    profile: 'alumno',
                    visible: true,
                    component: BandejaAlumno,
                },

                {
                    path:    'asignacion-alumno',
                    name:    'asignacion-alumno',
                    label:   'Planificador',
                    icon:    'mdi-calendar-multiselect',
                    profile: 'alumno',
                    visible: true,
                    component: AsignacionAlumno,
                },

                {
                    path:    'biblioteca-alumno',
                    name:    'biblioteca-alumno',
                    label:   'Biblioteca',
                    icon:    'mdi-book-open-page-variant',
                    profile: 'alumno',
                    visible: true,
                    component: BibliotecaAlumno,
                },
                
            ]
        },
        {
            path: '/bandeja-acudiente',
            label: 'Acudiente',
            icon: 'mdi-human-male-child',
            profile: 'acudiente',
            visible: true,
            component: MenuAcudiente,

            children: [
                {
                    path:  '',
                    name:  'bandeja-acudiente',
                    label: 'Bandeja',
                    icon:  'mdi-tray-full',
                    profile: 'acudiente',
                    visible: true,
                    component: BandejaAcudiente,
                }
            ]
        },
        {
          path: '/admin',
          label: 'Administrador',
          icon: 'mdi-shield-account',
          profile: 'secretaria',
          visible: true,
          component: MenuAdmin,
          children: [
             { 
                path: '/',
                name: 'admin-dashboard',
                label: 'Modulos',
                icon: 'mdi-cog',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: BandejaAdmin
            }, 
            { 
                path: 'colegio',
                name: 'colegio',
                label: 'Institucion',
                icon: 'mdi-store',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: AppColegio
            },
            { 
                path: 'cargos',
                name: 'cargo',
                label: 'Cargos',
                icon: 'mdi-account-star',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: Cargos
            },
            { 
                path: 'tipoColegio',
                name: 'tipoColegio',
                label: 'Tipo Institucion',
                icon: 'mdi-bookmark-multiple',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: TipoColegio
            },
            { 
                path: 'tipoDirectiva',
                name: 'tipo-directiva',
                label: 'Tipo Directiva',
                icon: 'mdi-account-group-outline',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: TipoDirectiva
            },
            { 
                path: 'directiva',
                name: 'directiva',
                label: 'Directiva',
                icon: 'mdi-account-group',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: Directiva
            },
            { 
                path: 'empleado',
                name: 'empleado',
                label: 'Empleados',
                icon: 'mdi-badge-account',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: Empleado
            },
            { 
                path: 'estructura',
                name: 'estructura',
                label: 'Estructura',
                icon: 'mdi-floor-plan',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: Estructura
            },
            { 
                path: 'aula',
                name: 'aula',
                label: 'Aulas',
                icon: 'mdi-chair-school',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: Aula
            },
            
            { 
                path: 'calendario',
                name: 'calendario',
                label: 'Calendario',
                icon: 'mdi-calendar-blank',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Calendario
            },
            { 
                path: 'periodo',
                name: 'periodo',
                label: 'Periodos',
                icon: 'mdi-calendar-weekend',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Periodo
            },
            { 
                path: 'turno',
                name: 'turno',
                label: 'Turnos',
                icon: 'mdi-timelapse',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Turno
            },
            { 
                path: 'hora-academica',
                name: 'hora-academica',
                label: 'Horas Academicas',
                icon: 'mdi-clock',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: HoraAcademica
            },
            { 
                path: 'area-estudio',
                name: 'area-estudio',
                label: 'Areas de Estudio',
                icon: 'mdi-file-cad',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: AreaEstudio
            },
            { 
                path: 'materia',
                name: 'materia',
                label: 'Materias',
                icon: 'mdi-bookshelf',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Materia
            },
            { 
                path: 'docente',
                name: 'docente',
                label: 'Docente',
                icon: 'mdi-account-tie',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Docente
            },
            { 
                path: 'nivel',
                name: 'nivel',
                label: 'Niveles',
                icon: 'mdi-stairs-up',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Nivel
            },
            { 
                path: 'grado',
                name: 'grado',
                label: 'Grados',
                icon: 'mdi-numeric',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Grado
            },
            { 
                path: 'grupo',
                name: 'grupo',
                label: 'Grupos',
                icon: 'mdi-alphabetical-variant',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: Grupo
            },
            { 
                path: 'nivel-calificacion',
                name: 'nivel-calificacion',
                label: 'Nivel Calificaciones',
                icon: 'mdi-check-box-multiple-outline',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: NivelCalificacion
            },
            { 
                path: 'calificacion',
                name: 'calificacion',
                label: 'Calificacion',
                icon: 'mdi-check-box-outline',
                profile: 'secretaria',
                visible: true,
                color: 'teal',
                component: GrupoCalificacion
            },
            { 
                path: 'plan-evaluacion',
                name: 'plan-evaluacion',
                label: 'Plan Evaluacion',
                icon: 'mdi-table-clock',
                profile: 'secretaria',
                visible: true,
                color: 'purple',
                component: AppPlanEvaluacion
            },
            { 
                path: 'horario',
                name: 'horario',
                label: 'Horario',
                icon: 'mdi-calendar-clock',
                profile: 'secretaria',
                visible: true,
                color: 'purple',
                component: Horario
            },
            { 
                path: 'feriado',
                name: 'feriado',
                label: 'Feriados ',
                icon: 'mdi-calendar-star',
                profile: 'secretaria',
                visible: true,
                color: 'purple',
                component: Feriado
            }, 
            { 
                path: 'tipo-agenda',
                name: 'tipo-agenda',
                label: 'Tipo Agenda ',
                icon: 'mdi-clipboard-text-multiple-outline',
                profile: 'secretaria',
                visible: true,
                color: 'purple',
                component: TipoAgenda
            }, 
            { 
                path: 'agenda-actividad',
                name: 'genda-actividad',
                label: 'Agenda Tipo Actividad ',
                icon: 'mdi-clipboard-text-multiple-outline',
                profile: 'secretaria',
                visible: true,
                color: 'purple',
                component: AgendaActividad
            }, 
            { 
                path: 'agenda',
                name: 'agenda',
                label: 'Agenda',
                icon: 'mdi-clipboard-text',
                profile: 'secretaria',
                visible: true,
                color: 'purple',
                component: Agenda
            },
            { 
                path: 'tipo-condicion',
                name: 'tipo-condicion',
                label: 'Condicion Alumno',
                icon: 'mdi-school-outline',
                profile: 'secretaria',
                visible: true,
                color: 'red',
                component: TipoCondicion
            },
            { 
                path: 'alumno',
                name: 'alumno',
                label: 'Alumnos',
                icon: 'mdi-school',
                profile: 'secretaria',
                visible: true,
                color: 'red',
                component: Alumno
            },

            { 
                path: 'pariente',
                name: 'pariente',
                label: 'Acudiente',
                icon: 'mdi-human-male-child',
                profile: 'secretaria',
                visible: true,
                color: 'red',
                component: Pariente
            },


            {
                path: 'usuario',
                name: 'usuario',
                label: 'Usuario',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                color: 'green',
                component: Usuario
            }, 
            { 
                path: 'perfil',
                name: 'perfil',
                label: 'Perfil',
                icon: 'mdi-account-details-outline',
                profile: 'secretaria',
                visible: true,
                color: 'green',
                component: Perfil
            },
            { 
                path: 'usuario-perfil',
                name: 'usuario-perfil',
                label: 'Usuario Perfil',
                icon: 'mdi-account-details',
                profile: 'secretaria',
                visible: true,
                color: 'green',
                component: UsuarioPerfil
            },
            { 
                path: 'permiso',
                name: 'permiso',
                label: 'Permiso',
                icon: 'mdi-account-key',
                profile: 'secretaria',
                visible: true,
                color: 'green',
                component: Permiso
            },

            { 
                path: 'tema',
                name: 'tema',
                label: 'Tema',
                icon: 'mdi-card-text',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Tema
            }, 
            { 
                path: 'prueba',
                name: 'prueba',
                label: 'Prueba',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Prueba
            },
            { 
                path: 'tipo-pregunta',
                name: 'tipo-pregunta',
                label: 'Tipo Preguntas',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoPregunta
            },
            { 
                path: 'pregunta',
                name: 'pregunta',
                label: 'Pregunta',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Pregunta
            },
            { 
                path: 'respuesta',
                name: 'respuesta',
                label: 'Respuesta',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Respuesta
            },
            { 
                path: 'prueba-alumno',
                name: 'prueba-alumno',
                label: 'Prueba Alumno',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: PruebaAlumno
            },
            { 
                path: 'respuesta-alumno',
                name: 'respuesta-alumno',
                label: 'Respuesta Alumno',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: RespuestaAlumno
            },
            
            { 
                path: 'tipo-falta',
                name: 'tipo-falta',
                label: 'Tipo Faltas',
                icon: 'mdi-account-alert-outline',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: TipoFalta
            },
            { 
                path: 'tipo-sancion',
                name: 'tipo-sancion',
                label: 'Tipo Sancion',
                icon: 'mdi-gavel',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: TipoSancion
            },
            { 
                path: 'pais',
                name: 'pais',
                label: 'Pais',
                icon: 'mdi-earth',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Pais
            },
            { 
                path: 'departamento',
                name: 'departamento',
                label: 'Departamento',
                icon: 'mdi-map-search',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Departamento
            },
            { 
                path: 'ciudad',
                name: 'ciudad',
                label: 'Ciudad',
                icon: 'mdi-city-variant',
                color: 'deep-purple',
                component: Ciudad
            },
            { 
                path: 'zona',
                name: 'zona',
                label: 'Zona',
                icon: 'mdi-select-marker',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Zona
            },
            { 
                path: 'comuna',
                name: 'comuna',
                label: 'Comuna',
                icon: 'mdi-home-group',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Comuna
            },

            { 
                path: 'tipo-evaluacion',
                name: 'tipo-evaluacion',
                label: 'Tipo Evaluacion',
                icon: 'mdi-clipboard-check-multiple-outline',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoEvaluacion
            },
            { 
                path: 'parentesco',
                name: 'parentesco',
                label: 'Parentesco',
                icon: 'mdi-account-supervisor-circle',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Parentesco
            },
            { 
                path: 'estado-civil',
                name: 'estado-civil',
                label: 'Estado Civil',
                icon: 'mdi-ring',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: EstadoCivil
            },
            { 
                path: 'modulo',
                name: 'modulo',
                label: 'Modulo',
                icon: 'mdi-menu-open',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Modulo
            }, 
            { 
                path: 'menu',
                name: 'menu',
                label: 'Menu',
                icon: 'mdi-menu',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Menu
            },
            { 
                path: 'tipoUsuario',
                name: 'tipoUsuario',
                label: 'Tipo Usuario',
                icon: 'mdi-book-account',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoUsuario
            },
            { 
                path: 'tipo-documento',
                name: 'tipo-documento',
                label: 'Tipo Documento',
                icon: 'mdi-card-account-details',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoDocumento
            },
            { 
                path: 'documento',
                name: 'documento',
                label: 'Documento',
                icon: 'mdi-card-account-details',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Documento
            },
            { 
                path: 'tipoFoto',
                name: 'tipoFoto',
                label: 'Tipo Foto',
                icon: 'mdi-image-album',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoFoto
            },   
            { 
                path: 'foto',
                name: 'foto',
                label: 'Foto',
                icon: 'mdi-image',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Foto
            },
            { 
                path: 'status',
                name: 'status',
                label: 'Status',
                icon: 'mdi-playlist-check',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Status
            },
            { 
                path: 'tipo-archivo',
                name: 'tipo-archivo',
                label: 'Tipo Archivo',
                icon: 'mdi-file-multiple',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoArchivo
            },
            { 
                path: 'archivo',
                name: 'archivo',
                label: 'Archivo',
                icon: 'mdi-file',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Archivo
            },
            { 
                path: 'tipo-recurso',
                name: 'tipo-recurso',
                label: 'Tipo Recurso',
                icon: 'mdi-book-open-page-variant',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoRecurso
            },
            { 
                path: 'recurso',
                name: 'recurso',
                label: 'Recurso',
                icon: 'mdi-book-open-page-variant',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Recurso
            },

            /**  NOTIFICACIONES  */
            { 
                path: 'tipo-destinatario',
                name: 'tipo-destinatario',
                label: 'Tipo Destinatario',
                icon: 'mdi-account-question',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoDestinatario
            },
            { 
                path: 'tipo-prioridad',
                name: 'tipo-prioridad',
                label: 'Prioridad',
                icon: 'mdi-alert',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoPrioridad
            },
            { 
                path: 'tipo-notificacion',
                name: 'tipo-notificacion',
                label: 'Tipo Notificacion',
                icon: 'mdi-bell-outline',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoNotificacion
            },
            { 
                path: 'notificacion',
                name: 'notificacion',
                label: 'Notificaciones',
                icon: 'mdi-bell',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Notificacion
            },

            /**  MENSAJE  */
            { 
                path: 'tipo-mensaje',
                name: 'tipo-mensaje',
                label: 'Tipo Mensaje',
                icon: 'mdi-email-multiple',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: TipoMensaje
            },
            { 
                path: 'mensaje',
                name: 'mensaje',
                label: 'Mensajes',
                icon: 'mdi-email',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Mensaje
            },
            { 
                path: 'asistente',
                name: 'asistente',
                label: 'Asistente',
                icon: 'mdi-head-cog',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Asistente
            },
            /** prueba **/
            
           
            //libro
            { 
                path: 'tipo-enlace',
                name: 'tipo-enlace',
                label: 'Tipo Enlace',
                icon: 'mdi-link-variant-plus', 
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: TipoEnlace
            }, 
            { 
                path: 'enlace',
                name: 'enlace',
                label: 'Enlace',
                icon: 'mdi-link-variant',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Enlace
            }, 
            { 
                path: 'libro',
                name: 'libro',
                label: 'Libro',
                icon: 'mdi-book',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Libro
            }, 
            { 
                path: 'pagina',
                name: 'pagina',
                label: 'Pagina',
                icon: 'mdi-file-document',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: Pagina
            }, 
            { 
                path: 'actividad',
                name: 'actividad',
                label: 'Actividad',
                icon: 'mdi-rocket',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Actividad
            }, 


            //CONFIGURACION
            { 
                path: 'configuracion',
                name: 'configuracion',
                label: 'Configuracion',
                icon: 'mdi-cogs',
                profile: 'secretaria',
                visible: true,
                color: 'deep-purple',
                component: Configuracion
            },
            { 
                path: 'meet-alumno',
                name: 'meet-alumno',
                label: 'Clase Alumno',
                icon: 'mdi-google-classroom',
                profile: 'secretaria',
                visible: true,
                color: 'brown',
                component: MeetAlumno
            },

            //reportes
            /* { 
                path: 'reporte',
                name: 'reporte',
                label: 'Reporte',
                icon: 'mdi-table-large',
                profile: 'secretaria',
                visible: true,
                color: 'orange',
                component: AppReporte
            }, */
          ]
        },
        {
            path: '/crud',
            name: 'crud',
            label: 'Generador',
            icon: 'mdi-tools',
            profile: 'secretaria',
            visible: true,
            color: 'black',
            component: Crud,
        },
        {
            path: '/login',
            name: 'login',
            label: 'Login',
            icon: 'mdi-account',
            profile: '*',
            visible: false,
            color: 'black',
            component: Login,
        },
        {
            path: '/recover-password',
            name: 'recover-password',
            label: 'Recover password',
            icon: 'mdi-account',
            profile: '*',
            visible: false,
            color: 'black',
            component: RecoverPassword,
        },
        { 
            path: "*", 
            name: 'notfound',
            label: 'Not Found',
            profile: '*',
            visible: false,
            color: 'black',
            component: PageNotFound 
        }
    ]
})


