<template>
  <v-card class="rounded-xl">
    <v-card-title class="pa-0">
       <v-subheader dark insert class="blue darken-4 rounded-t-xl font-weight-bold col-12">
          <v-row no-gutters>
            <v-col>Evaluaciones</v-col>
            <v-col cols="auto">
              <v-btn icon x-small class="mx-1" @click.native="$emit('closeDialog')">
                <v-icon>mdi-close-circle</v-icon>
              </v-btn>
            </v-col>
          </v-row>
        </v-subheader>
    </v-card-title>
    <v-card-text class="px-0">


        <v-list-item class="grey lighten-5 mt-2"  v-if="evaluaciones.length < 1 && !loading" >
          <v-list-item-avatar color="warning">
              <v-icon dark>mdi-alert-circle</v-icon>
           </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="">No se han asignado Evaluaciones</v-list-item-title>
          </v-list-item-content> 
        </v-list-item>


        <v-skeleton-loader v-if="loading" loading
          type="list-item-avatar-three-line"
        ></v-skeleton-loader>


       <v-list class="rounded-xl" dense  subheader v-for="(grupoEvaluaciones, tipo) in evaluaciones.evaluacion" :key="tipo" >
         <v-subheader dark class="font-weight-bold- text-capitalize col-12" :class="grupoEvaluaciones[0].tipo_evaluacion.tx_color">
           <v-icon dark size="20" class="mx-3">{{grupoEvaluaciones[0].tipo_evaluacion.tx_icono}}</v-icon>
           {{tipo}}
        </v-subheader>
        <v-list-item class="grey lighten-5" v-for="(evaluacion, idx) in grupoEvaluaciones" :key="idx" >
        
         <v-list-item-avatar :color="evaluacion.tipo_evaluacion.tx_color">
            <v-icon dark>{{evaluacion.tipo_evaluacion.tx_icono}}</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="text-uppercase">{{getNombreOrigen(evaluacion.tipo_evaluacion.nb_tipo_evaluacion, evaluacion.origen)}}</v-list-item-title>
            <v-list-item-subtitle>Asignación: {{formatDate(evaluacion.fe_inicio)}}</v-list-item-subtitle>
             <v-list-item-subtitle>
                {{ (evaluacion.evaluacion_alumno[0].id_status > 4) ? `Completada:` : 'Pendiente'}}
                {{formatDate(evaluacion.evaluacion_alumno[0].fe_evaluacion)}}
                <v-icon size="12" :color="(evaluacion.evaluacion_alumno[0].id_status > 4) ? 'green' : 'orange'">{{(evaluacion.evaluacion_alumno[0].id_status > 4) ? 'mdi-checkbox-marked-circle-outline' : 'mdi-progress-clock'}}</v-icon>
              </v-list-item-subtitle>
          </v-list-item-content> 
          <v-list-item-action class="cation">
              {{(evaluacion.evaluacion_alumno[0].nu_calificacion) ? evaluacion.evaluacion_alumno[0].nu_calificacion : '- -' }}
          </v-list-item-action>
        </v-list-item>
       </v-list>


      <v-list class="rounded-xl " dense  subheader v-for="(grupoEvaluaciones, tipo) in evaluaciones.asignacion" :key="tipo" >
         <v-subheader dark class="font-weight-bold- text-capitalize col-12" :class="grupoEvaluaciones[0].tipo_evaluacion.tx_color">
           <v-icon dark size="20" class="mx-3">{{grupoEvaluaciones[0].tipo_evaluacion.tx_icono}}</v-icon>
           {{tipo}}
        </v-subheader>
        <v-list-item class="grey lighten-5" v-for="(evaluacion, idx) in grupoEvaluaciones" :key="idx" >
        
         <v-list-item-avatar :color="evaluacion.tipo_evaluacion.tx_color">
            <v-icon dark>{{evaluacion.tipo_evaluacion.tx_icono}}</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="text-uppercase">{{getNombreOrigen(evaluacion.tipo_evaluacion.nb_tipo_evaluacion, evaluacion.origen)}}</v-list-item-title>
            <v-list-item-subtitle>Asignación: {{formatDate(evaluacion.fe_inicio)}}</v-list-item-subtitle>
             <v-list-item-subtitle>
                {{ (evaluacion.evaluacion_alumno[0].id_status > 4) ? `Completada:` : 'Pendiente'}}
                {{formatDate(evaluacion.evaluacion_alumno[0].fe_evaluacion)}}
                <v-icon size="12" :color="(evaluacion.evaluacion_alumno[0].id_status > 4) ? 'green' : 'orange'">{{(evaluacion.evaluacion_alumno[0].id_status > 4) ? 'mdi-checkbox-marked-circle-outline' : 'mdi-progress-clock'}}</v-icon>
              </v-list-item-subtitle>
          </v-list-item-content> 
          <v-list-item-action class="cation">
              {{(evaluacion.evaluacion_alumno[0].nu_calificacion) ? evaluacion.evaluacion_alumno[0].nu_calificacion : '- -' }}
          </v-list-item-action>
        </v-list-item>
      </v-list>

         <v-list class="rounded-xl " dense subheader v-for="(grupoEvaluaciones, tipo) in evaluaciones.rasgo" :key="tipo" >
         <v-subheader dark class="font-weight-bold- text-capitalize col-12" :class="grupoEvaluaciones[0].tipo_evaluacion.tx_color">
           <v-icon dark size="20" class="mx-3">{{grupoEvaluaciones[0].tipo_evaluacion.tx_icono}}</v-icon>
           {{tipo}}
        </v-subheader>
        <v-list-item class="grey lighten-5" v-for="(evaluacion, idx) in grupoEvaluaciones" :key="idx" >
        
         <v-list-item-avatar :color="evaluacion.origen.tx_color">
            <v-icon dark>{{evaluacion.origen.tx_icono}}</v-icon>
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="text-uppercase">{{getNombreOrigen(evaluacion.tipo_evaluacion.nb_tipo_evaluacion, evaluacion.origen)}}</v-list-item-title>
             <v-list-item-subtitle>
                {{ (evaluacion.evaluacion_alumno[0].id_status > 4) ? `Evaluada:` : 'Pendiente'}}
                {{formatDate(evaluacion.evaluacion_alumno[0].fe_evaluacion)}}
                <v-icon size="12" :color="(evaluacion.evaluacion_alumno[0].id_status > 4) ? 'green' : 'orange'">{{(evaluacion.evaluacion_alumno[0].id_status > 4) ? 'mdi-checkbox-marked-circle-outline' : 'mdi-progress-clock'}}</v-icon>
              </v-list-item-subtitle>
          </v-list-item-content> 
          <v-list-item-action class="cation">
              {{(evaluacion.evaluacion_alumno[0].nu_calificacion) ? evaluacion.evaluacion_alumno[0].nu_calificacion : '- -' }}
          </v-list-item-action>
        </v-list-item>
         </v-list>

    </v-card-text>  
    <v-overlay color="rounded-lg" absolute :opacity="0.3" :value="loading">
        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>
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
        case 'Cuestionario':
          return data.nb_prueba

        case 'Tarea':
          return data.nb_tarea

        case 'Actividad':
          return data.nb_actividad

        case 'Video':
          return data.nb_enlace

        case 'Audio':
          return data.archivo.nb_archivo

        case 'Lectura':
          return data.archivo.nb_archivo

        case 'Enlace':
          return data.nb_enlace

        case 'Rasgos':
          return data.nb_rasgo

        default:
          break;
      }
    }
  }
}
</script>

<style>

</style>