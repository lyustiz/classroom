import Vue    from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import Welcome          from  '@pages/welcome/Welcome.vue';
//import Admin            from  '@pages/admin/Dashboard.vue';

/*
import SelectCuenta     from  '@pages/registro/SelectCuenta.vue';
import RegistroComercio from  '@pages/registro/RegistroComercio.vue';
import RegistroUsuario  from  '@pages/registro/RegistroUsuario.vue';
import Verify           from  '@pages/registro/Verify.vue';
import Login            from  '@pages/login/Login.vue';
import Authentication   from  '@pages/login/Authentication.vue';
import RecoverPassword  from  '@pages/login/RecoverPassword.vue'; 
*/
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

import AreaEstudio       from '@pages/areaEstudio/areaEstudio.vue';
import Materia           from '@pages/materia/materia.vue';

import Docente           from '@pages/docente/docente.vue';
import Alumno            from '@pages/alumno/alumno.vue';

import Ciudad            from '@pages/ciudad/ciudad.vue';
import Clase             from '@pages/clase/clase.vue';
import Colegio           from '@pages/colegio/colegio.vue';
import Comuna            from '@pages/comuna/comuna.vue';
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
import Profesor          from '@pages/profesor/profesor.vue';
import ProfesorMateria   from '@pages/profesorMateria/profesorMateria.vue';
import Status            from '@pages/status/status.vue';
import Suscripcion       from '@pages/suscripcion/suscripcion.vue';
import Telefono          from '@pages/telefono/telefono.vue';
 
import TipoDirectiva     from '@pages/tipoDirectiva/tipoDirectiva.vue';
import TipoFoto          from '@pages/tipoFoto/tipoFoto.vue';
import TipoPago          from '@pages/tipoPago/tipoPago.vue';
import TipoTelefono      from '@pages/tipoTelefono/tipoTelefono.vue';
import TipoUsuario       from '@pages/tipoUsuario/tipoUsuario.vue';
import Usuario           from '@pages/usuario/usuario.vue';
import Zona              from '@pages/zona/zona.vue';

