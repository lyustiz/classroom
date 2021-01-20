<template>
  <v-card class="rounded-xl elevation-5" height="39rem">
    <v-card-title primary-title>
      <v-list-item> 
        <v-list-item-content>
        <v-list-item-title class=" font-weight-black">Clases</v-list-item-title>
        <v-list-item-subtitle>{{items.length}} clases</v-list-item-subtitle>
        </v-list-item-content>
        <v-menu v-model="menu" transition="slide-x-transition" right :close-on-content-click="false" content-class="rounded-xl">
          <template v-slot:activator="{ on }">
            <v-list-item-avatar v-on="on" color="blue darken-4 white--text elevation-3" rounded dark size="43" class="pointer">
              <v-row no-gutters>
                <v-col cols="12" class="caption">{{ mes}}</v-col>
                <v-col class="subtitle-2">{{ dia}} </v-col>
              </v-row>    
            </v-list-item-avatar>
          </template>
          <v-date-picker 
            v-model="form.fecha" 
            @input="setDate($event)">
          </v-date-picker>
        </v-menu>
      </v-list-item>
    </v-card-title>
    <v-card-text class="vertical-overflow height-timeline">
    
      <v-timeline align-top dense v-if="items.length > 0" >
        <v-timeline-item icon="mdi-clock-outline" fill-dot small :color="horario.materia.area_estudio.tx_color" v-for="horario in items" :key="horario.id">
          <v-card class="grey lighten-4 rounded-lg elevation-0 pa-1">
            <v-row no-gutters class="">
              <v-col cols="12" class="text-center"> 
                <v-icon size="15">mdi-clock</v-icon> {{horario.hh_inicio}} / {{horario.hh_fin}}
              </v-col>
              <v-col cols="12">
                <v-row no-gutters>
                  <v-col cols="auto">
                    <v-avatar color="blue lighten-5 mx-3 my-3" size="43">
                      <v-icon color="blue darken-4" size="28">mdi-bookshelf</v-icon>
                    </v-avatar>
                  </v-col>
                  <v-col class="my-3">
                    <strong>{{horario.materia.nb_materia}}</strong>
                    <div class="caption">{{horario.aula.nb_aula}} ({{horario.aula.estructura.tx_path}})</div>
                  </v-col>
                </v-row>
              </v-col>
            </v-row>
          </v-card>
        </v-timeline-item>
      </v-timeline>
      <v-overlay class="rounded-xl" absolute :opacity="0.1" :value="loading">
          <v-icon size="60" class="mdi-spin">mdi-loading</v-icon>
      </v-overlay>
  </v-card-text>
</v-card>
</template>

<script>
import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],
    
    created()
    {
        if(this.alumno)
        {
           this.form.id_alumno = this.alumno.id 
           this.form.fecha = this.today.toISOString().substr(0, 10)
           this.list()
        }  
    },

    computed:
    {
        dia()
        {
           return this.today.getDate()
        },

        mes()
        {
           return this.months[this.today.getMonth()].substring(0,3).toUpperCase()
           
        },

        alumno()
        {
            return this.$store.getters['getAlumno'];
        },
    },
    
    data: () => ({
        today:      new Date(),
        menu: false,
        form: {
            id_alumno: null,
            fecha:     null
        }
    }),

    methods:
    {
        list()
        {
            this.postResource(`detalleHorario/alumno/fecha`, this.form).then( data => this.items = data)
        },

        setDate(date)
        {
            this.menu       = false
            const [year, month, day] = date.split('-')
            this.today      = new Date(year, month-1, day)
            this.form.fecha = date
            this.list()
        }
    }

}
</script>

<style>
 .height-timeline{
   height: 32rem;
 }
</style>