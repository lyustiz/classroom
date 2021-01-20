<template>
  <v-card>
      
      <v-list class="rounded-xl" dense subheader>
        <v-subheader insert class="grey lighten-3 pl-4 rounded-t-xl font-weight-bold">Evaluaciones</v-subheader>
        <div v-for="(evaluacion, idx) in evaluaciones" :key="idx" class="">
          <v-list-item class="grey lighten-5" > 
            <v-list-item-avatar :color="evaluacion.tipo_evaluacion.tx_color">
              <v-icon dark>{{evaluacion.tipo_evaluacion.tx_icono}}</v-icon>
            </v-list-item-avatar>
            <v-list-item-content>
              <v-list-item-title class="text-uppercase">{{evaluacion.tx_origen}}</v-list-item-title>
              <v-list-item-subtitle>Asignada: {{formatDate(evaluacion.fe_inicio)}}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
          <v-list-item v-for="evaluacionAlumno in evaluacion.evaluacion_alumno" :key="evaluacionAlumno.id" class="white"> 
            <v-list-item-avatar color="grey lighten-2" class="ml-6" rounded>
              <v-row no-gutters class="">
                <v-col cols="12" class="subtitle-2 text-center">{{(evaluacionAlumno.nu_calificacion) ? evaluacionAlumno.nu_calificacion : '0.00' }}</v-col>
              </v-row>
            </v-list-item-avatar> 
            <v-list-item-content>
              <v-list-item-title > {{getNombreOrigen(evaluacion.tx_origen, evaluacion.origen)}}</v-list-item-title>
              <v-list-item-subtitle>{{(evaluacionAlumno.fe_evaluacion) ? `Realizada ${formatDate(evaluacionAlumno.fe_evaluacion)}` : 'Pendiente'}}</v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-icon class="py-5">
              <v-icon size="42" :color="(evaluacionAlumno.id_status == 5) ? 'green' : 'orange'">{{(evaluacionAlumno.id_status == 5) ? 'mdi-checkbox-marked-circle-outline' : 'mdi-progress-clock'}}</v-icon>
            </v-list-item-icon>
          </v-list-item>
        </div>
      </v-list>
      
  </v-card>
</template>

<script>
import AppData from '@mixins/AppData';
export default {

  mixins: [ AppData ],

  props:
  {
    materia: {
      type:       Object,
      default:    () => {}
    },
  },

  created()
  {
      this.list()
  },

  computed:
  {
    alumno()
    {
      return this.$store.getters['getAlumno'];
    },
  },

  watch:
  {
    materia(materia)
    {
      this.evaluaciones = []
      if(materia)
      {
        this.list()
      }  
    }
  },

  data()
  {
    return {
      evaluaciones: [],
    }
  },

  methods: 
  {
    list()
    {
      this.getResource( `evaluacion/materia/${this.materia.id}/alumno/${this.alumno.id}` ).then( (data) => 
      { 
        this.evaluaciones = data
      })
    },
    getNombreOrigen(origen, data)
    {
      switch (origen) {
        case 'prueba':
          return data.nb_prueba
          break;
        case 'tarea':
          return data.nb_tarea
          break;
      
        default:
          break;
      }
    }
  }
}
</script>

<style>

</style>