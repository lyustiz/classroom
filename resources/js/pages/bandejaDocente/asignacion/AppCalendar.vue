<template>
  <v-card flat class="calendar-holder rounded-lg">

     <v-toolbar color="grey lighten-2" flat dense> 
            
        <v-row dense>
            <v-col cols="auto">
                <div>
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small color="grey lighten-1" v-on="on" @click="prev()" depressed>
                        <v-icon>mdi-chevron-left</v-icon>
                    </v-btn>
                </template>
                <span>Anterior</span>
                </v-tooltip>
                </div>
            </v-col>

            <v-col>
                <v-toolbar-title class="text-center">
                    {{ title }}
                </v-toolbar-title>
            </v-col>

            <v-col cols="auto">
                <div>
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small color="grey lighten-1" v-on="on" @click="next()" depressed>
                        <v-icon>mdi-chevron-right</v-icon>
                    </v-btn>
                </template>
                <span>Siguiente</span>
                </v-tooltip>
                </div>
            </v-col>
            <v-col cols="auto">

                <div class="grey lighten-5 rounded-lg px-2 py-1" >
                <v-btn icon dark x-small :color=" (filter.actividad) ? `amber` : 'amber lighten-4'" class="mx-1" depressed   @click="filter.actividad = !filter.actividad">
                    <v-icon size="25">mdi-rocket-launch</v-icon>
                </v-btn>
            
                <v-btn icon dark x-small :color=" (filter.video) ? `red` : 'red lighten-4'" class="mx-1" depressed  @click="filter.video = !filter.video">
                    <v-icon size="25">mdi-play-box-multiple</v-icon>
                </v-btn>
            
                <v-btn icon dark x-small :color=" (filter.audio) ? `orange` : 'orange lighten-4'" class="mx-1" depressed  @click="filter.audio = !filter.audio">
                    <v-icon size="25">mdi-music-box-multiple</v-icon>
                </v-btn>
            
                <v-btn icon dark x-small :color=" (filter.enlace) ? `blue` : 'blue lighten-4'" class="mx-1" depressed  @click="filter.enlace = !filter.enlace">
                    <v-icon size="25">mdi-earth</v-icon>
                </v-btn>
            
                <v-btn icon dark x-small :color=" (filter.lectura) ? `purple` : 'purple lighten-4'" class="mx-1" depressed  @click="filter.lectura = !filter.lectura">
                    <v-icon size="25">mdi-library</v-icon>
                </v-btn>

                <v-btn icon dark x-small :color=" (filter.cuestionario) ? `teal` : 'teal lighten-4'" class="mx-1" depressed  @click="filter.cuestionario = !filter.cuestionario">
                    <v-icon size="25">mdi-order-bool-descending-variant</v-icon>
                </v-btn>

                 <v-btn icon dark x-small :color=" (filter.tarea) ? `teal` : 'teal lighten-4'" class="mx-1" depressed  @click="filter.tarea = !filter.tarea">
                    <v-icon size="25">mdi-notebook</v-icon>
                </v-btn>

                </div>
                
            </v-col>

        </v-row>

    </v-toolbar>


    <v-calendar 
        ref="calendar"
        color="teal"
        class="app-calendar"
        v-model="focus"
        :type="type"
        :weekdays="weekdays"
        :now="today"
        :end="endDate"
        @change="updateRange"
    > 
   
        <template v-slot:event="{ event }">
            <v-icon size="18" class="white--text mx-2" v-text="event.icon"></v-icon>{{event.name}}
        </template>  

        <template v-slot:day="day" >

            <v-row  no-gutters justify="center" class="" v-if="eventos" > 

                <div v-for="(materias, tipo) in getEventsDay(day)" :key="tipo" class="caption row no-gutters justify-center mt-2" >
                    
                    <v-col cols="auto" v-if="tipo == 'actividad'" class="mx-n2" v-show="filter.actividad">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="amber" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-rocket-launch'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(asignaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader>{{materia}}</v-subheader>
                                    <v-list-item color="amber" v-for="(asignacion, materia) in asignaciones" :key="materia" link class="my-n2">
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="amber">mdi-rocket-launch</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.nb_actividad }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="success lighten-1" @click="showAsignacion(asignacion, 'actividad')">mdi-open-in-new</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmDelAsignacion(asignacion)">mdi-delete</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>

                    <v-col cols="auto" v-if="tipo == 'video'" class="mx-n2" v-show="filter.video">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="red" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-play-box-multiple'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(asignaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader>{{materia}}</v-subheader>
                                    <v-list-item color="red" v-for="(asignacion, materia) in asignaciones" :key="materia" link>
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="red">mdi-play-box-multiple</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.nb_enlace }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="success lighten-1" @click="showAsignacion(asignacion, 'video')">mdi-open-in-new</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmDelAsignacion(asignacion)">mdi-delete</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>

                    <v-col cols="auto" v-if="tipo == 'audio'" class="mx-n2" v-show="filter.audio">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="orange" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-music-box-multiple'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(asignaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader>{{materia}}</v-subheader>
                                    <v-list-item color="orange" v-for="(asignacion, materia) in asignaciones" :key="materia" link>
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="orange">mdi-music-box-multiple</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.archivo.nb_archivo }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="success lighten-1" @click="showAsignacion(asignacion, 'audio')">mdi-open-in-new</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmDelAsignacion(asignacion)">mdi-delete</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>

                    <v-col cols="auto" v-if="tipo == 'enlace'" class="mx-n2" v-show="filter.enlace">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="blue" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-earth'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(asignaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader>{{materia}}</v-subheader>
                                    <v-list-item color="blue" v-for="(asignacion, materia) in asignaciones" :key="materia" link>
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="blue">mdi-earth</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.nb_enlace }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="success lighten-1" @click="showAsignacion(asignacion, 'enlace')">mdi-open-in-new</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmDelAsignacion(asignacion)">mdi-delete</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>

                    <v-col cols="auto" v-if="tipo == 'lectura'" class="mx-n2" v-show="filter.lectura">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="purple" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-library'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(asignaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader>{{materia}}</v-subheader>
                                    <v-list-item color="purple" v-for="(asignacion, materia) in asignaciones" :key="materia" link>
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="purple">mdi-library</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.archivo.nb_archivo }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="success lighten-1" @click="showAsignacion(asignacion, 'lectura')">mdi-open-in-new</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmDelAsignacion(asignacion)">mdi-delete</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                        
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>

                </div> 
                
            </v-row>
        </template>  


        

    <template v-slot:day-label="day">
        
        <v-menu offset-x offset-y content-class="rounded-lg" min-width="120px">

        <template v-slot:activator="{ on }">
            <v-btn v-on="on" fab x-small color="green lighten-5" depressed >{{day.day}}</v-btn>
        </template>

            <div class="pa-1">

            <v-list  color="grey lighten-5 rounded-lg">
                
                <!-- v-for="multimedia in multimedias" :key="multimedia.id" -->

                <!-- <v-subheader>Evaluaciones</v-subheader>
                
                 <v-list-item class="pointer" ripple @click="asignarEvaluacion(day, 'cuestionario')">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="teal" >mdi-order-bool-descending-variant</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title class="red--teal">{{'Cuestionario'}}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

                 <v-list-item class="pointer" ripple @click="asignarEvaluacion(day, 'tarea')">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="purple" >mdi-notebook</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title class="text--purple">{{'Tarea'}}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
 -->
                <v-subheader>Asignaciones</v-subheader>

                <v-list-item v-for="(tipo, i) in tipoAsignaciones" :key="i" class="pointer" ripple @click="asignarActividad(day, tipo)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" :color="tipo.tx_color" v-text="tipo.tx_icono"></v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title class="amber--amber" v-text="tipo.nb_tipo_asignacion"></v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

            </v-list>

            </div>
            
         </v-menu>
        
    </template>

    
    </v-calendar>  

    <v-overlay 
        :opacity="0.3"
        :value="loading"
        :z-index="10">
        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay> 

  
    <v-dialog v-model="dialogActividad" max-width="500px" content-class="rounded-xl" >
        <asignar-actividad v-if="dialogActividad" :grupo="grupo" :dia="dia" :tipo="tipo" :tipoAsignaciones="tipoAsignaciones" @closeDialog="closeDialog('dialogActividad', $event)" ></asignar-actividad>
    </v-dialog>

    <v-dialog v-model="dialogEvaluacion" max-width="500px" content-class="rounded-xl" >
        <asignar-evaluacion v-if="dialogEvaluacion" :grupo="grupo" :dia="dia" :tipo="tipo" @closeModal="closeDialog()" ></asignar-evaluacion>
    </v-dialog>

    <form-delete
        :dialog="dialogEliminar"
        :loading="loading"
        message="Desea eliminar la Asignacion Seleccionada?"
        @deleteItem="eliminarAsignacion()"
        @deleteCancel="cancelDelAsignacion()"
    ></form-delete>

    

    </v-card>
