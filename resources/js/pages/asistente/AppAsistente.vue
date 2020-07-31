<template>
      <v-bottom-sheet :value="showAsistente" persistent hide-overlay content-class="asistente-container">
      
      <v-btn fab fixed x-small class="mt-n6 mx-2" color="red" dark @click="closeAsistente()" right>
          <v-icon>close</v-icon>
      </v-btn>


     <v-sheet
    class="mx-auto"
    elevation="8"
    max-width="100vw"
  >
    <v-slide-group
      v-model="stepper"
      class="pa-2"
      center-active
      show-arrows
    >
      <v-slide-item
        v-for="(step, idx) in steps" :key="idx"
        v-slot:default="{ active, toggle }"
      >
        <v-card
          :color="active ? `${step.color}` : `${step.color} lighten-3`"
          class="ma-4"
          height="50"
          width="50"
          @click="toggle"
        >
         
          <v-row class="fill-height" align="center" justify="center" >
            
            <v-menu :value="active" bottom :close-on-content-click="false" absolute :position-y="60">
        
                <v-card max-width="350" min-height="300">
                    <v-card-title primary-title :class="`${step.color} white--text`">
                        {{step.label}}
                    </v-card-title>
                    <v-card-text>
                        <v-row>
                            <v-col cols="12">{{step.detail}}</v-col>
                            <v-col cols="12">
                                <v-sheet color="amber lighten-3" class="pa-2 rounded text-justify">{{step.warnings}} </v-sheet>
                            </v-col>
                        </v-row>
                    </v-card-text>
                    <v-card-actions>
                       
                        <v-btn
                            color="primary"
                            x-small fab
                             @click="prev()" >
                            <v-icon>mdi-arrow-left-bold</v-icon>
                        </v-btn>

                        <v-spacer></v-spacer>
                        <v-btn
                            color="success"
                            small
                             @click="navegateToName(step.route)" >
                            <v-icon class="mr-2">{{step.icon}}</v-icon>
                            Ir al modulo
                        </v-btn>

                        <v-spacer></v-spacer>

                        <v-btn
                            color="primary"
                            x-small fab
                             @click="next()" >
                            <v-icon >mdi-arrow-right-bold</v-icon>
                        </v-btn>

                    </v-card-actions>
                    
                </v-card>
                
            </v-menu>
            
            
            <v-tooltip top>
                <template v-slot:activator="{ on }">
                    <v-icon color="white" v-on="on" size="38">{{step.icon}}</v-icon>
                </template>
                <span>{{step.label}}</span>
            </v-tooltip>

          </v-row>

        </v-card>
      </v-slide-item>
    </v-slide-group>
  </v-sheet>


    </v-bottom-sheet>
</template>

