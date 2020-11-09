import Vue    from 'vue'
import Router from 'vue-router'
Vue.use(Router)


//import Admin            from  '@pages/admin/Dashboard';

/*
import SelectCuenta     from  '@pages/registro/SelectCuenta';
import RegistroComercio from  '@pages/registro/RegistroComercio';
import RegistroUsuario  from  '@pages/registro/RegistroUsuario';
import Verify           from  '@pages/registro/Verify';
import Authentication   from  '@pages/login/Authentication';
*/



import Login                 from  '@pages/login/login';
import RecoverPassword       from  '@pages/login/RecoverPassword'; 

import Welcome               from  '@pages/welcome/Welcome';
import Home                  from  '@pages/home/home';

import MenuAdmin             from '@pages/admin/index'; 
import MenuAlumno            from '@pages/bandejaAlumno/index'; 
import MenuProfesor          from '@pages/bandejaDocente/index'; 
import MenuAcudiente         from '@pages/bandejaAcudiente/index'; 

import BandejaAdmin          from '@pages/admin/dashboard';

import BandejaAlumno         from '@pages/bandejaAlumno/dashboard';
import AsignacionAlumno      from '@pages/bandejaAlumno/asignacion/AppAsignacionAlumno';
import BibliotecaAlumno      from '@pages/bandejaAlumno/biblioteca/AppBiblioteca';

import BandejaDocente        from '@pages/BandejaDocente/dashboard';
import ClaseDocente          from '@pages/clase/AppClaseDocente';
import Clase                 from '@pages/clase/AppClase';
import GestionTema           from '@pages/BandejaDocente/tema/GestionTema';
import AppPlanificador       from '@pages/BandejaDocente/asignacion/AppPlanificador';
import AsignacionSeguimiento from '@pages/BandejaDocente/asignacion/AsignacionSeguimiento';


import BandejaAcudiente     from '@pages/bandejaAcudiente/dashboard';

// loading on demand
import Asistente         from '@pages/asistente/asistente';
import TipoColegio       from '@pages/tipoColegio/tipoColegio';
//import Jornada         from '@pages/jornada/jornada';
import Calendario        from '@pages/calendario/calendario';
import Turno             from '@pages/turno/turno';
import Feriado           from '@pages/feriado/feriado';


import TipoAgenda        from '@pages/tipoAgenda/tipoAgenda';
import Agenda            from '@pages/Agenda/Agenda';

import HoraAcademica     from '@pages/horaAcademica/horaAcademica';
import CargaHoraria      from '@pages/cargaHoraria/cargaHoraria';

import Grado             from '@pages/grado/grado';
import Cargos            from '@pages/cargo/cargo';
import Empleado          from '@pages/empleado/empleado';

import Estructura        from '@pages/estructura/estructura';
import Aula              from '@pages/aula/aula';

import GrupoCalificacion from '@pages/grupoCalificacion/grupoCalificacion';
import NivelCalificacion from '@pages/nivelCalificacion/nivelCalificacion';
import Calificacion      from '@pages/calificacion/calificacion';

import TipoEvaluacion    from '@pages/tipoEvaluacion/tipoEvaluacion';
import MetodoEvaluacion  from '@pages/evaluacionMetodo/evaluacionMetodo';
import PlanEvaluacion    from '@pages/planEvaluacion/planEvaluacion'; 
import AppPlanEvaluacion from '@pages/planEvaluacion/AppPlanEvaluacion';

import AreaEstudio       from '@pages/areaEstudio/areaEstudio';
import Materia           from '@pages/materia/materia';

import Docente           from '@pages/docente/docente';

import TipoCondicion     from '@pages/tipoCondicion/tipoCondicion';
import Alumno            from '@pages/alumno/alumno';

import TipoFalta         from '@pages/tipoFalta/tipoFalta';
import TipoSancion       from '@pages/tipoSancion/tipoSancion';

import Ciudad            from '@pages/ciudad/ciudad';







import AppColegio        from '@pages/colegio/AppColegio';
import Comuna            from '@pages/comuna/comuna';


import TipoContacto      from '@pages/tipoContacto/tipoContacto';
import Contacto          from '@pages/contacto/contacto';

