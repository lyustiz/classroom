<template>

    <v-card flat min-height="82vh">  

    <v-subheader class="grey lighten-3">
        <v-row no-gutters>

             <v-tooltip bottom color="green">
                <template v-slot:activator="{ on }">
                <v-btn small icon depressed v-on="on" class="ml-1 mt-1" @click="navegateToName('bandeja-docente')">
                    <v-icon size="34">mdi-home</v-icon>
                </v-btn>
                </template>
                <span>Pagina Principal</span>
            </v-tooltip>
           
            <v-col class="my-2 ml-2">
                Gestion de Contenidos
            </v-col>

            <v-col cols="auto">

                <v-tooltip bottom color="green">
                    <template v-slot:activator="{ on }">
                    <v-btn small icon depressed v-on="on" class="ml-1 mt-1" @click="navegateToName('planificador-docente')">
                        <v-icon size="30">mdi-calendar-multiselect</v-icon>
                    </v-btn>
                    </template>
                    <span>Planificador</span>
                </v-tooltip>

                <v-tooltip bottom color="green">
                    <template v-slot:activator="{ on }">
                    <v-btn icon depressed v-on="on" class="ml-1 mt-1" @click="navegateToName('seguimiento-actividades')">
                        <v-icon size="30">mdi-calendar-search</v-icon>
                    </v-btn>
                    </template>
                    <span>Seguimiento</span>
                </v-tooltip>

                 <v-tooltip bottom color="green">
                    <template v-slot:activator="{ on }">
                    <v-btn small icon depressed v-on="on" class="ml-1 mt-1" @click="list()">
                        <v-icon size="30">mdi-refresh</v-icon>
                    </v-btn>
                    </template>
                    <span>Recargar</span>
                </v-tooltip>
            </v-col>
        </v-row>
    </v-subheader>
        
    <v-card-text class="pt-3" >

        <v-row dense>

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
                    :readonly="loading"
                    dense
                    filled
                    rounded
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
                    :readonly="loading"
                    :disabled="materias.length < 1"
                    dense
                    filled
                    rounded
                    @change="getTemas($event)"
                    return-object
                ></v-select>
            </v-col>

            <v-col cols="12" >
                <v-row no-gutters>
                    <v-col>
                        <v-select
                            :items="temas"
                            v-model="tema"
                            item-text="nb_tema"
                            item-value="id"
                            label="Tema"
                            hint="Seleccione Tema"
                            persistent-hint
                            :loading="loading"
                            :readonly="loading"
                            :disabled="temas.length < 1"
                            dense
                            filled
                            rounded
                            @change="getRecursos($event)"
                            return-object
                        ></v-select>
                    </v-col>
                    <v-col cols="auto" class="px-2 py-1">
                        <v-btn fab small color="success" :disabled="temas.length < 1" @click="dialogTema=true"><v-icon>mdi-plus</v-icon></v-btn>
                    </v-col>
                </v-row>
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
            
            <v-col cols="12" lg="4" md="6" sm="12" >
                <gestion-cuestionario :cuestionarios="cuestionarios" :tema="tema" :grado="grado" :materia="materia" @onUpdateData="getRecursos()"></gestion-cuestionario>
            </v-col>

            <v-col cols="12" lg="4" md="6" sm="12" >
                <gestion-tarea :tareas="tareas" :tema="tema" :grado="grado" :materia="materia" @onUpdateData="getRecursos()"></gestion-tarea>
            </v-col>

            <v-overlay class="rounded-lg" absolute :opacity="0.3" :value="loading">
                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
            </v-overlay>

        </v-row>

    </v-card-text>

    <pre>{{$data.peers}}</pre>

    <v-dialog v-model="dialogTema" width="80vw" scrollable content-class="rounded-xl">
        <app-tema v-if="dialogTema" :materia="materia" :grado="grado" :temas="temas" @closeDialog="closeDialog()" @updateData="getTemas(materia)"></app-tema>
    </v-dialog>

    </v-card>

</template>

<script>
import DataHelper   from '@mixins/AppData';
import AppActividad from '@pages/actividad/AppActividad';
import TemaToolbar  from './component/TemaToolbar'
import AppTema      from '@pages/tema/AppTema';

// Gestion
import GestionVideo        from './GestionVideo'
import GestionEnlace       from './GestionEnlace'
import GestionAudio        from './GestionAudio'
import GestionLectura      from './GestionLectura'
import GestionActividad    from './GestionActividad'
import GestionCuestionario from './GestionCuestionario'
import GestionTarea        from './GestionTarea'


export default {

    components: { 
        'tema-toolbar':         TemaToolbar,
        'app-tema':             AppTema,
        'app-actividad':        AppActividad,
        'gestion-video':        GestionVideo,
        'gestion-audio':        GestionAudio,
        'gestion-enlace':       GestionEnlace,
        'gestion-lectura':      GestionLectura,
        'gestion-actividad':    GestionActividad,
        'gestion-cuestionario': GestionCuestionario,
        'gestion-tarea':        GestionTarea,
    },

    mixins:     [ DataHelper ],

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    created()
    {
        this.list()
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

            evaluaciones:  [],
            cuestionarios: [],
            tareas:        [],

            dialogTema:   false
        }
    },

    methods:
    {
        list()
        {
            this.materias = [];
            this.temas    = [];
            this.grado    = null
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
                this.getCuestionarios(data.prueba)
                this.getTareas(data.tarea)
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

        getCuestionarios(cuestionarios)
        {
            this.cuestionarios = cuestionarios
        },

        getTareas(tareas)
        {
            this.tareas = tareas
        },

        closeModal()
        {
            this.dialog   = false
        },

        closeDialog()
        {
            this.getTemas(this.materia)
            this.dialogTema = false
        },
    }
}
</script>

<style scoped>

</style>