<script>
export default {

    data: () =>
    ({
        steps: [
            { label: 'Institucion',      color: 'orange',  route: 'colegio',         resource: 'colegio',        icon: 'mdi-store',                            warnings: 'Se define el calendario vigente que influira en todas las fechas de carga', detail: 'Podra cargar la informacion general, logo, informacion de ubicacion y contacto de la institucion'   },
            { label: 'Cargos',           color: 'orange',  route: 'cargo',           resource: 'cargo',          icon: 'mdi-account-settings',                 warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Tipo Directiva',   color: 'orange',  route: 'tipo-directiva',  resource: 'tipo_directiva', icon: 'mdi-account-group-outline',            warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Directiva',        color: 'orange',  route: 'directiva',       resource: 'directiva',      icon: 'mdi-account-group',                    warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Empleados',        color: 'orange',  route: 'empleado',        resource: 'empleado',       icon: 'mdi-badge-account',                    warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Estructura',       color: 'orange',  route: 'estructura',      resource: 'estructura',     icon: 'mdi-floor-plan',                       warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Aulas',            color: 'orange',  route: 'aula',            resource: 'aula',           icon: 'mdi-chair-school',                     warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Calendario',       color: 'green',   route: 'calendario',      resource: 'calendario',     icon: 'mdi-calendar-blank',                   warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Periodos',         color: 'green',   route: 'periodo',         resource: 'periodo',        icon: 'mdi-calendar-weekend',                 warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Turnos',           color: 'green',   route: 'turno',           resource: 'turno',          icon: 'mdi-timelapse',                        warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Hora Academica',   color: 'green',   route: 'hora-academica',  resource: 'hora_academica', icon: 'mdi-clock',                            warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Carga Horaria',    color: 'green',   route: 'carga-horaria',   resource: 'carga_horaria',  icon: 'mdi-clock',                            warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Areas Estudio',    color: 'cyan',    route: 'area-estudio',    resource: 'area_estudio',   icon: 'mdi-file-cad',                         warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Materias',         color: 'cyan',    route: 'materia',         resource: 'materia',        icon: 'mdi-bookshelf',                        warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Nieles',           color: 'cyan',    route: 'nivel',           resource: 'nivel',          icon: 'mdi-stairs-up',                        warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Grado',            color: 'cyan',    route: 'grado',           resource: 'grado',          icon: 'mdi-numeric',                          warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Grupos',           color: 'cyan',    route: 'grupo',           resource: 'grupo',          icon: 'mdi-alphabetical-variant',             warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Docentes',         color: 'red',     route: 'docente',         resource: 'docente',        icon: 'mdi-account-tie',                      warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Tipo Evaluacion',  color: 'purple',  route: 'tipo-evaluacion', resource: 'tipo_evaluacion',icon: 'mdi-clipboard-check-multiple-outline', warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Plan Evaluacion',  color: 'purple',  route: 'plan-evaluacion', resource: 'plan_evaluacion',icon: 'mdi-clipboard-check-multiple',         warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Horario',          color: 'purple',  route: 'horario',         resource: 'horario',        icon: 'mdi-calendar-multiselect',             warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Grupo Calif.',     color: 'purple',  route: 'grupo-calificacion',   resource: 'grupo-calificacion',  icon: 'mdi-check-box-multiple-outline',       warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Nivel Calif.',     color: 'purple',  route: 'nivel-calificacion',   resource: 'nivel-calificacion',  icon: 'mdi-check-box-multiple-outline',       warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Calificacion',     color: 'purple',  route: 'calificacion',         resource: 'calificacion',        icon: 'mdi-check-box-outline',                warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Condicion Alumno', color: 'red',     route: 'tipo-condicion',  resource: 'tipo_condicion', icon: 'mdi-school-outline',                   warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Alumnos',          color: 'red',     route: 'alumno',          resource: 'alumno',         icon: 'mdi-school',                           warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Acudiente',        color: 'red',     route: 'pariente',        resource: 'pariente',       icon: 'mdi-human-male-child',                 warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Feriados',         color: 'indigo',  route: 'feriado',         resource: 'feriado',        icon: 'mdi-calendar-star',                    warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Tipo Agenda',      color: 'indigo',  route: 'tipo-agenda',     resource: 'tipo_agenda',    icon: 'mdi-clipboard-text-multiple',          warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Tipo Actividad',   color: 'indigo',  route: 'tipo-actividad',  resource: 'tipo_actividad', icon: 'mdi-clipboard-text-multiple',          warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
            { label: 'Agenda',           color: 'indigo',  route: 'agenda',          resource: 'agenda',         icon: 'mdi-clipboard-text',                   warnings: 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema', detail: 'Descripcion de la funcionalidad, observaciones y advertencias'   },
        ],
        stepper: null
    }),

    computed:
        {
            showAsistente()
            {
                return this.$store.getters['getShowAsistente']
            },
        },
    methods:
    {
        closeAsistente()
        {
            this.$store.commit('setShowAsistente', false)
        },

        prev()
        {
            this.stepper = ( this.stepper < 1) ? this.stepper : this.stepper - 1
        },

        next()
        {
            this.stepper = ( this.stepper == this.steps.length-1) ? this.stepper : this.stepper + 1 
        }
    }
}
</script>

<style>

/* .asistente-container{
    overflow-y: auto;
} */

</style>