import EstadoCivil       from '@pages/estadoCivil/estadoCivil.vue';
const Parentesco         =  () => import('@pages/parentesco/parentesco.vue');


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
          label: 'Inicio',
          icon: 'mdi-home',
          component: Welcome,
        },
        {
            path: '/bandeja-profesor',
            label: 'Docente',
            icon: 'mdi-account-tie',
            component: MenuProfesor,

            children: [
                {
                    path: '',
                    name: 'bandeja-profesor',
                    label: 'Bandeja',
                    icon:   'mdi-tray-full',
                    component: BandejaProfesor,
                }
            ]
        },
        {
            path: '/bandeja-alumno',
            label: 'Alumno',
            icon: 'mdi-face',
            component: MenuAlumno,
            
            children: [
                {
                    path: '',
                    name: 'bandeja-alumno',
                    label: 'Bandeja',
                    icon:   'mdi-tray-full',
                    component: BandejaAlumno,
                }
            ]
        },
        {
            path: '/bandeja-representante',
            label: 'Representante',
            icon: 'mdi-human-male-child',
            component: MenuRepresentante,

            children: [
                {
                    path:  '',
                    name:  'bandeja-representante',
                    label: 'Bandeja',
                    icon:  'mdi-tray-full',
                    component: BandejaRepresentante,
                }
            ]
        },
        {
          path: '/admin',
          label: 'Administrador',
          icon: 'mdi-shield-account',
          component: MenuAdmin,
          children: [
             { 
                path: '/',
                name: 'admin-dashboard',
                label: 'Configuracion General',
                icon: 'mdi-cog',
                component: BandejaAdmin
            }, 
            { 
                path: 'asistente',
                name: 'asistente',
                label: 'Asistente',
                icon: 'mdi-head-cog',
                component: Asistente
            },
            { 
                path: 'colegio',
                name: 'colegio',
                label: 'Colegio',
                icon: 'mdi-store',
                component: Colegio
            },
            { 
                path: 'tipoColegio',
                name: 'tipoColegio',
                label: 'Tipo Colegio',
                icon: 'mdi-bookmark-multiple',
                component: TipoColegio
            },
            { 
                path: 'cargos',
                name: 'cargos',
                label: 'Cargos',
                icon: 'mdi-account-settings',
                component: Cargos
            },
            { 
                path: 'tipoDirectiva',
                name: 'tipoDirectiva',
                label: 'Tipo Directiva',
                icon: 'mdi-account-group-outline',
                component: TipoDirectiva
            },
            { 
                path: 'directiva',
                name: 'directiva',
                label: 'Directiva',
                icon: 'mdi-account-group',
                component: Directiva
            },
            { 
                path: 'estructura',
                name: 'estructura',
                label: 'Estructura',
                icon: 'mdi-floor-plan',
                component: Estructura
            },
            { 
                path: 'aula',
                name: 'aula',
                label: 'Aulas',
                icon: 'mdi-chair-school',
                component: Aula
            },
            { 
                path: 'empleado',
                name: 'empleado',
                label: 'Empleados',
                icon: 'mdi-badge-account',
                component: Empleado
            },
            { 
                path: 'calendario',
                name: 'calendario',
                label: 'Calendario',
                icon: 'mdi-calendar-blank',
                component: Calendario
            },
            { 
                path: 'periodo',
                name: 'periodo',
                label: 'Periodos',
                icon: 'mdi-calendar-weekend',
                component: Periodo
            },
            { 
                path: 'jornada',
                name: 'jornada',
                label: 'Jornadas',
                icon: 'mdi-calendar-clock',
                component: Jornada
            },
            { 
                path: 'turno',
                name: 'turno',
                label: 'Turnos',
                icon: 'mdi-timelapse',
                component: Turno
            },
            { 
                path: 'hora-academica',
                name: 'hora-academica',
                label: 'Horas Academicas',
                icon: 'mdi-clock',
                component: HoraAcademica
            },

            { 
                path: 'carga-horaria',
                name: 'carga-horaria',
                label: 'Carga Horaria',
                icon: 'mdi-clock',
                component: CargaHoraria
            },
            { 
                path: 'nivel',
                name: 'nivel',
                label: 'Niveles',
                icon: 'mdi-stairs-up',
                component: Nivel
            },
            { 
                path: 'grado',
                name: 'grado',
                label: 'Grados',
                icon: 'mdi-numeric',
                component: Grado
            },
            { 
                path: 'grupo',
                name: 'grupo',
                label: 'Grupos',
                icon: 'mdi-alphabetical-variant',
                component: Grupo
            },
            { 
                path: 'area-estudio',
                name: 'area-estudio',
                label: 'Areas de Estudio',
                icon: 'mdi-file-cad',
                component: AreaEstudio
            },
            { 
                path: 'materia',
                name: 'materia',
                label: 'Materias',
                icon: 'mdi-file-cad-box',
                component: Materia
            },
            { 
                path: 'gradoMateria',
                name: 'gradoMateria',
                label: 'Grado Materias',
                icon: 'mdi-square-root',
                component: GradoMateria
            },
            { 
                path: 'grupo-calificacion',
                name: 'grupo-calificacion',
                label: 'Grupo Calificaciones',
                icon: 'mdi-check-box-multiple-outline',
                component: GrupoCalificacion
            },
            { 
                path: 'nivel-calificacion',
                name: 'nivel-calificacion',
                label: 'Nivel Calificaciones',
                icon: 'mdi-check-box-multiple-outline',
                component: NivelCalificacion
            },
            { 
                path: 'calificacion',
                name: 'calificacion',
                label: 'Calificacion',
                icon: 'mdi-check-box-outline',
                component: Calificacion
            },


            /**************************** */
            { 
                path: 'alumno',
                name: 'alumno',
                label: 'Alumnos',
                icon: 'mdi-face',
                component: Alumno
            },


            { 
                path: 'clase',
                name: 'clase',
                label: 'Clase',
                icon: 'mdi-google-classroom',
                component: Clase
            },
            { 
                path: 'documento',
                name: 'documento',
                label: 'Documento',
                icon: 'mdi-card-account-details',
                component: Documento
            },
            { 
                path: 'foto',
                name: 'foto',
                label: 'Foto',
                icon: 'mdi-image',
                component: Foto
            },
            { 
                path: 'horario',
                name: 'horario',
                label: 'Horario',
                icon: 'mdi-calendar-multiselect',
                component: Horario
            },
            { 
                path: 'inasistencia',
                name: 'Inasistencia',
                label: 'Inasistencia',
                icon: 'mdi-playlist-remove',
                component: Inasistencia
            },
            { 
                path: 'pago',
                name: 'pago',
                label: 'Pago',
                icon: 'mdi-credit-card-settings',
                component: Pago
            },
            
            { 
                path: 'pariente',
                name: 'pariente',
                label: 'Pariente',
                icon: 'mdi-human-male-child',
                component: Pariente
            },
/*             { 
                path: 'profesor',
                name: 'profesor',
                label: 'Profesor',
                icon: 'mdi-account-tie',
                component: Profesor
            }, */
            { 
                path: 'docente',
                name: 'docente',
                label: 'Docente',
                icon: 'mdi-account-tie',
                component: Docente
            },
            { 
                path: 'contacto',
                name: 'contacto',
                label: 'Contacto',
                icon: 'mdi-contacts',
                component: Contacto
            },
      /*       { 
                path: 'profesorMateria',
                name: 'profesorMateria',
                label: 'ProfesorMateria',
                icon: 'mdi-account-tie-voice',
                component: ProfesorMateria
            }, */
            { 
                path: 'status',
                name: 'status',
                label: 'Status',
                icon: 'mdi-playlist-check',
                component: Status
            },
            { 
                path: 'suscripcion',
                name: 'suscripcion',
                label: 'Suscripcion',
                icon: 'mdi-file-document-edit',
                component: Suscripcion
            },
            { 
                path: 'telefono',
                name: 'telefono',
                label: 'Telefono',
                icon: 'mdi-phone',
                component: Telefono
            },
            { 
                path: 'tipoFoto',
                name: 'tipoFoto',
                label: 'Tipo Foto',
                icon: 'mdi-image-album',
                component: TipoFoto
            },
            { 
                path: 'tipoPago',
                name: 'tipoPago',
                label: 'Tipo Pago',
                icon: 'mdi-credit-card-multiple',
                component: TipoPago
            },
            { 
                path: 'tipoTelefono',
                name: 'tipoTelefono',
                label: 'Tipo Telefono',
                icon: 'mdi-phone-log',
                component: TipoTelefono
            },
            { 
                path: 'tipoUsuario',
                name: 'tipoUsuario',
                label: 'Tipo Usuario',
                icon: 'mdi-book-account',
                component: TipoUsuario
            },
            { 
                path: 'usuario',
                name: 'usuario',
                label: 'Usuario',
                icon: 'mdi-account',
                component: Usuario
            },
            { 
                path: 'estado-civil',
                name: 'estado-civil',
                label: 'Estado Civil',
                icon: 'mdi-ring',
                component: EstadoCivil
            },
            { 
                path: 'parentesco',
                name: 'parentesco',
                label: 'Parentesco',
                icon: 'mdi-account-supervisor-circle',
                component: Parentesco
            },
            { 
                path: 'pais',
                name: 'pais',
                label: 'Pais',
                icon: 'mdi-earth',
                component: Pais
            },
            { 
                path: 'departamento',
                name: 'departamento',
                label: 'Departamento',
                icon: 'mdi-map-search',
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
                component: Zona
            },
            { 
                path: 'comuna',
                name: 'comuna',
                label: 'Comuna',
                icon: 'mdi-map-marker-radius',
                component: Comuna
            },
          ]
        },
        {
            path: '/crud',
            name: 'crud',
            label: 'Generador',
            icon: 'mdi-tools',
            component: Crud,
        },
        { 
          path: "*", 
          name: 'notfound',
          label: 'Not Found',
          component: PageNotFound 
        }
    ]
})


