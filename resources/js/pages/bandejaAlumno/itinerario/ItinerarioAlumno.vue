<template>

 <v-card :loading="loading" height="90vh" >

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Itinerario" @closeModal="$emit('closeModal')"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="grey lighten-3">
            <v-menu v-model="menu" transition="slide-x-transition" right :close-on-content-click="false" content-class="rounded-xl">
                <template v-slot:activator="{ on }">
                    <v-avatar v-on="on" color="red" rounded dark size="48" class="pointer">
                        <h6 class="white--text" no-gutters>{{dia}}</h6>
                        <h6 class="white--text">{{ mes}}</h6>        
                    </v-avatar>
                </template>
                <v-date-picker 
                    v-model="form.fecha" 
                    @input="setDate($event)">
                </v-date-picker>
            </v-menu>
            <div class="mx-2 subtitle-1">Actividades del Dia - {{alumno.nb_corto}}</div>
        </v-card-title>

        <v-card-text class="py-0" >

        <v-timeline align-top dense v-if="items.length > 0">
            <v-timeline-item icon="mdi-clock-outline" fill-dot :color="horario.materia.area_estudio.tx_color" small v-for="horario in items" :key="horario.id">
                <v-card>
                    <v-row>
                        <v-col cols="2" class="text-center"><strong>{{horario.hh_inicio}}</strong></v-col>
                        <v-col cols="2" class="text-center"><strong>{{horario.hh_fin}}</strong></v-col>
                        <v-col>
                            <strong>{{horario.materia.nb_materia}}</strong>
                            <div class="caption">{{horario.aula.nb_aula}} ({{horario.aula.estructura.tx_path}})</div>
                        </v-col>
                        <v-col>
                            <strong>{{horario.docente.nb_corto}}</strong>
                            <div class="caption">Docente</div>
                        </v-col>
                    </v-row>
                </v-card>
            </v-timeline-item>
        </v-timeline>

        <v-alert type="warning" :value="true" v-else-if="items.length < 1 && !loading" prominent outlined border="left" class="mt-3">
            No existen actividades para esta fecha
        </v-alert>
            
    </v-card-text>

  </v-card>
  
</template>

<script>
import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],

    props:
    {
        alumno: {
            type:       Object,
            default:    () => {}
        },
    },

    watch:
    {
        alumno(alumno)
        {
            if(alumno)
            {
                this.form.id_alumno = alumno.id 
                this.form.fecha = this.today.toISOString().substr(0, 10)
                this.list()
            }  
        }
    },

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
           
        }
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

.dialog-container
{
    max-height: 90vh;
    overflow-y: hidden;
}

.dialog-content
{
    max-height: 68vh;
    overflow-y: scroll;
}

</style>