<template>
  <v-card class="rounded-xl elevation-5 vertical-overflow" height="39rem">
    <v-card-text>
        <v-list-item @click="navegateToName('biblioteca-alumno')"> 
            <v-list-item-content>
                <v-list-item-title class=" font-weight-black">Asignaciones</v-list-item-title>
                <v-list-item-subtitle>Avance</v-list-item-subtitle>
            </v-list-item-content>

                <v-list-item-avatar color="teal lighten-5" size="43">
                <v-icon  color="teal lighten-2" size="28">mdi-check-circle</v-icon>
            </v-list-item-avatar>
        </v-list-item>
        <v-list two-line> 
          <template v-for="(tipo, idx) in tipos" >
            <div :key="idx" v-if="getTotal(tipo).total">
            <v-list-item @click="navegateToName('biblioteca-alumno')"> 
                <v-list-item-content>
                    <v-list-item-title  class="font-weight-medium text-capitalize">{{tipo}}</v-list-item-title>
                    <v-list-item-subtitle>{{getTotal(tipo).completada}}/{{getTotal(tipo).total}} Completados</v-list-item-subtitle>
                </v-list-item-content>
                <v-list-item-action>
                  <v-progress-circular
                      :size="48"
                      :width="7"
                      :value="getPorcentaje(tipo)"
                      color="teal lighten-3"
                      >
                      <div>
                          <span class="dfisplay-1">{{getPorcentaje(tipo)}}%</span>
                      </div>
                  </v-progress-circular>
                </v-list-item-action>
            </v-list-item>
            <v-divider class="mx-2"></v-divider>
            </div>
          </template>          
        </v-list>
    </v-card-text>
  </v-card>
</template>

<script>
import AppData from '@mixins/AppData';
export default {

  mixins: [AppData],

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

  data () 
	{
    return {
      cuestionario:      null,
      actividad:         null,
      tarea:             null,
      video:             null,
      audio:             null,
      enlace:            null,
      lectura:           null,
      tarea:             null,
      cuestionarioTotal: null,
      actividadTotal:    null,
      tareaTotal:        null,
      videoTotal:        null,
      audioTotal:        null,
      enlaceTotal:       null,
      lecturaTotal:      null,
      tareaTotal:        null,
      tipos: [
        'cuestionario',
        'actividad',
        'tarea',
        'video',
        'audio',
        'enlace',
        'lectura',
      ]
    }
  },

  methods: {
      
      list()
      {
        this.getResource( `asignacionAlumno/evaluacion/${this.alumno.id}` ).then( (data) => 
        { 
          this.cuestionario = data.cuestionario 
          this.actividad    = data.actividad 
          this.tarea        = data.tarea 
          this.video        = data.video 
          this.audio        = data.audio 
          this.enlace       = data.enlace 
          this.lectura      = data.lectura 
          this.tarea        = data.tarea 
          this.totales(data);
        })
      },

      totales()
      {
        this.cuestionarioTotal = (this.cuestionario) ? { total: this.cuestionario.length, completada: this.cuestionario.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.actividadTotal    = (this.actividad)    ? { total: this.actividad.length, completada: this.actividad.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.tareaTotal        = (this.tarea)        ? { total: this.tarea.length, completada: this.tarea.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.videoTotal        = (this.video)        ? { total: this.video.length, completada: this.video.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.audioTotal        = (this.audio)        ? { total: this.audio.length, completada: this.audio.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.enlaceTotal       = (this.enlace)       ? { total: this.enlace.length, completada: this.enlace.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.lecturaTotal      = (this.lectura)      ? { total: this.lectura.length, completada: this.lectura.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
        this.tareaTotal        = (this.tarea)        ? { total: this.tarea.length, completada: this.tarea.filter( item => item.fe_completado).length } :  { total: 0, completada: 0 };
      },

      getTotal(tipo)
      {       
        return ( this[`${tipo}Total`] ) ? this[`${tipo}Total`] : { totales: 0, completada: 0 }
      },

      getPorcentaje(tipo)
      {
        let totales    = this[`${tipo}Total`];
        let porcentaje = (totales.total> 0) ? totales.completada * 100 / totales.total : 0;
        
        return ( totales ) ? porcentaje : 0
      },

  }

}
</script>

<style>

</style>