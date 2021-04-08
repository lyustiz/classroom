<template>

        <v-card> 

        <v-subheader class="grey lighten-3">
            <v-row no-gutters>
                <v-col cols="auto">
                    <v-btn icon small class="mx-2 my-1" depressed  @click="navegateToName('bandeja-alumno')">
                        <v-icon size="30">mdi-home</v-icon>
                    </v-btn>
                </v-col>
                <v-col class="my-2">
                    Biblioteca
                </v-col>
                <v-col cols="auto">

                    <v-btn icon x-small class="mx-2 my-2 my-1" depressed  @click="navegateToName('asignacion-alumno')" >
                        <v-icon size="28">mdi-calendar-multiselect</v-icon>
                    </v-btn>

                    <v-btn icon x-small class="mx-1 my-2" depressed  @click="list()" :loading="loading">
                        <v-icon size="25">mdi-refresh</v-icon>
                    </v-btn>
                </v-col>
            </v-row>
        </v-subheader>

        <v-card-text class="pt-3" >

            <v-sheet
                class="mx-auto rounded-xl"
                elevation="8"
                max-width="98vw"
                color="amber lighten-4"
            >
    
                <v-toolbar color="blue darken-4" flat dense dark class="rounded-t-xl title">
                    <v-row dense>
                        <v-col>
                            <v-icon class="mr-3">mdi-book-multiple-outline</v-icon> Libros
                        </v-col>
                    </v-row>
                </v-toolbar>

               <v-slide-group
                    v-model="libroSelected"
                    class="pa-4 item-container"
                    active-class="warning"
                    show-arrows="always"
                    center-active
                    @change="showBook($event)"
                    >
                    <v-slide-item
                        v-for="libro in libros"
                        :key="libro.id"
                        v-slot:default="{ active, toggle }"
                        :value="libro"
                    >
                        <v-card
                            :color="active ? undefined : 'primary'"
                            class="mx-4 my-1 px-1 rounded-lg"
                            height="150"
                            width="120"
                            @click="toggle"
                            elevation="3"
                        >
                            <v-row justify="center" no-gutters class="fill-height align-stretch" > 
                                <v-col cols="12"><v-icon color="white" size="80" class="ml-n3 mt-n1">mdi-bookmark</v-icon></v-col>
                                <v-col cols="12" class="white--text text-center text-capitalize font-weight-medium title-1">
                                    {{ libro.materia.nb_materia}}
                                    <v-divider dark inset></v-divider>
                                </v-col>
                            </v-row>
                        </v-card>
                        
                    </v-slide-item>

                    <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                    </v-overlay>
                </v-slide-group>

                <book-toolbar icon="mdi-order-bool-descending-variant" label="Cuestionarios" @onShowComplete="completed.cuestionario = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(cuestionarios) ? cuestionarios.length: 0" :completed="getCompletadas('evaluaciones', cuestionarios)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="pruebaSelected">
                            <v-slide-item v-for="cuestionario in cuestionarios" :key="cuestionario.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active" 
                                    color="teal" 
                                    :label="cuestionario.evaluacion.origen.nb_prueba" 
                                    icon="mdi-order-bool-descending-variant" 
                                    @onSelect="verEvaluacion(cuestionario, 'cuestionario')"
                                    :completed="(cuestionario.id_status > 4) ? true: false"
                                    v-if="completed.cuestionario || cuestionario.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>

                <book-toolbar icon="mdi-notebook" label="Tarea" @onShowComplete="completed.tarea = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(tareas) ? tareas.length: 0" :completed="getCompletadas('evaluaciones', tareas)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="tareaSelected">
                            <v-slide-item v-for="tarea in tareas" :key="tarea.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active" 
                                    color="deep-purple" 
                                    :label="tarea.evaluacion.origen.nb_tarea" 
                                    icon="mdi-notebook" 
                                    @onSelect="verEvaluacion(tarea, 'tarea')"
                                    :completed="(tarea.id_status > 4) ? true: false"
                                    v-if="completed.tarea || tarea.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>


                <book-toolbar icon="mdi-rocket-launch" label="Actividades" @onShowComplete="completed.actividad = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(actividades) ? actividades.length: 0" :completed="getCompletadas('asignaciones', actividades)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="actividadSelected">
                            <v-slide-item v-for="actividad in actividades" :key="actividad.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active" 
                                    color="amber" 
                                    :label="actividad.evaluacion.origen.nb_actividad" 
                                    icon="mdi-rocket-launch" 
                                    @onSelect="verAsignacion(actividad, 'actividad')"
                                    :completed="(actividad.id_status > 4) ? true: false"
                                    v-if="completed.actividad || actividad.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>

                <book-toolbar icon="mdi-earth" label="Enlace" @onShowComplete="completed.enlace = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(enlaces) ? enlaces.length: 0" :completed="getCompletadas('asignaciones', enlaces)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="enlaceSelected">
                            <v-slide-item v-for="enlace in enlaces" :key="enlace.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active"
                                    color="blue" 
                                    :label="enlace.evaluacion.origen.nb_enlace" 
                                    icon="mdi-earth" 
                                    @onSelect="verAsignacion(enlace, 'enlace')"
                                    :completed="(enlace.id_status > 4) ? true: false"
                                    v-if="completed.enlace || enlace.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>

                <book-toolbar icon="mdi-play-box-multiple" label="Video" @onShowComplete="completed.video = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(videos) ? videos.length: 0" :completed="getCompletadas('asignaciones', videos)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="videoSelected">
                            <v-slide-item v-for="video in videos" :key="video.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active" 
                                    color="red" 
                                    :label="video.evaluacion.origen.nb_enlace" 
                                    icon="mdi-play-box-multiple" 
                                    @onSelect="verAsignacion(video, 'video')"
                                    :completed="(video.id_status > 4) ? true: false"
                                    v-if="completed.video || video.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>

                <book-toolbar icon="mdi-music-box-multiple" label="Audio" @onShowComplete="completed.audio = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(audios) ? audios.length: 0" :completed="getCompletadas('asignaciones', audios)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="audioSelected">
                            <v-slide-item v-for="audio in audios" :key="audio.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active" 
                                    color="orange" 
                                    :label="audio.evaluacion.origen.archivo.nb_archivo" 
                                    icon="mdi-music-box-multiple" 
                                    @onSelect="verAsignacion(audio, 'audio')"
                                    :completed="(audio.id_status > 4) ? true: false"
                                    v-if="completed.audio || audio.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>

                <book-toolbar icon="mdi-library" label="Lectura" @onShowComplete="completed.lectura = $event"></book-toolbar>
      
                <v-row no-gutters>
                    <v-col cols="2" class="pl-6">
                         <status-task :loading="loading" :total="(lecturas) ? lecturas.length: 0" :completed="getCompletadas('asignaciones', lecturas)"></status-task>
                    </v-col>
                    <v-col cols="10">
                        <v-slide-group class="pa-4 item-container" show-arrows="always" center-active v-model="lecturaSelected">
                            <v-slide-item v-for="lectura in lecturas" :key="lectura.id" v-slot:default="{ active }">
                                <card-book 
                                    :active="active" 
                                    color="purple" 
                                    :label="lectura.evaluacion.origen.archivo.nb_archivo" 
                                    icon="mdi-library" 
                                    @onSelect="verAsignacion(lectura, 'lectura')"
                                    :completed="(lectura.id_status > 4) ? true: false"
                                    v-if="completed.lectura || lectura.id_status < 5">
                                </card-book>
                            </v-slide-item> 
                            <v-overlay color="amber rounded-lg" absolute :opacity="0.3" :value="loading">
                                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                            </v-overlay>
                        </v-slide-group>
                    </v-col>
                </v-row>

            </v-sheet>

        </v-card-text>

         <v-dialog v-model="libroDialog" fullscreen  content-class="amber lighten-2" >
            <visor-libros :libro="libro" @closeModal="closeDialog('libroDialog')" v-if="libro"></visor-libros>
        </v-dialog>  

        <v-dialog v-model="dialogPrueba" fullscreen persistent no-click-animation>
            <app-prueba v-if="dialogPrueba" :evaluacion-alumno="evaluacion" @closeDialog="closeDialog('dialogPrueba')" ></app-prueba>
        </v-dialog>

         <v-dialog v-model="dialogTarea" fullscreen persistent no-click-animation>
            <app-tarea v-if="dialogTarea" :evaluacion-alumno="evaluacion" @closeDialog="closeDialog('dialogTarea')" @onClomplete="getEvaluaciones()" ></app-tarea>
        </v-dialog>

        <v-dialog v-model="dialogActividad" fullscreen persistent no-click-animation>
            <app-actividad v-if="dialogActividad" :actividad="actividadSelected.origen" evaluar :asignacion="asignacion" @onClomplete="getEvaluaciones()"  @closeDialog="closeDialog('dialogActividad')" ></app-actividad>
        </v-dialog>

        <v-dialog v-model="dialogAudio" width="450" content-class="rounded-xl primary" hide-overlay>
            <visor-audio v-if="dialogAudio" :audio="audioSelected" :evaluacion="asignacion" evaluar @onClomplete="getEvaluaciones()" @closeDialog="closeDialog('dialogAudio')" ></visor-audio>
        </v-dialog>

        <v-dialog v-model="dialogVideo" width="80vw" content-class="rounded-xl black">
            <visor-video v-if="dialogVideo" :video="videoSelected" :evaluacion="asignacion" evaluar @onClomplete="getEvaluaciones()" @closeDialog="closeDialog('dialogVideo')" ></visor-video>
        </v-dialog>

        <v-dialog v-model="dialogEnlace" fullscreen scrollable>
            <visor-enlace v-if="dialogEnlace" :enlace="enlaceSelected" :evaluacion="asignacion" evaluar @onClomplete="getEvaluaciones()" @closeDialog="closeDialog('dialogEnlace')" ></visor-enlace>
        </v-dialog>

        <v-dialog v-model="dialogLectura" width="95vw" content-class="rounded-xl">
            <visor-pdf v-if="dialogLectura" :pdf="lecturaSelected" :evaluacion="asignacion" evaluar @onClomplete="getEvaluaciones()" @closeDialog="closeDialog('dialogLectura')" ></visor-pdf>
        </v-dialog>

        <pre>{{$data.peers}}</pre>

    </v-card>

       
