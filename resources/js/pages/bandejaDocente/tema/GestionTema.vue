<template>

<v-dialog scrollable fullscreen persistent v-model="dialog">

        <template v-slot:activator="{ on, attrs }">
            <v-btn fab dark depressed v-bind="attrs" v-on="on" color="green" class="ml-1">
                <v-icon size="32">mdi-inbox-multiple</v-icon>
            </v-btn>
        </template>

        <v-card> 

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Gestión de temas" @closeModal="dialog=false" dense></app-simple-toolbar>
        </v-card-title>
        
        <v-card-text class="pt-3" >

            <v-row>

                <v-col cols="12" md="6">
                    <v-select
                        :items="grados"
                        v-model="grado"
                        item-text="nb_grado"
                        item-value="id"
                        label="Grado"
                        hint="Seleccione Grado"
                        persistent-hint
                        :loading="loading"
                        dense
                        @change="getMaterias($event)"
                        return-object
                    ></v-select>
                </v-col>

                <v-col cols="12" md="6">
                    <v-select
                        :items="materias"
                        v-model="materia"
                        item-text="nb_materia"
                        item-value="id"
                        label="Materia"
                        hint="Seleccione materia"
                        persistent-hint
                        :loading="loading"
                        :disabled="materias.length < 1"
                        dense
                        @change="getTemas($event)"
                        return-object
                    ></v-select>
                </v-col>

                <v-col cols="12" >
                    <v-select
                        :items="temas"
                        v-model="tema"
                        item-text="nb_tema"
                        item-value="id"
                        label="Tema"
                        hint="Seleccione Tema"
                        persistent-hint
                        :loading="loading"
                        :disabled="temas.length < 1"
                        dense
                        @change="getRecursos($event)"
                        return-object
                    ></v-select>
                </v-col>
            </v-row>

            <v-row  v-if="tema">

                <v-col cols="12" lg="4"  md="6" sm="12" > 
                    <gestion-video :videos="videos" :tema="tema" @onUpdateData="getRecursos()"></gestion-video>
                </v-col>

                <v-col cols="12" lg="4"  md="6" sm="12" >
                   <gestion-enlace :enlaces="enlaces" :tema="tema" @onUpdateData="getRecursos()" ></gestion-enlace>
                </v-col>

                <v-col cols="12" lg="4"  md="6" sm="12">
                   <gestion-audio :audios="audios" :tema="tema" :grado="grado" @onUpdateData="getRecursos()" ></gestion-audio>
                </v-col>

                <v-col cols="12" lg="4"  md="6" sm="12">
                   <gestion-lectura :lecturas="lecturas" :tema="tema" :grado="grado" @onUpdateData="getRecursos()" ></gestion-lectura>
                </v-col>

                 <v-col cols="12" lg="4" md="6" sm="12" >
                    <gestion-actividad :actividades="actividades" :tema="tema" @onUpdateData="getRecursos()"></gestion-actividad>
                </v-col>

                <v-overlay class="rounded-lg" absolute :opacity="0.3" :value="loading">
                    <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                </v-overlay>

            </v-row>

        </v-card-text>
       
    </v-card>

       
        <pre>{{$data.peers}}</pre>

    </v-dialog>  

</template>

<script>
import DataHelper   from '@mixins/AppData';
import AppActividad from '@pages/actividad/AppActividad';
import TemaToolbar  from './component/TemaToolbar'

// Gestion
import GestionVideo     from './GestionVideo'
import GestionEnlace    from './GestionEnlace'
import GestionAudio     from './GestionAudio'
import GestionLectura   from './GestionLectura'
import GestionActividad from './GestionActividad'


export default {

    components: { 
        'app-actividad':     AppActividad,
        'tema-toolbar':      TemaToolbar,
        'gestion-video':     GestionVideo,
        'gestion-enlace':    GestionEnlace,
        'gestion-audio':     GestionAudio,
        'gestion-lectura':   GestionLectura,
        'gestion-actividad': GestionActividad,
    },

    mixins:     [ DataHelper ],

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    watch:
    {
        dialog(dialog)
        {
            if(dialog)
            {
                this.list()
            }
        },
    },

    data () {
        return {

            dialog:     false,
     
            grados:     [],
            materias:   [],
            temas:      [],
            recursos:   [],
            grado:      null,
            materia:    null,
            tema:       null,

            libros:        [],
            actividades:   [],
            enlaces:       [],
            videos:        [],
            audios:        [],
            lecturas:      [],

            cuestionarios: []
        }
    },

    methods:
    {
        list()
        {
            this.materias = [];
            this.temas    = [];
            this.materia  = null
            this.tema     = null
            this.getResource( `grado/materia/docente/${this.docente.id}` ).then( data =>  this.grados = data );
        },

        getMaterias(grado)
        {
            this.temas    = [];
            this.materia  = null
            this.tema     = null
            this.materias = grado.materia;
        },

        getTemas(materia)
        {
            this.tema     = null
            this.getResource( `tema/grado/${this.grado.id}/materia/${this.materia.id}` ).then( data =>  this.temas = data );
        },

        getRecursos(tema)
        {
             this.getResource( `tema/${this.tema.id}/recursos` ).then( data => { 
                this.recursos = data 
                this.actividades = this.recursos.actividad
                this.getVideos(this.recursos.enlace)
                this.getEnlaces(this.recursos.enlace)
                this.getAudios(this.recursos.recurso)
                this.getLecturas(this.recursos.recurso)
               
            });
        },

        getVideos(enlaces)
        {
            this.videos = enlaces.filter( enlace => enlace.id_tipo_enlace == 2)
        },

        getEnlaces(enlaces)
        {
            this.enlaces = enlaces.filter( enlace => enlace.id_tipo_enlace == 1)
        },

        getAudios(recursos)
        {
            this.audios = recursos.filter( recurso => recurso.id_tipo_recurso == 1)
        },

        getLecturas(recursos)
        {
            this.lecturas = recursos.filter( recurso => recurso.id_tipo_recurso == 3)
        },

        closeModal()
        {
            this.dialog   = false
        },
    }
}
</script>

<style scoped>

</style>