import Departamento      from '@pages/departamento/departamento';
import Directiva         from '@pages/directiva/directiva';
import Documento         from '@pages/documento/documento';
import Foto              from '@pages/foto/foto';
import GradoMateria      from '@pages/gradoMateria/gradoMateria';
import Grupo             from '@pages/grupo/grupo';
import Horario           from '@pages/horario/horario';
import Inasistencia      from '@pages/inasistencia/inasistencia';
import Nivel             from '@pages/nivel/nivel';
import Pago              from '@pages/pago/pago';
import Pais              from '@pages/pais/pais';
import Pariente          from '@pages/pariente/pariente';
import Periodo           from '@pages/periodo/periodo';
import Status            from '@pages/status/status';
import Suscripcion       from '@pages/suscripcion/suscripcion';
import Telefono          from '@pages/telefono/telefono';
 
import TipoDirectiva     from '@pages/tipoDirectiva/tipoDirectiva';
import TipoFoto          from '@pages/tipoFoto/tipoFoto';
import TipoPago          from '@pages/tipoPago/tipoPago';
import TipoTelefono      from '@pages/tipoTelefono/tipoTelefono';
import TipoUsuario       from '@pages/tipoUsuario/tipoUsuario';

import Zona              from '@pages/zona/zona';


import TipoDocumento     from '@pages/tipoDocumento/tipoDocumento';

import TipoArchivo       from '@pages/tipoArchivo/tipoArchivo';
import Archivo           from '@pages/archivo/archivo';
import Configuracion     from '@pages/configuracion/configuracion';

import TipoRecurso       from '@pages/tipoRecurso/tipoRecurso';
import Recurso           from '@pages/recurso/recurso';

import EstadoCivil       from '@pages/estadoCivil/estadoCivil';
const Parentesco         =  () => import('@pages/parentesco/parentesco');



import Usuario          from '@pages/usuario/usuario';
import Modulo           from '@pages/modulo/modulo';
import Menu             from '@pages/menu/menu';
import Perfil           from '@pages/perfil/perfil';
import UsuarioPerfil    from '@pages/usuarioPerfil/usuarioPerfil';
import Permiso          from '@pages/permiso/permiso';


//prueba
import TipoPregunta     from '@pages/tipoPregunta/tipoPregunta'; 
import Prueba           from '@pages/prueba/prueba';
import Pregunta         from '@pages/pregunta/pregunta';
import Respuesta        from '@pages/respuesta/respuesta';
import PruebaAlumno     from '@pages/pruebaAlumno/pruebaAlumno';
import RespuestaAlumno  from '@pages/respuestaAlumno/respuestaAlumno';


//libros
import Tema             from  '@pages/tema/tema'; 
import Libro            from  '@pages/libro/libro';  
import Pagina           from  '@pages/pagina/pagina';   
import Actividad        from  '@pages/actividad/actividad';      
/*
import ActividadRecurso from  '@pages/actividadRecurso/actividadRecurso';       
import TipoActividad    from  '@pages/tipoActividad/tipoActividad';    
import AccionPagina     from  '@pages/accionPagina/accionPagina';        
import AccionTema       from  '@pages/accionTema/accionTema';          
import TipoAccion       from  '@pages/tipoAccion/tipoAccion';   
*/      
import TemaEnlace       from  '@pages/temaEnlace/temaEnlace';     
import TemaRecurso      from  '@pages/temaRecurso/temaRecurso';     
import RecursoCategoria from  '@pages/recursoCategoria/recursoCategoria';     
import Enlace           from  '@pages/enlace/enlace';     
import TipoEnlace       from  '@pages/tipoEnlace/tipoEnlace';     


//notificaciones
import TipoDestinatario from '@pages/tipoDestinatario/tipoDestinatario';
import TipoPrioridad    from '@pages/tipoPrioridad/tipoPrioridad';
import TipoNotificacion from '@pages/tipoNotificacion/TipoNotificacion';
import Notificacion     from '@pages/notificacion/notificacion';

