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
import MenuProfesor          from '@pages/bandejaProfesor/index.vue'; 
import MenuRepresentante     from '@pages/bandejaRepresentante/index.vue'; 

import BandejaAdmin          from '@pages/admin/dashboard.vue';
import BandejaAlumno         from '@pages/bandejaAlumno/dashboard.vue';
import BandejaProfesor       from '@pages/bandejaProfesor/dashboard.vue';
import BandejaRepresentante  from '@pages/bandejaRepresentante/dashboard.vue';

// loading on demand
import Asistente         from '@pages/asistente/asistente.vue';
import TipoColegio       from '@pages/tipoColegio/tipoColegio.vue';
import Jornada           from '@pages/jornada/jornada.vue';
import Calendario        from '@pages/calendario/calendario.vue';
import Turno             from '@pages/turno/turno.vue';

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
import PlanEvaluacion    from '@pages/planEvaluacion/planEvaluacion.vue'; 
import DetalleEvaluacion from '@pages/detalleEvaluacion/detalleEvaluacion.vue'; 


import AreaEstudio       from '@pages/areaEstudio/areaEstudio.vue';
import Materia           from '@pages/materia/materia.vue';

import Docente           from '@pages/docente/docente.vue';
import Alumno            from '@pages/alumno/alumno.vue';

import GradoAlumno       from '@pages/gradoAlumno/gradoAlumno.vue';
import GrupoAlumno       from '@pages/grupoAlumno/grupoAlumno.vue';

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

import EstadoCivil       from '@pages/estadoCivil/estadoCivil.vue';
const Parentesco         =  () => import('@pages/parentesco/parentesco.vue');



