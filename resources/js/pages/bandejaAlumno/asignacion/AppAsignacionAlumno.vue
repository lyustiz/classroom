<template>
  <v-card flat class="calendar-holder mt-2 mx-2 rounded-t-lg">

     <v-toolbar color="deep-purple" flat dense dark> 
            
        <v-row dense>
            <v-col cols="auto">
                <div class="py-1">
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
                <v-toolbar-title class="text-center py-1">
                    {{ title }}
                </v-toolbar-title>
            </v-col>

            <v-col cols="auto">
                <div class="py-1">
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

                <div class="rounded-lg px-2 py-1 " >
                <v-btn fab dark x-small  class="" depressed   @click="filter.actividad = !filter.actividad" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.actividad) ? `amber` : 'amber lighten-4'">mdi-rocket-launch</v-icon>
                </v-btn>
            
                <v-btn fab dark x-small  class="" depressed  @click="filter.video = !filter.video" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.video) ? `red` : 'red lighten-4'">mdi-play-box-multiple</v-icon>
                </v-btn>
            
                <v-btn fab dark x-small  class="" depressed  @click="filter.audio = !filter.audio" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.audio) ? `orange` : 'orange lighten-4'">mdi-music-box-multiple</v-icon>
                </v-btn>
            
                <v-btn fab dark x-small  class="" depressed  @click="filter.enlace = !filter.enlace" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.enlace) ? `blue` : 'blue lighten-4'">mdi-earth</v-icon>
                </v-btn>
            
                <v-btn fab dark x-small  class="" depressed  @click="filter.lectura = !filter.lectura" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.lectura) ? `purple` : 'purple lighten-4'">mdi-library</v-icon>
                </v-btn>

                <v-btn fab dark x-small  class="" depressed  @click="filter.cuestionario = !filter.cuestionario" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.cuestionario) ? `teal` : 'teal lighten-4'">mdi-order-bool-descending-variant</v-icon>
                </v-btn>

                 <v-btn fab dark x-small  class="" depressed  @click="filter.tarea = !filter.tarea" color="rgba(255,255,255,0.95)">
                    <v-icon size="23" :color=" (filter.tarea) ? `deep-purple` : 'deep-purple lighten-4'">mdi-notebook</v-icon>
                </v-btn>

                </div>
                
            </v-col>

            <v-col cols="auto">
                <v-btn icon dark x-small class="mx-2 my-2 my-1" depressed  @click="list()" :loading="loading">
                    <v-icon size="32">mdi-refresh</v-icon>
                </v-btn>
            </v-col>

            <v-col cols="auto">
                <v-btn icon dark x-small class="mx-2 my-2 my-1" depressed  @click="navegateToName('bandeja-alumno')" :loading="loading">
                    <v-icon size="32">mdi-home</v-icon>
                </v-btn>
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
                                                <template v-if="evaluacion.evaluacion_alumno[0].fe_evaluacion">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
                                            </v-btn>
                                        </v-list-item-action>
                                    </v-list-item>
                                </v-list>
                            </div>

                        </v-menu>

                    </v-col>


                    <v-col cols="auto" v-if="tipo == 'tarea'" class="mx-n2" v-show="filter.tarea">

                        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
                            <template v-slot:activator="{ on }">
                                <v-btn icon dark color="deep-purple" depressed v-on="on">
                                    <v-icon size="30" v-text="'mdi-notebook'"></v-icon>
                                </v-btn>
                            </template>

                            <div v-for="(evaluaciones, materia) in materias" :key="materia" class="white">
                                
                                <v-list dense subheader>
                                    <v-subheader class="">{{materia}}</v-subheader>
                                    <v-list-item color="deep-purple" v-for="(evaluacion, materia) in evaluaciones" :key="materia" link class="my-n2" @click="verEvaluacion(evaluacion, 'tarea')">
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="deep-purple">mdi-notebook</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ evaluacion.origen.nb_tarea }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <template v-if="evaluacion.evaluacion_alumno[0].fe_evaluacion">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
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
                                    <v-list-item color="amber" v-for="(asignacion, materia) in asignaciones" :key="materia" link class="my-n2" @click="verAsignacion(asignacion, 'actividad')">
                                        <v-list-item-avatar color="white" size="35" >
                                            <v-icon size="30" color="amber">mdi-rocket-launch</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.nb_actividad }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <template v-if="asignacion.asignacion_alumno[0].fe_completado">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
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
                                    <v-list-item color="red" v-for="(asignacion, materia) in asignaciones" :key="materia" link  @click="verAsignacion(asignacion, 'video')">
                                        <v-list-item-avatar color="white" size="35">
                                            <v-icon size="30" color="red">mdi-play-box-multiple</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.nb_enlace }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <template v-if="asignacion.asignacion_alumno[0].fe_completado">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
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
                                    <v-list-item color="orange" v-for="(asignacion, materia) in asignaciones" :key="materia" link @click="verAsignacion(asignacion, 'audio')">
                                        <v-list-item-avatar color="white" size="35" >
                                            <v-icon size="30" color="orange">mdi-music-box-multiple</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.archivo.nb_archivo }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <template v-if="asignacion.asignacion_alumno[0].fe_completado">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
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
                                    <v-list-item color="blue" v-for="(asignacion, materia) in asignaciones" :key="materia" link @click="verAsignacion(asignacion, 'enlace')">
                                        <v-list-item-avatar color="white" size="35" >
                                            <v-icon size="30" color="blue">mdi-earth</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.nb_enlace }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <template v-if="asignacion.asignacion_alumno[0].fe_completado">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
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
                                    <v-list-item color="purple" v-for="(asignacion, materia) in asignaciones" :key="materia" link @click="verAsignacion(asignacion, 'lectura')">
                                        <v-list-item-avatar color="white" size="35" >
                                            <v-icon size="30" color="purple">mdi-library</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>{{ asignacion.origen.archivo.nb_archivo }}</v-list-item-title>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon>
                                                <template v-if="asignacion.asignacion_alumno[0].fe_completado">
                                                    <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <template v-else>
                                                    <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                                                </template>
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

        <v-btn  fab x-small color="green lighten-5" depressed >{{day.day}}</v-btn>

    </template>

    
    </v-calendar>  

    <v-overlay 
        :opacity="0.3"
        :value="loading"
        :z-index="10">
        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay> 
  
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
        <app-prueba v-if="dialogPrueba" :prueba="prueba" @closeDialog="closeDialog('dialogPrueba')" ></app-prueba>
    </v-dialog>

     <v-dialog v-model="dialogTarea" fullscreen scrollable>
        <app-tarea v-if="dialogTarea" :evaluacion-alumno="tarea" @closeDialog="closeDialog('dialogTarea')" @onClomplete="getEvaluaciones()" ></app-tarea>
    </v-dialog>

    </v-card>
