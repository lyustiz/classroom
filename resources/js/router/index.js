import Vue    from 'vue'
import Router from 'vue-router'
Vue.use(Router)


//import Admin            from  '@pages/admin/Dashboard.vue';

/*
import SelectCuenta     from  '@pages/registro/SelectCuenta.vue';
import RegistroComercio from  '@pages/registro/RegistroComercio.vue';
import RegistroUsuario  from  '@pages/registro/RegistroUsuario.vue';
import Verify           from  '@pages/registro/Verify.vue';
import Authentication   from  '@pages/login/Authentication.vue';
*/



import Login                 from  '@pages/login/login.vue';
import RecoverPassword       from  '@pages/login/RecoverPassword.vue'; 

import Welcome               from  '@pages/welcome/Welcome.vue';
import Home                  from  '@pages/home/home.vue';

import MenuAdmin             from '@pages/admin/index.vue'; 
import MenuAlumno            from '@pages/bandejaAlumno/index.vue'; 
import MenuProfesor          from '@pages/bandejaDocente/index.vue'; 
import MenuAcudiente         from '@pages/bandejaAcudiente/index.vue'; 

import BandejaAdmin          from '@pages/admin/dashboard.vue';

import BandejaAlumno         from '@pages/bandejaAlumno/dashboard.vue';
import EvaluacionAlumno      from '@pages/bandejaAlumno/evaluacion/AppEvaluacionAlumno';

import BandejaDocente       from '@pages/BandejaDocente/dashboard.vue';
import BandejaAcudiente     from '@pages/bandejaAcudiente/dashboard.vue';

// loading on demand
import Asistente         from '@pages/asistente/asistente.vue';
import TipoColegio       from '@pages/tipoColegio/tipoColegio.vue';
//import Jornada         from '@pages/jornada/jornada.vue';
import Calendario        from '@pages/calendario/calendario.vue';
import Turno             from '@pages/turno/turno.vue';
import Feriado           from '@pages/feriado/feriado.vue';


import TipoAgenda        from '@pages/tipoAgenda/tipoAgenda.vue';
import TipoActividad     from '@pages/tipoActividad/tipoActividad.vue';
import Agenda            from '@pages/Agenda/Agenda.vue';

import HoraAcademica     from '@pages/horaAcademica/horaAcademica.vue';
import CargaHoraria      from '@pages/cargaHoraria/cargaHoraria.vue';

import Grado             from '@pages/grado/grado.vue';
import Cargos            from '@pages/cargo/cargo.vue';
import Empleado          from '@pages/empleado/empleado.vue';

import Estructura        from '@pages/estructura/estructura.vue';
import Aula              from '@pages/aula/aula.vue';

import GrupoCalificacion from '@pages/grupoCalificacion/grupoCalificacion.vue';
import NivelCalificacion from '@pages/nivelCalificacion/nivelCalificacion.vue';
import Calificacion      from '@pages/calificacion/calificacion.vue';

import TipoEvaluacion    from '@pages/tipoEvaluacion/tipoEvaluacion.vue';
import MetodoEvaluacion  from '@pages/evaluacionMetodo/evaluacionMetodo.vue';
import PlanEvaluacion    from '@pages/planEvaluacion/planEvaluacion.vue'; 
import AppPlanEvaluacion from '@pages/planEvaluacion/AppPlanEvaluacion.vue';

import AreaEstudio       from '@pages/areaEstudio/areaEstudio.vue';
import Materia           from '@pages/materia/materia.vue';

import Docente           from '@pages/docente/docente.vue';

import TipoCondicion     from '@pages/tipoCondicion/tipoCondicion.vue';
import Alumno            from '@pages/alumno/alumno.vue';

import TipoFalta         from '@pages/tipoFalta/tipoFalta.vue';
import TipoSancion       from '@pages/tipoSancion/tipoSancion.vue';

import Ciudad            from '@pages/ciudad/ciudad.vue';
import Clase             from '@pages/clase/clase.vue';
import AppColegio        from '@pages/colegio/AppColegio.vue';
import Comuna            from '@pages/comuna/comuna.vue';


import TipoContacto      from '@pages/tipoContacto/tipoContacto.vue';
import Contacto          from '@pages/contacto/contacto.vue';