import Usuario          from '@pages/usuario/usuario.vue';
import Modulo           from '@pages/modulo/modulo.vue';
import Menu             from '@pages/menu/menu.vue';
import Perfil           from '@pages/perfil/perfil.vue';
import UsuarioPerfil    from '@pages/usuarioPerfil/usuarioPerfil.vue';
import Permiso          from '@pages/permiso/permiso.vue';


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
            profile: '*',
            visible: true,
            component: Home,
        },
        {
            path: '/bandeja-profesor',
            label: 'Docente',
            icon: 'mdi-account-tie',
            profile: 'docente',
            visible: true,
            component: MenuProfesor,

            children: [
                {
                    path: '',
                    name: 'bandeja-profesor',
                    label: 'Bandeja',
                    icon:   'mdi-tray-full',
                    profile: 'docente',
                    visible: true,
                    component: BandejaProfesor,
                }
            ]
        },
        {
            path: '/bandeja-alumno',
            label: 'Alumno',
            icon: 'mdi-face',
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
                }
            ]
        },
        {
            path: '/bandeja-representante',
            label: 'Representante',
            icon: 'mdi-human-male-child',
            profile: 'acudiente',
            visible: true,
            component: MenuRepresentante,

            children: [
                {
                    path:  '',
                    name:  'bandeja-representante',
                    label: 'Bandeja',
                    icon:  'mdi-tray-full',
                    profile: 'acudiente',
                    visible: true,
                    component: BandejaRepresentante,
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
                path: 'asistente',
                name: 'asistente',
                label: 'Asistente',
                icon: 'mdi-head-cog',
                profile: 'secretaria',
                visible: true,
                component: Asistente
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
                name: 'cargos',
                label: 'Cargos',
                icon: 'mdi-account-settings',
                profile: 'secretaria',
                visible: true,
                component: Cargos
            },
            { 
                path: 'tipoDirectiva',
                name: 'tipoDirectiva',
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
                path: 'jornada',
                name: 'jornada',
                label: 'Jornadas',
                icon: 'mdi-calendar-clock',
                profile: 'secretaria',
                visible: true,
                component: Jornada
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
                path: 'carga-horaria',
                name: 'carga-horaria',
                label: 'Carga Horaria',
                icon: 'mdi-clock',
                profile: 'secretaria',
                visible: true,
                component: CargaHoraria
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
                icon: 'mdi-file-cad-box',
                profile: 'secretaria',
                visible: true,
                component: Materia
            },
            { 
                path: 'gradoMateria',
                name: 'gradoMateria',
                label: 'Grado Materias',
                icon: 'mdi-square-root',
                profile: 'secretaria',
                visible: true,
                component: GradoMateria
            },
            { 
                path: 'grupo-calificacion',
                name: 'grupo-calificacion',
                label: 'Grupo Calificaciones',
                icon: 'mdi-check-box-multiple-outline',
                profile: 'secretaria',
                visible: true,
                component: GrupoCalificacion
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
                component: Calificacion
            },

            { 
                path: 'tipo-evaluacion',
                name: 'tipo-evaluacion',
                label: 'Tipo Evaluacion',
                icon: 'mdi-clipboard-check-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoEvaluacion
            },

            { 
                path: 'plan-evaluacion',
                name: 'plan-evaluacion',
                label: 'Plan Evaluacion',
                icon: 'mdi-clipboard-check-multiple-outline',
                profile: 'secretaria',
                visible: true,
                component: PlanEvaluacion
            },

            { 
                path: 'detalle-evaluacion',
                name: 'detalle-evaluacion',
                label: 'Detalle Evaluacion',
                icon: 'mdi-clipboard-file',
                profile: 'secretaria',
                visible: true,
                component: DetalleEvaluacion
            },


            


            /**************************** */
            { 
                path: 'alumno',
                name: 'alumno',
                label: 'Alumnos',
                icon: 'mdi-face',
                profile: 'secretaria',
                visible: true,
                component: Alumno
            },

            { 
                path: 'grado-alumno',
                name: 'grado-alumno',
                label: 'Grado Alumnos',
                icon: 'mdi-face-recognition',
                profile: 'secretaria',
                visible: true,
                component: GradoAlumno
            },

            { 
                path: 'grupo-alumno',
                name: 'grupo-alumno',
                label: 'Grupo Alumnos',
                icon: 'mdi-face-recognition',
                profile: 'secretaria',
                visible: true,
                component: GrupoAlumno
            },

            { 
                path: 'clase',
                name: 'clase',
                label: 'Clase',
                icon: 'mdi-google-classroom',
                profile: 'secretaria',
                visible: true,
                component: Clase
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
                path: 'inasistencia',
                name: 'Inasistencia',
                label: 'Inasistencia',
                icon: 'mdi-playlist-remove',
                profile: 'secretaria',
                visible: true,
                component: Inasistencia
            },
            { 
                path: 'pago',
                name: 'pago',
                label: 'Pago',
                icon: 'mdi-credit-card-settings',
                profile: 'secretaria',
                visible: true,
                component: Pago
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
                path: 'docente',
                name: 'docente',
                label: 'Docente',
                icon: 'mdi-account-tie',
                profile: 'secretaria',
                visible: true,
                component: Docente
            },
            { 
                path: 'tipo-contacto',
                name: 'tipo-contacto',
                label: 'Tipo Contacto',
                icon: 'mdi-contacts',
                profile: 'secretaria',
                visible: true,
                component: TipoContacto 
            },
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
            { 
                path: 'suscripcion',
                name: 'suscripcion',
                label: 'Suscripcion',
                icon: 'mdi-file-document-edit',
                profile: 'secretaria',
                visible: true,
                component: Suscripcion
            },
            { 
                path: 'telefono',
                name: 'telefono',
                label: 'Telefono',
                icon: 'mdi-phone',
                profile: 'secretaria',
                visible: true,
                component: Telefono
            },
            { 
                path: 'tipoFoto',
                name: 'tipoFoto',
                label: 'Tipo Foto',
                icon: 'mdi-image-album',
                profile: 'secretaria',
                visible: true,
                component: TipoFoto
            },
            { 
                path: 'tipoPago',
                name: 'tipoPago',
                label: 'Tipo Pago',
                icon: 'mdi-credit-card-multiple',
                profile: 'secretaria',
                visible: true,
                component: TipoPago
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
                path: 'tipoUsuario',
                name: 'tipoUsuario',
                label: 'Tipo Usuario',
                icon: 'mdi-book-account',
                profile: 'secretaria',
                visible: true,
                component: TipoUsuario
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
                path: 'parentesco',
                name: 'parentesco',
                label: 'Parentesco',
                icon: 'mdi-account-supervisor-circle',
                profile: 'secretaria',
                visible: true,
                component: Parentesco
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
                label: 'archivo',
                icon: 'mdi-file',
                profile: 'secretaria',
                visible: true,
                component: Archivo
            },
            
            /********************** */

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
                path: 'configuracion',
                name: 'configuracion',
                label: 'Configurar',
                icon: 'mdi-cogs',
                profile: 'secretaria',
                visible: true,
                component: Configuracion
            },
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