</template>

<script>

import AppData       from '@mixins/AppData';
import AppActividad  from '@pages/actividad/AppActividad';
import AppPrueba     from '@pages/prueba/AppPrueba';
import AppTarea      from '@pages/tarea/AppTarea';

export default {

    components: 
    {
        'app-actividad': AppActividad,
        'app-prueba':    AppPrueba,
        'app-tarea':     AppTarea,
    }, 

    mixins: [AppData],

    created()
    {
        this.list()
    },

    mounted()
    {
        this.$nextTick(() => {
            this.title = this.$refs.calendar.title
        })
    },

    computed:
    {
        weekdays()
        {
            return [ 1, 2, 3, 4, 5, 6, 0]
        },

        alumno()
        {
            return this.$store.getters['getAlumno'];
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
            this.getResource( `asignacion/alumno/${this.alumno.id}`).then( (data) => 
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
                                          src: `${asignacion.origen.archivo.tipo_archivo.tx_base_path}${asignacion.origen.id}/${asignacion.origen.archivo.tx_path}` 
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
                    this.prueba       = evaluacion.origen
                    this.dialogPrueba = true
                    break;
                
                case 'tarea':
                    
                    this.tarea       = evaluacion.evaluacion_alumno[0]
                    this.dialogTarea = true
                    break;                  
                    break;

                default:
                    break;
            }

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

<style scoped>
.calendar-holder{
    width: 99%;
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