</template>

<script>

import AppData           from '@mixins/AppData';
import AsignarActividad  from './AsignarActividad';
import AsignarEvaluacion from './AsignarEvaluacion';

export default {

    components: 
    {
        'asignar-actividad':  AsignarActividad,
        'asignar-evaluacion': AsignarEvaluacion
    }, 

    mixins: [AppData],

    props:
    {
        grupo: {
            type:    Object,
            default: () => [] 
        },
    }, 

    watch:
    {
        grupo()
        {
            if(this.grupo)
            {
                this.eventos = null
                this.list()
            }
        }
    },
    
    computed:
    {
        weekdays()
        {
            return (this.weekend) ? [ 1, 2, 3, 4, 5, 6, 0] : [ 1, 2, 3, 4, 5] 
        },

        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    mounted()
    {
        this.$nextTick(() => {
            this.title = this.$refs.calendar.title
        })
    },

    data()
    {
        return{
                resource:   'horario',

                horario:    [],
                allEvents:  [],
                today:      new Date().toISOString().substr(0, 10),
                focus:      new Date().toISOString().substr(0, 10),
                title:      null,
                month:      null,
                weekend:    null,
                start:      null,
                end:        null,
                type:       'month',
                endDate:    '2020-07-31',
                eventos:     null,
                event:      {},
                date:       {},
                tipoAsignaciones: [],
                dia:              null,
                tipo:             null,
                asignacion:       false,
                dialogActividad:  false,
                dialogEvaluacion: false,
                dialogEliminar:   false,
                filter: {
                    actividad:    true,
                    video:        true,
                    audio:        true,
                    enlace:       true,
                    lectura:      true,
                    cuestionario: true,
                    tarea:        true
                }
            }
    },

    methods: {
                  
        list()
        {
            this.getResource( 'asignacion/grupo/' + this.grupo.id ).then( (data) => 
            {  
                this.eventos          = data.asignaciones
                this.tipoAsignaciones = data.tipoAsignacion
                const { lastStart, lastEnd } = this.$refs.calendar
                this.updateRange({start: lastStart , end: lastEnd})
            })
        },

        getEventsDay(day)
        {
           return this.eventos[day.date]
        },

        getActividadDay(day)
        {
            console.log(day)
        },

        prev() 
        {
            this.$refs.calendar.prev()
        },

        next() 
        {
            this.$refs.calendar.next()
        },

        setToday() 
        {
            this.focus = this.today
        },

        getEventColor (event) 
        {
            return event.color
        },

        showEvent ({  event }) 
        {
            this.event = event
            this.dialogShow = true
        },

        horarioMonth(start, end)
        {
            this.allEvents = this.events
        },
    
        updateRange ({ start, end }) 
        {
            this.start = start
            this.end   = end
            this.title = this.$refs.calendar.title
            this.setHorario()
        },

        closeModal()
        {
            this.dialogShow = false
            this.event      = []
        },

        setHorario()
        {
            const { lastStart, lastEnd } = this.$refs.calendar

            switch (this.type) {

                case 'month':
                    this.horarioMonth(lastStart, lastEnd)                   
                    break;
                
                case 'week':
                    this.horarioWeek(lastStart, lastEnd)
                    break;

                case 'day':
                    this.horarioWeek(lastStart, lastEnd)
                    break;
            
                default:
                    break;
            }
        },

        sumDateDays(date, days)
        {
            let newDate  = new Date(date)
            return  new Date(newDate.setDate(newDate.getDate() + days))       
        },

        asignarActividad(dia, tipo)
        {
            console.log(tipo)
            
            this.dialogActividad = true;
            this.dia           = dia;
            this.tipo          = tipo;
        },

        confirmDelAsignacion(asignacion)
        {
            this.dialogEliminar = true
            this.asignacion = asignacion
        },

        cancelDelAsignacion()
        {
            this.dialogEliminar = false
            this.asignacion = null
        },

        eliminarAsignacion()
        {
            this.deleteResource(`asignacion/${this.asignacion.id}`).then( data => {
                this.showMessage(data.msj)
                this.list()
            })
        },

        verAsignacion()
        {

        },

        asignarEvaluacion(dia, tipo)
        {
            this.dialogEvaluacion = true;
            this.dia           = dia;
            this.tipo          = tipo;
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            if(refresh) {
                this.list()
            }
        }
    }
}
</script>

<style>
.calendar-holder{
    width: 100%;
    height: 91vh;
    position: relative;
}
.app-calendar{
    position: absolute;
}

</style>