import Departamento      from '@pages/departamento/departamento.vue';
import Directiva         from '@pages/directiva/directiva.vue';
import Documento         from '@pages/documento/documento.vue';
import Foto              from '@pages/foto/foto.vue';
import GradoMateria      from '@pages/gradoMateria/gradoMateria.vue';
import Grupo             from '@pages/grupo/grupo.vue';
import Horario           from '@pages/horario/horario.vue';
import Inasistencia      from '@pages/inasistencia/inasistencia.vue';
import Nivel             from '@pages/nivel/nivel.vue';
import Pago              from '@pages/pago/pago.vue';
import Pais              from '@pages/pais/pais.vue';
import Pariente          from '@pages/pariente/pariente.vue';
import Periodo           from '@pages/periodo/periodo.vue';
import Status            from '@pages/status/status.vue';
import Suscripcion       from '@pages/suscripcion/suscripcion.vue';
import Telefono          from '@pages/telefono/telefono.vue';
 
import TipoDirectiva     from '@pages/tipoDirectiva/tipoDirectiva.vue';
import TipoFoto          from '@pages/tipoFoto/tipoFoto.vue';
import TipoPago          from '@pages/tipoPago/tipoPago.vue';
import TipoTelefono      from '@pages/tipoTelefono/tipoTelefono.vue';
import TipoUsuario       from '@pages/tipoUsuario/tipoUsuario.vue';

import Zona              from '@pages/zona/zona.vue';


import TipoDocumento     from '@pages/tipoDocumento/tipoDocumento.vue';

import TipoArchivo       from '@pages/tipoArchivo/tipoArchivo.vue';
import Archivo           from '@pages/archivo/archivo.vue';
import Configuracion     from '@pages/configuracion/configuracion.vue';

import TipoRecurso       from '@pages/tipoRecurso/tipoRecurso.vue';
import Recurso           from '@pages/recurso/recurso.vue';

import EstadoCivil       from '@pages/estadoCivil/estadoCivil.vue';
const Parentesco         =  () => import('@pages/parentesco/parentesco.vue');



import Usuario          from '@pages/usuario/usuario.vue';
import Modulo           from '@pages/modulo/modulo.vue';
import Menu             from '@pages/menu/menu.vue';
import Perfil           from '@pages/perfil/perfil.vue';
import UsuarioPerfil    from '@pages/usuarioPerfil/usuarioPerfil.vue';
import Permiso          from '@pages/permiso/permiso.vue';


//prueba
import TipoPregunta     from '@pages/tipoPregunta/tipoPregunta.vue'; 
import Prueba           from '@pages/prueba/prueba.vue';
import Pregunta         from '@pages/pregunta/pregunta.vue';
import Respuesta        from '@pages/respuesta/respuesta.vue';
import PruebaAlumno     from '@pages/pruebaAlumno/pruebaAlumno.vue';
import RespuestaAlumno  from '@pages/respuestaAlumno/respuestaAlumno.vue';


//notificaciones
import TipoDestinatario from '@pages/tipoDestinatario/tipoDestinatario.vue';
import TipoPrioridad    from '@pages/tipoPrioridad/tipoPrioridad.vue';
import TipoNotificacion from '@pages/tipoNotificacion/TipoNotificacion.vue';
import Notificacion     from '@pages/notificacion/notificacion.vue';

import TipoMensaje      from '@pages/tipoMensaje/TipoMensaje.vue';
import Mensaje          from '@pages/mensaje/Mensaje.vue';

import MeetDocente      from '@components/meet/docente/meetDocente.vue';
import MeetAlumno       from '@components/meet/alumno/meetAlumno.vue';

//report
/* import AppReporte       from '@pages/reportes/AppReporte.vue' */

//tools
import PageNotFound     from  '@pages/404/NotFound.vue'
import Crud             from  '@pages/crud/crud.vue'

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
                }
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
                    path: 'alumno-evaluacion-alumno',
                    name: 'alumno-evaluacion-alumno',
                    label: 'Evaluaciones',
                    icon:   'mdi-clipboard-check-multiple-outline',
                    profile: 'alumno',
                    visible: true,
                    component: EvaluacionAlumno,
                }
                
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
                path: 'tipo-actividad',
                name: 'tipo-actividad',
                label: 'Tipo Actividad ',
                icon: 'mdi-clipboard-text-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoActividad
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
                icon: 'mdi-calendar-multiselect',
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

            { 
                path: 'inasistencia',
                name: 'Inasistencia',
                label: 'Asistencia',
                icon: 'mdi-format-list-checks',
                profile: 'secretaria',
                visible: true,
                component: Inasistencia
            },

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
                path: 'meet-docente',
                name: 'meet-docente',
                label: 'Clase Docente',
                icon: 'mdi-google-classroom',
                profile: 'secretaria',
                visible: true,
                component: MeetDocente
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