import TipoMensaje      from '@pages/tipoMensaje/TipoMensaje';
import Mensaje          from '@pages/mensaje/Mensaje';

import MeetDocente      from '@components/meet/docente/meetDocente';
import MeetAlumno       from '@components/meet/alumno/meetAlumno';

//report
/* import AppReporte       from '@pages/reportes/AppReporte' */

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
                label: 'Configuracion General',
                icon: 'mdi-cog',
                profile: 'secretaria',
                visible: true,
                component: BandejaAdmin
            }, 

            { 
                path: 'colegio',
                name: 'colegio',
                label: 'Institucion',
                icon: 'mdi-store',
                profile: 'secretaria',
                visible: true,
                component: AppColegio
            },
            { 
                path: 'tipoColegio',
                name: 'tipoColegio',
                label: 'Tipo Colegio',
                icon: 'mdi-bookmark-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoColegio
            },
            { 
                path: 'cargos',
                name: 'cargo',
                label: 'Cargos',
                icon: 'mdi-account-settings',
                profile: 'secretaria',
                visible: true,
                component: Cargos
            },
            { 
                path: 'tipoDirectiva',
                name: 'tipo-directiva',
                label: 'Tipo Directiva',
                icon: 'mdi-account-group-outline',
                profile: 'secretaria',
                visible: true,
                component: TipoDirectiva
            },
            { 
                path: 'directiva',
                name: 'directiva',
                label: 'Directiva',
                icon: 'mdi-account-group',
                profile: 'secretaria',
                visible: true,
                component: Directiva
            },
            { 
                path: 'estructura',
                name: 'estructura',
                label: 'Estructura',
                icon: 'mdi-floor-plan',
                profile: 'secretaria',
                visible: true,
                component: Estructura
            },
            { 
                path: 'aula',
                name: 'aula',
                label: 'Aulas',
                icon: 'mdi-chair-school',
                profile: 'secretaria',
                visible: true,
                component: Aula
            },
            { 
                path: 'empleado',
                name: 'empleado',
                label: 'Empleados',
                icon: 'mdi-badge-account',
                profile: 'secretaria',
                visible: true,
                component: Empleado
            },
            { 
                path: 'calendario',
                name: 'calendario',
                label: 'Calendario',
                icon: 'mdi-calendar-blank',
                profile: 'secretaria',
                visible: true,
                component: Calendario
            },
            { 
                path: 'periodo',
                name: 'periodo',
                label: 'Periodos',
                icon: 'mdi-calendar-weekend',
                profile: 'secretaria',
                visible: true,
                component: Periodo
            },
            { 
                path: 'feriado',
                name: 'feriado',
                label: 'Feriados ',
                icon: 'mdi-calendar-star',
                profile: 'secretaria',
                visible: true,
                component: Feriado
            }, 
            { 
                path: 'tipo-agenda',
                name: 'tipo-agenda',
                label: 'Tipo Agenda ',
                icon: 'mdi-clipboard-text-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoAgenda
            }, 

            
            { 
                path: 'agenda',
                name: 'agenda',
                label: 'Agenda',
                icon: 'mdi-clipboard-text',
                profile: 'secretaria',
                visible: true,
                component: Agenda
            },
            { 
                path: 'turno',
                name: 'turno',
                label: 'Turnos',
                icon: 'mdi-timelapse',
                profile: 'secretaria',
                visible: true,
                component: Turno
            },
            { 
                path: 'hora-academica',
                name: 'hora-academica',
                label: 'Horas Academicas',
                icon: 'mdi-clock',
                profile: 'secretaria',
                visible: true,
                component: HoraAcademica
            },
            { 
                path: 'nivel',
                name: 'nivel',
                label: 'Niveles',
                icon: 'mdi-stairs-up',
                profile: 'secretaria',
                visible: true,
                component: Nivel
            },
            { 
                path: 'grado',
                name: 'grado',
                label: 'Grados',
                icon: 'mdi-numeric',
                profile: 'secretaria',
                visible: true,
                component: Grado
            },
            { 
                path: 'grupo',
                name: 'grupo',
                label: 'Grupos',
                icon: 'mdi-alphabetical-variant',
                profile: 'secretaria',
                visible: true,
                component: Grupo
            },
            { 
                path: 'area-estudio',
                name: 'area-estudio',
                label: 'Areas de Estudio',
                icon: 'mdi-file-cad',
                profile: 'secretaria',
                visible: true,
                component: AreaEstudio
            },
            { 
                path: 'materia',
                name: 'materia',
                label: 'Materias',
                icon: 'mdi-bookshelf',
                profile: 'secretaria',
                visible: true,
                component: Materia
            },
            { 
                path: 'nivel-calificacion',
                name: 'nivel-calificacion',
                label: 'Nivel Calificaciones',
                icon: 'mdi-check-box-multiple-outline',
                profile: 'secretaria',
                visible: true,
                component: NivelCalificacion
            },
            { 
                path: 'calificacion',
                name: 'calificacion',
                label: 'Calificacion',
                icon: 'mdi-check-box-outline',
                profile: 'secretaria',
                visible: true,
                component: GrupoCalificacion
            },
            { 
                path: 'tipo-evaluacion',
                name: 'tipo-evaluacion',
                label: 'Tipo Evaluacion',
                icon: 'mdi-clipboard-check-multiple-outline',
                profile: 'secretaria',
                visible: true,
                component: TipoEvaluacion
            },
            { 
                path: 'metodo-evaluacion',
                name: 'metodo-evaluacion',
                label: 'Metodo Evaluacion',
                icon: 'mdi-clipboard-check-multiple-outline',
                profile: 'secretaria',
                visible: true,
                component: MetodoEvaluacion
            },
           /*  { 
                path: 'plan-evaluacion',
                name: 'plan-evaluacion',
                label: 'Plan Evaluacion',
                icon: 'mdi-clipboard-check-multiple-outline',
                profile: 'secretaria',
                visible: true,
                component: PlanEvaluacion
            }, */
            { 
                path: 'plan-evaluacion',
                name: 'plan-evaluacion',
                label: 'Plan Evaluacion',
                icon: 'mdi-table-clock',
                profile: 'secretaria',
                visible: true,
                component: AppPlanEvaluacion
            },
            { 
                path: 'horario',
                name: 'horario',
                label: 'Horario',
                icon: 'mdi-calendar-clock',
                profile: 'secretaria',
                visible: true,
                component: Horario
            },
            { 
                path: 'docente',
                name: 'docente',
                label: 'Docente',
                icon: 'mdi-account-tie',
                profile: 'secretaria',
                visible: true,
                component: Docente
            },


            /**************************** */
            
            

            { 
                path: 'tipo-condicion',
                name: 'tipo-condicion',
                label: 'Condicion Alumno',
                icon: 'mdi-school-outline',
                profile: 'secretaria',
                visible: true,
                component: TipoCondicion
            },
            { 
                path: 'alumno',
                name: 'alumno',
                label: 'Alumnos',
                icon: 'mdi-school',
                profile: 'secretaria',
                visible: true,
                component: Alumno
            },

            { 
                path: 'pariente',
                name: 'pariente',
                label: 'Acudiente',
                icon: 'mdi-human-male-child',
                profile: 'secretaria',
                visible: true,
                component: Pariente
            },

            { 
                path: 'tipo-falta',
                name: 'tipo-falta',
                label: 'Tipo Faltas',
                icon: 'mdi-account-alert-outline',
                profile: 'secretaria',
                visible: true,
                component: TipoFalta
            },

            { 
                path: 'tipo-sancion',
                name: 'tipo-sancion',
                label: 'Tipo Sancion',
                icon: 'mdi-gavel',
                profile: 'secretaria',
                visible: true,
                component: TipoSancion
            },


            



            /* { 
                path: 'clase',
                name: 'clase',
                label: 'Clase',
                icon: 'mdi-google-classroom',
                profile: 'secretaria',
                visible: true,
                component: Clase
            },  */

           /*  { 
                path: 'inasistencia',
                name: 'Inasistencia',
                label: 'Asistencia',
                icon: 'mdi-format-list-checks',
                profile: 'secretaria',
                visible: true,
                component: Inasistencia
            }, */

            { 
                path: 'parentesco',
                name: 'parentesco',
                label: 'Parentesco',
                icon: 'mdi-account-supervisor-circle',
                profile: 'secretaria',
                visible: true,
                component: Parentesco
            },

            { 
                path: 'estado-civil',
                name: 'estado-civil',
                label: 'Estado Civil',
                icon: 'mdi-ring',
                profile: 'secretaria',
                visible: true,
                component: EstadoCivil
            },

            { 
                path: 'tipoTelefono',
                name: 'tipoTelefono',
                label: 'Tipo Telefono',
                icon: 'mdi-phone-log',
                profile: 'secretaria',
                visible: true,
                component: TipoTelefono
            },

            
            { 
                path: 'pais',
                name: 'pais',
                label: 'Pais',
                icon: 'mdi-earth',
                profile: 'secretaria',
                visible: true,
                component: Pais
            },
            { 
                path: 'departamento',
                name: 'departamento',
                label: 'Departamento',
                icon: 'mdi-map-search',
                profile: 'secretaria',
                visible: true,
                component: Departamento
            },
            { 
                path: 'ciudad',
                name: 'ciudad',
                label: 'Ciudad',
                icon: 'mdi-city-variant',
                component: Ciudad
            },
            { 
                path: 'zona',
                name: 'zona',
                label: 'Zona',
                icon: 'mdi-select-marker',
                profile: 'secretaria',
                visible: true,
                component: Zona
            },
            { 
                path: 'comuna',
                name: 'comuna',
                label: 'Comuna',
                icon: 'mdi-map-marker-radius',
                profile: 'secretaria',
                visible: true,
                component: Comuna
            },

            {
                path: 'usuario',
                name: 'usuario',
                label: 'Usuario',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                component: Usuario
            }, 
            { 
                path: 'modulo',
                name: 'modulo',
                label: 'Modulo',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                component: Modulo
            }, 
            { 
                path: 'menu',
                name: 'menu',
                label: 'Menu',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                component: Menu
            },

            { 
                path: 'tipoUsuario',
                name: 'tipoUsuario',
                label: 'Tipo Usuario',
                icon: 'mdi-book-account',
                profile: 'secretaria',
                visible: true,
                component: TipoUsuario
            },

            { 
                path: 'perfil',
                name: 'perfil',
                label: 'Perfil',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                component: Perfil
            },
            { 
                path: 'usuario-perfil',
                name: 'usuario-perfil',
                label: 'Usuario Perfil',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                component: UsuarioPerfil
            },
            { 
                path: 'permiso',
                name: 'permiso',
                label: 'Permiso',
                icon: 'mdi-account',
                profile: 'secretaria',
                visible: true,
                component: Permiso
            },

            { 
                path: 'documento',
                name: 'documento',
                label: 'Documento',
                icon: 'mdi-card-account-details',
                profile: 'secretaria',
                visible: true,
                component: Documento
            },
            { 
                path: 'foto',
                name: 'foto',
                label: 'Foto',
                icon: 'mdi-image',
                profile: 'secretaria',
                visible: true,
                component: Foto
            },
            
           
          /*   { 
                path: 'pago',
                name: 'pago',
                label: 'Pago',
                icon: 'mdi-credit-card-settings',
                profile: 'secretaria',
                visible: true,
                component: Pago
            }, */
            
   
          
           /*  { 
                path: 'tipo-contacto',
                name: 'tipo-contacto',
                label: 'Tipo Contacto',
                icon: 'mdi-contacts',
                profile: 'secretaria',
                visible: true,
                component: TipoContacto 
            }, */
            { 
                path: 'contacto',
                name: 'contacto',
                label: 'Contacto',
                icon: 'mdi-contacts',
                profile: 'secretaria',
                visible: true,
                component: Contacto
            },
            { 
                path: 'status',
                name: 'status',
                label: 'Status',
                icon: 'mdi-playlist-check',
                profile: 'secretaria',
                visible: true,
                component: Status
            },
           /*  { 
                path: 'suscripcion',
                name: 'suscripcion',
                label: 'Suscripcion',
                icon: 'mdi-file-document-edit',
                profile: 'secretaria',
                visible: true,
                component: Suscripcion
            }, */
         /*    { 
                path: 'telefono',
                name: 'telefono',
                label: 'Telefono',
                icon: 'mdi-phone',
                profile: 'secretaria',
                visible: true,
                component: Telefono
            }, */
            { 
                path: 'tipoFoto',
                name: 'tipoFoto',
                label: 'Tipo Foto',
                icon: 'mdi-image-album',
                profile: 'secretaria',
                visible: true,
                component: TipoFoto
            },
          /*   { 
                path: 'tipoPago',
                name: 'tipoPago',
                label: 'Tipo Pago',
                icon: 'mdi-credit-card-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoPago
            }, */
           
           
           
            

            { 
                path: 'tipo-documento',
                name: 'tipo-documento',
                label: 'Tipo Documento',
                icon: 'mdi-card-account-details',
                profile: 'secretaria',
                visible: true,
                component: TipoDocumento
            },

            { 
                path: 'tipo-archivo',
                name: 'tipo-archivo',
                label: 'Tipo Archivo',
                icon: 'mdi-file-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoArchivo
            },

            { 
                path: 'archivo',
                name: 'archivo',
                label: 'Archivo',
                icon: 'mdi-file',
                profile: 'secretaria',
                visible: true,
                component: Archivo
            },

            { 
                path: 'tipo-recurso',
                name: 'tipo-recurso',
                label: 'Tipo Recurso',
                icon: 'mdi-book-open-page-variant',
                profile: 'secretaria',
                visible: true,
                component: TipoRecurso
            },

            { 
                path: 'recurso',
                name: 'recurso',
                label: 'Recurso',
                icon: 'mdi-book-open-page-variant',
                profile: 'secretaria',
                visible: true,
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
                component: TipoDestinatario
            },

            { 
                path: 'tipo-prioridad',
                name: 'tipo-prioridad',
                label: 'Prioridad',
                icon: 'mdi-alert',
                profile: 'secretaria',
                visible: true,
                component: TipoPrioridad
            },

            { 
                path: 'tipo-notificacion',
                name: 'tipo-notificacion',
                label: 'Tipo Notificacion',
                icon: 'mdi-bell-outline',
                profile: 'secretaria',
                visible: true,
                component: TipoNotificacion
            },

            { 
                path: 'notificacion',
                name: 'notificacion',
                label: 'Notificaciones',
                icon: 'mdi-bell',
                profile: 'secretaria',
                visible: true,
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
                component: TipoMensaje
            },

            { 
                path: 'mensaje',
                name: 'mensaje',
                label: 'Mensajes',
                icon: 'mdi-email',
                profile: 'secretaria',
                visible: true,
                component: Mensaje
            },

            { 
                path: 'asistente',
                name: 'asistente',
                label: 'Asistente',
                icon: 'mdi-head-cog',
                profile: 'secretaria',
                visible: true,
                component: Asistente
            },
            
            /********************** */

            /** prueba **/

            { 
                path: 'tipo-pregunta',
                name: 'tipo-pregunta',
                label: 'Tipo Preguntas',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                component: TipoPregunta
            },
            { 
                path: 'prueba',
                name: 'prueba',
                label: 'Prueba',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                component: Prueba
            },
            { 
                path: 'pregunta',
                name: 'pregunta',
                label: 'Pregunta',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                component: Pregunta
            },
            { 
                path: 'respuesta',
                name: 'respuesta',
                label: 'Respuesta',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                component: Respuesta
            },
            { 
                path: 'prueba-alumno',
                name: 'prueba-alumno',
                label: 'Prueba Alumno',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                component: PruebaAlumno
            },
            { 
                path: 'respuesta-alumno',
                name: 'respuesta-alumno',
                label: 'Respuesta Alumno',
                icon: 'mdi-order-bool-descending-variant',
                profile: 'secretaria',
                visible: true,
                component: RespuestaAlumno
            },


            //libro
            { 
                path: 'tema',
                name: 'tema',
                label: 'Tema',
                icon: 'mdi-card-text',
                profile: 'secretaria',
                visible: true,
                component: Tema
            }, 

            { 
                path: 'tema-enlace',
                name: 'tema-enlace',
                label: 'Tema Enlace',
                icon:  'mdi-link-variant-plus',
                profile: 'secretaria',
                visible: true,
                component: TemaEnlace
            }, 

            { 
                path: 'tipo-enlace',
                name: 'tipo-enlace',
                label: 'Tipo Enlace',
                icon: 'mdi-link-variant-plus', 
                profile: 'secretaria',
                visible: true,
                component: TipoEnlace
            }, 

            { 
                path: 'enlace',
                name: 'enlace',
                label: 'Enlace',
                icon: 'mdi-link-variant',
                profile: 'secretaria',
                visible: true,
                component: Enlace
            }, 


            { 
                path: 'recurso-categoria',
                name: 'recurso-categoria',
                label: 'Recurso Categoria',
                icon: 'mdi-book-open-page-variant',
                profile: 'secretaria',
                visible: true,
                component: RecursoCategoria
            }, 

            { 
                path: 'tema-recurso',
                name: 'tema-recurso',
                label: 'Tema Recurso',
                icon: 'mdi-book-open-page-variant',
                profile: 'secretaria',
                visible: true,
                component: TemaRecurso
            }, 

            { 
                path: 'libro',
                name: 'libro',
                label: 'Libro',
                icon: 'mdi-book',
                profile: 'secretaria',
                visible: true,
                component: Libro
            }, 

            { 
                path: 'pagina',
                name: 'pagina',
                label: 'Pagina',
                icon: 'mdi-file-document',
                profile: 'secretaria',
                visible: true,
                component: Pagina
            }, 

            { 
                path: 'actividad',
                name: 'actividad',
                label: 'Actividad',
                icon: 'mdi-rocket',
                profile: 'secretaria',
                visible: true,
                component: Actividad
            }, 



            /////
            

           

            
            

    /*         { 
                path: 'tipo-actividad',
                name: 'Tipo-actividad',
                label: 'Tipo Actividad ',
                icon: 'mdi-head-plus',
                profile: 'secretaria',
                visible: true,
                component: TipoActividad
            },  */
            /* { 
                path: 'tipo-accion',
                name: 'tipo-accion',
                label: 'Tipo Accion',
                icon: 'mdi-rocket',
                profile: 'secretaria',
                visible: true,
                component: TipoAccion
            },  */

            /* { 
                path: 'accion-pagina',
                name: 'accion-pagina',
                label: 'Accion Pagina',
                icon: 'mdi-rocket-launch',
                profile: 'secretaria',
                visible: true,
                component: AccionPagina
            }, 

            { 
                path: 'accion-tema',
                name: 'accion-tema',
                label: 'mdi-rocket-launch',
                icon: 'mdi-rocket-launch-outline',
                profile: 'secretaria',
                visible: true,
                component: AccionTema
            },  */

            //CONFIGURACION


            { 
                path: 'configuracion',
                name: 'configuracion',
                label: 'Variables Globales',
                icon: 'mdi-cogs',
                profile: 'secretaria',
                visible: true,
                component: Configuracion
            },

            

            { 
                path: 'meet-alumno',
                name: 'meet-alumno',
                label: 'Clase Alumno',
                icon: 'mdi-google-classroom',
                profile: 'secretaria',
                visible: true,
                component: MeetAlumno
            },

            //reporte
            /* { 
                path: 'reporte',
                name: 'reporte',
                label: 'Reporte',
                icon: 'mdi-table-large',
                profile: 'secretaria',
                visible: true,
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
            component: Crud,
        },
        {
            path: '/login',
            name: 'login',
            label: 'Login',
            icon: 'mdi-account',
            profile: '*',
            visible: false,
            component: Login,
        },
        {
            path: '/recover-password',
            name: 'recover-password',
            label: 'Recover password',
            icon: 'mdi-account',
            profile: '*',
            visible: false,
            component: RecoverPassword,
        },
        { 
            path: "*", 
            name: 'notfound',
            label: 'Not Found',
            profile: '*',
            visible: false,
            component: PageNotFound 
        }
    ]
})


