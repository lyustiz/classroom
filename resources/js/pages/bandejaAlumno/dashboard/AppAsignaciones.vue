<template>
  <v-card class="rounded-xl elevation-5 vertical-overflow" height="39rem">
    <v-card-text>
      <v-list-item @click="navegateToName('biblioteca-alumno')"> 
        <v-list-item-content>
          <v-list-item-title class=" font-weight-black">Asignaciones</v-list-item-title>
          <v-list-item-subtitle>Avance</v-list-item-subtitle>
        </v-list-item-content>
        <v-list-item-avatar color="blue darken-4 elevation-3" rounded dark size="43" class="pointer">
          <v-icon dark size="40">mdi-progress-check</v-icon>
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
                :size="55"
                :width="7"
                :value="getPorcentaje(tipo)"
                color="blue darken-4"
                >
                <div>
                    <span class="caption">{{getPorcentaje(tipo)}}%</span>
                </div>
              </v-progress-circular>
            </v-list-item-action>
          </v-list-item>
          <v-divider class="mx-2"></v-divider>
          </div>
        </template>          
      </v-list>
      <v-overlay class="rounded-xl" absolute :opacity="0.1" :value="loading">
        <v-icon size="60" class="mdi-spin">mdi-loading</v-icon>
      </v-overlay>
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
        this.getResource( `evaluacionAlumno/alumno/${this.alumno.id}` ).then( (data) => 
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
        this.cuestionarioTotal = (this.cuestionario) ? { total: this.cuestionario.length, completada: this.cuestionario.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.actividadTotal    = (this.actividad)    ? { total: this.actividad.length, completada: this.actividad.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.tareaTotal        = (this.tarea)        ? { total: this.tarea.length, completada: this.tarea.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.videoTotal        = (this.video)        ? { total: this.video.length, completada: this.video.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.audioTotal        = (this.audio)        ? { total: this.audio.length, completada: this.audio.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.enlaceTotal       = (this.enlace)       ? { total: this.enlace.length, completada: this.enlace.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.lecturaTotal      = (this.lectura)      ? { total: this.lectura.length, completada: this.lectura.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
        this.tareaTotal        = (this.tarea)        ? { total: this.tarea.length, completada: this.tarea.filter( item => item.id_status > 4).length } :  { total: 0, completada: 0 };
      },

      getTotal(tipo)
      {       
        return ( this[`${tipo}Total`] ) ? this[`${tipo}Total`] : { totales: 0, completada: 0 }
      },

      getPorcentaje(tipo)
      {
        let totales    = this[`${tipo}Total`];
        let porcentaje = (totales.total> 0) ? (totales.completada * 100 / totales.total).toFixed(1) : 0;
        
        return ( totales ) ? porcentaje : 0
      },

  }

}
</script>

<style>

</style>