</template>

<script>
import DataHelper   from '@mixins/AppData';
import MenuItems    from '@components/list/ListMenu'
import VisorLibros  from './VisorLibros'

import AppPrueba    from '@pages/prueba/AppPrueba';
import AppTarea     from '@pages/tarea/AppTarea';
import AppActividad from '@pages/actividad/AppActividad';

import CardBook     from './components/CardBook'
import StatusTasks  from './components/StatusTasks'
import BookToolbar  from './components/BookToolbar'

export default {

    components: { 
        'menu-items':    MenuItems,
        'visor-libros':  VisorLibros,
        'app-prueba':    AppPrueba,
        'app-tarea':     AppTarea,
        'app-actividad': AppActividad,
        'card-book':     CardBook,
        'status-task':   StatusTasks,
        'book-toolbar':  BookToolbar,
    },

    mixins:     [ DataHelper ],

    computed:
    {
        grupo()
        {
            return this.$store.getters['getAlumnoGrupo']
        },

        grado()
        {
            return this.$store.getters['getAlumnoGrado']
        },

        calendario()
        {
            return this.$store.getters['getCalendario']
        },

        alumno()
        {
            return this.$store.getters['getAlumno']
        }
    },

    created()
    {
        this.list()
    },

    data () {
        return {

            libros: [],
            libroDialog: false,
            libro:    null,

            dialog:   false,
            active:   false,
            selected: false,

            asignacion: null,
            evaluacion: null,

            libroSelected:     false,
            pruebaSelected:    null,
            tareaSelected:     null,
            actividadSelected: null,
            audioSelected:     null,
            videoSelected:     null,
            enlaceSelected:    null,
            lecturaSelected:   null,

            dialogPrueba:    false,
            dialogTarea:     false,
            dialogActividad: false,
            dialogAudio:     false,
            dialogVideo:     false,
            dialogEnlace:    false,
            dialogLectura:   false,

            asignaciones:  [],
            evaluaciones:  [],

            actividades:   [],
            enlaces:       [],
            videos:        [],
            audios:        [],
            lecturas:      [],

            cuestionarios: [],
            tareas:        [],

            completed: {
                libro:        false,
                cuestionario: false,
                tarea:        false,
                actividad:    false,
                audio:        false,
                video:        false,
                enlace:       false,
                lectura:      false,
            }
        }
    },
    methods:
    {
        list()
        {
           this.getLibros()
           this.getEvaluaciones()
        },

        getLibros()
        {
            this.getResource( `libro/grado/${this.grado.id}` ).then( data =>  this.libros = data )
        },

        getEvaluaciones()
        {
            this.getResource( `evaluacionAlumno/alumno/${this.alumno.id}` ).then( data =>  {
                this.evaluaciones  = data
                this.cuestionarios = data.cuestionario
                this.tareas        = data.tarea
                this.actividades   = data.actividad
                this.enlaces       = data.enlace
                this.videos        = data.video
                this.audios        = data.audio
                this.lecturas      = data.lectura
            })
        },

        getCompletadas( tipo, items)
        {
            return  (items)  ? items.filter( item => item.id_status > 4).length : 0
        },

        closeModal()
        {
            this.dialog   = false
        },

        showBook(book)
        {
            this.libro = book
            this.libroDialog = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            this.libro   = false
            this.libroSelected = false

            if(refresh) this.list()
        },

        verAsignacion(asignacion, tipo)
        {
            this.asignacion = asignacion
            asignacion      = asignacion.evaluacion
           console.log(asignacion)
            switch (tipo ) {

                case 'actividad':
                    this.actividadSelected = asignacion
                    this.dialogActividad   = true
                    break;
                
                case 'audio':
                    this.audioSelected  =   {   
                                                id:   asignacion.origen.id,
                                                name: asignacion.origen.archivo.nb_archivo,
                                                src: `${asignacion.origen.archivo.tipo_archivo.tx_base_path}${asignacion.origen.id}/${asignacion.origen.archivo.tx_path}` 
                                            }
                    this.dialogAudio    = true                   
                    break;

                case 'video':
                    
                    this.videoSelected  =   {   
                                                id:   asignacion.origen.id,
                                                name: asignacion.origen.nb_enlace,
                                                src: `${asignacion.origen.tx_url.replace("watch?v=", "embed/")}` 
                                            } 
                    this.dialogVideo    = true 
                    break;

                case 'enlace':
                    this.enlaceSelected =   {   
                                                id:   asignacion.origen.id,
                                                name: asignacion.origen.nb_enlace,
                                                src: `${asignacion.origen.tx_url}` 
                                            }  
                    this.dialogEnlace   = true 
                    break;
                
                case 'lectura':
                    this.lecturaSelected  = {   
                                                id:   asignacion.origen.id,
                                                name: asignacion.origen.archivo.nb_archivo,
                                                src: `${asignacion.origen.archivo.tipo_archivo.tx_base_path}${asignacion.id_origen}/${asignacion.origen.archivo.tx_path}` 
                                            }
                    this.dialogLectura  = true 

                    break;
            
                default:
                    break;
            }
        },

        verEvaluacion(evaluacion, tipo)
        {
            this.evaluacion = evaluacion
            evaluacion = evaluacion.evaluacion
            
            switch (tipo ) {

                case 'cuestionario':
                    this.pruebaSelected  =  this.evaluacion
                    this.dialogPrueba    = true
                    break;
                
                case 'tarea':
                    this.tareaSelected     = evaluacion.origen
                    this.dialogTarea = true
                    break;                  
                    break;

                default:
                    break;
            }

        },

    }
}
</script>

<style scoped>
.item-container{
    min-height: 190px;
}
.v-slide-group__next, .v-slide-group__prev{
  min-width: 1px !important;
}
</style>