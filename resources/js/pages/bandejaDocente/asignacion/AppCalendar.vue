<template>
  <v-card flat class="calendar-holder rounded-lg">

     <v-toolbar color="deep-purple" flat dense dark> 
            
        <v-row dense>
            <v-col cols="auto">
                <div>
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small color="rgba(255,255,255,0.3)" v-on="on" @click="prev()" depressed>
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
                    <v-btn fab dark x-small color="rgba(255,255,255,0.3)" v-on="on" @click="next()" depressed>
                        <v-icon>mdi-chevron-right</v-icon>
                    </v-btn>
                </template>
                <span>Siguiente</span>
                </v-tooltip>
                </div>
            </v-col>
            <v-col cols="auto">

                <div class="rounded-lg px-2 py-1 calendar-buttons" >
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
                    
                    
                    <v-col cols="auto" v-if="tipo == 'cuestionario'" class="mx-n2" v-show="filter.cuestionario">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="teal" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-order-bool-descending-variant'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(evaluaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader class="">{{materia}}</v-subheader>
                                    <v-list-item color="teal" v-for="(evaluacion, materia) in evaluaciones" :key="materia" link class="my-n2" @click="verEvaluacion(evaluacion, 'cuestionario')">
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="teal">mdi-order-bool-descending-variant</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ evaluacion.origen.nb_prueba }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click.stop="confirmEliminar(evaluacion, 'evaluacion')">mdi-delete</v-icon>
                                            </v-btn>
                                        </v-list-item-action>
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>
                    
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
                                        <v-list-item-avatar color="white" size="35" @click="verAsignacion(asignacion, 'actividad')">
                                            <v-icon size="30" color="amber">mdi-rocket-launch</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content @click="verAsignacion(asignacion, 'actividad')">
                                            <v-list-item-title>{{ asignacion.origen.nb_actividad }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmEliminar(asignacion, 'asignacion')">mdi-delete</v-icon>
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
                                        <v-list-item-avatar color="white" size="35" @click="verAsignacion(asignacion, 'video')">
                                            <v-icon size="30" color="red">mdi-play-box-multiple</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content @click="verAsignacion(asignacion, 'video')">
                                            <v-list-item-title>{{ asignacion.origen.nb_enlace }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmEliminar(asignacion, 'asignacion')">mdi-delete</v-icon>
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
                                        <v-list-item-avatar color="white" size="35" @click="verAsignacion(asignacion, 'audio')">
                                            <v-icon size="30" color="orange">mdi-music-box-multiple</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content @click="verAsignacion(asignacion, 'audio')">
                                            <v-list-item-title>{{ asignacion.origen.archivo.nb_archivo }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmEliminar(asignacion, 'asignacion')">mdi-delete</v-icon>
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
                                        <v-list-item-avatar color="white" size="35" @click="verAsignacion(asignacion, 'enlace')">
                                            <v-icon size="30" color="blue">mdi-earth</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content @click="verAsignacion(asignacion, 'enlace')">
                                            <v-list-item-title>{{ asignacion.origen.nb_enlace }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmEliminar(asignacion, 'asignacion')">mdi-delete</v-icon>
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
                                        <v-list-item-avatar color="white" size="35" @click="verAsignacion(asignacion, 'lectura')">
                                            <v-icon size="30" color="purple">mdi-library</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content @click="verAsignacion(asignacion, 'lectura')">
                                            <v-list-item-title>{{ asignacion.origen.archivo.nb_archivo }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <v-icon size="20" color="red lighten-1" @click="confirmEliminar(asignacion)">mdi-delete</v-icon>
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

            <div class="pa-1" v-if="grupo">

            <v-list  color="grey lighten-5 rounded-lg">

                <v-subheader>Evaluaciones</v-subheader>

                <v-list-item v-for="tipo in tipoEvaluacion" :key="tipo.nb_tipo_evaluacion" class="pointer" ripple @click="asignarEvaluacion(day, tipo)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" :color="tipo.tx_color" v-text="tipo.tx_icono"></v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title class="amber--amber" v-text="tipo.nb_tipo_evaluacion"></v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

               <!--  <v-list-item class="pointer" ripple @click="asignarEvaluacion(day, { name: 'tarea', icon: 'mdi-notebook', color: 'purple lighten-4', origen: 'tarea' })">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="purple">mdi-notebook</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title class="text--purple">{{'Tarea'}}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item> -->

                <v-subheader>Asignaciones</v-subheader>

                <v-list-item v-for="(tipo, i) in tipoAsignacion" :key="i" class="pointer" ripple @click="asignarActividad(day, tipo)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" :color="tipo.tx_color" v-text="tipo.tx_icono"></v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title class="amber--amber" v-text="tipo.nb_tipo_asignacion"></v-list-item-title>
                    </v-list-item-content>
                </v-list-item>

            </v-list>

            </div>

            <div v-else>
                <v-alert type="info" class="mb-0" icon="mdi-hand-pointing-left">
                    Favor Seleccione un Grupo 
                </v-alert>
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
  
    <v-dialog v-model="dialogAsignacion" max-width="500px" content-class="rounded-xl" >
        <asignar-actividad v-if="dialogAsignacion" :grupo="grupo" :dia="dia" :tipo="tipo" :tipoAsignacion="tipoAsignacion" @closeDialog="closeDialog('dialogAsignacion', $event)" ></asignar-actividad>
    </v-dialog>

    <v-dialog v-model="dialogEvaluacion" max-width="90vw" content-class="rounded-xl" scrollable >
        <asignar-evaluacion v-if="dialogEvaluacion" :grupo="grupo" :dia="dia" :tipo="tipo" @closeDialog ="closeDialog('dialogEvaluacion', $event)" ></asignar-evaluacion>
    </v-dialog>

    <v-dialog v-model="dialogActividad" fullscreen>
        <app-actividad v-if="dialogActividad" :actividad="actividad"  @closeDialog="closeDialog('dialogActividad')" ></app-actividad>
    </v-dialog>

    <v-dialog v-model="dialogAudio" width="450" content-class="rounded-xl primary" hide-overlay>
        <visor-audio v-if="dialogAudio" :audio="audio"  @closeDialog="closeDialog('dialogAudio')" ></visor-audio>
    </v-dialog>

    <v-dialog v-model="dialogVideo" width="80vw" content-class="rounded-xl black">
        <visor-video v-if="dialogVideo" :video="video"  @closeDialog="closeDialog('dialogVideo')" ></visor-video>
    </v-dialog>

    <v-dialog v-model="dialogEnlace" fullscreen scrollable>
        <visor-enlace v-if="dialogEnlace" :enlace="enlace"  @closeDialog="closeDialog('dialogEnlace')" ></visor-enlace>
    </v-dialog>

    <v-dialog v-model="dialogLectura" width="95vw" content-class="rounded-xl">
        <visor-pdf v-if="dialogLectura" :pdf="lectura" @closeDialog="closeDialog('dialogLectura')" ></visor-pdf>
    </v-dialog>

    <!-- evaluaciones  -->

    <v-dialog v-model="dialogPrueba" fullscreen scrollable>
        <visor-prueba v-if="dialogPrueba" :prueba="prueba" @closeDialog="closeDialog('dialogPrueba')" ></visor-prueba>
    </v-dialog>

    <form-delete
        :dialog="dialogEliminar"
        :loading="loading"
        message="Desea eliminar la Asignacion Seleccionada?"
        @deleteItem="eliminarItem()"
        @deleteCancel="cancelEliminar()"
    ></form-delete>

    </v-card>
</template>

<script>

import AppData           from '@mixins/AppData';
import AsignarActividad  from './AsignarActividad';
import AsignarEvaluacion from './AsignarEvaluacion';
import AppActividad      from '@pages/actividad/AppActividad';

import VisorPrueba      from '@pages/prueba/VisorPrueba';

export default {

    components: 
    {
        'asignar-actividad':  AsignarActividad,
        'asignar-evaluacion': AsignarEvaluacion,
        'app-actividad':      AppActividad,
        'visor-prueba':       VisorPrueba
    }, 

    mixins: [AppData],

    props:
    {
        grupo: {
            type:    Object,
            default: () => null
        },

        tipoAsignacion: {
            type:    Array,
            default: () => []
        },

        tipoEvaluacion: {
            type:    Array,
            default: () => []
        },
    }, 

    mounted()
    {
        this.$nextTick(() => {
            this.title = this.$refs.calendar.title
        })
    },

    watch:
    {
        grupo()
        {
            this.eventos = null
            if(this.grupo)
            {
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
                eventos:    null,
                event:      {},
                date:       {},
                dia:              null,
                tipo:             null,
                
                dialogAsignacion: false,
                dialogEvaluacion: false,
                dialogEliminar:   false,

                item:       null,
                tipoItem:   null,

                dialogActividad:  false,
                dialogAudio:      false,
                dialogVideo:      false,
                dialogEnlace:     false,
                dialogLectura:    false,

                audio:   null,
                video:   null,
                enlace:  null,
                lectura: null,

                //evaluacion
                dialogPrueba:    false,
                dialogTarea:    false,

                prueba:  null,
                tarea:   null,

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
                this.eventos                 = data.plan
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
            this.dialogAsignacion = true;
            this.dia           = dia;
            this.tipo          = tipo;
        },

        asignarEvaluacion(dia, tipo)
        {            
            this.dialogEvaluacion = true;
            this.dia           = dia;
            this.tipo          = tipo;
        },

        confirmEliminar(item, tipoItem)
        {
            this.item           = item
            this.tipoItem       = tipoItem
            this.dialogEliminar = true
        },

        cancelEliminar()
        {
            this.dialogEliminar = false
            this.item           = false
            this.tipoItem       = false
        },

        eliminarItem()
        {
            this.deleteResource(`${this.tipoItem}/${this.item.id}`).then( data => {
                this.showMessage(data.msj)
                this.dialogEliminar = false
                this.list()
            })
        },

        verAsignacion(asignacion, tipo)
        {
            console.log(asignacion)
            
            switch (tipo ) {

                case 'actividad':
                    this.actividad       = asignacion.origen
                    this.dialogActividad = true
                    break;
                
                case 'audio':
                    this.audio  =   {   name: asignacion.origen.archivo.nb_archivo,
                                        src: `${asignacion.origen.archivo.tipo_archivo.tx_base_path}${asignacion.origen.id}/${asignacion.origen.archivo.tx_path}` 
                                    }
                    this.dialogAudio  = true                   
                    break;

                case 'video':
                    
                    this.video  =   {   name: asignacion.origen.nb_enlace,
                                        src: `${asignacion.origen.tx_url}` 
                                    } 
                                    console.log(this.video)
                    this.dialogVideo  = true 
                    break;

                case 'enlace':
                    this.enlace        = {   name: asignacion.origen.nb_enlace,
                                             src: `${asignacion.origen.tx_url}` 
                                         }  
                    this.dialogEnlace  = true 
                    break;
                
                case 'lectura':
                    this.lectura  =   {   name: asignacion.origen.archivo.nb_archivo,
                                          src: `${asignacion.origen.archivo.tipo_archivo.tx_base_path}/${asignacion.origen.id}/${asignacion.origen.tx_path}` 
                                    }
                    this.dialogLectura = true 
                    break;
            
                default:
                    break;
            }

        },

        verEvaluacion(evaluacion, tipo)
        {
            switch (tipo ) {

                case 'cuestionario':
                    this.prueba     = evaluacion.origen
                    this.dialogPrueba = true
                    break;
                
                case 'tarea':
                    this.tarea     = evaluacion.origen
                    this.dialogTarea = true
                    break;                  
                    break;

                default:
                    break;
            }

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
.calendar-buttons{
    background-color: rgba(255,255,255,0.9);
}
.app-calendar{
    position: absolute;
}

</style>

