<template>

<v-dialog scrollable fullscreen persistent v-model="dialog">

        <template v-slot:activator="{ on, attrs }">
            <v-btn fab dark depressed v-bind="attrs" v-on="on" color="orange" class="ml-1">
                <v-icon size="32">mdi-library</v-icon>
            </v-btn>
        </template>

        <v-card>

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Biblioteca" @closeModal="dialog=false" dense></app-simple-toolbar>
        </v-card-title>
        
        <v-card-text class="pt-3" >

            <v-sheet
                class="mx-auto rounded-xl"
                elevation="8"
                max-width="800"
                color="amber lighten-4"
            >
    
                <v-toolbar color="red" flat dense dark class="rounded-t-xl title">
                    <v-icon class="mr-3">mdi-book-multiple-outline</v-icon> Libros
                </v-toolbar>
               <v-slide-group
                    v-model="libroSelected"
                    class="pa-4 item-container"
                    active-class="warning"
                    show-arrows
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
                        height="200"
                        width="150"
                        @click="toggle"
                        elevation="3"
                        >
                            <v-row justify="center" no-gutters class="fill-height align-stretch" > 
                                <v-col cols="12"><v-icon color="white" size="80" class="ml-n3 mt-n1">mdi-bookmark</v-icon></v-col>
                                <v-col cols="12" class="white--text text-center text-capitalize font-weight-medium title">
                                    {{ libro.materia.nb_materia}}
                                    <v-divider dark inset></v-divider>
                                </v-col>
                            </v-row>
                        </v-card>
                    </v-slide-item>

                    <v-overlay 
                        absolute
                        :opacity="0.3"
                        :value="libros.length < 1"
                        :z-index="10">
                        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                    </v-overlay>
                    </v-slide-group>



                <v-toolbar color="green" flat dense dark class="title">
                   <v-icon class="mr-3">mdi-clipboard-multiple-outline</v-icon> Guias
                </v-toolbar>

                <v-slide-group
                    v-model="guiaSelected"
                    class="pa-4 item-container"
                    active-class="warning"
                    show-arrows
                    center-active
                    >
                    <v-slide-item
                        v-for="materia in materias"
                        :key="materia.id"
                        v-slot:default="{ active, toggle }"
                    >
                        <v-card
                        :color="active ? undefined : 'primary'"
                        class="mx-4 px-1 rounded-lg"
                        height="200"
                        width="150"
                        @click="toggle"
                        elevation="3"
                        >

                        <v-row justify="center" no-gutters class="fill-height align-stretch" > 
                            <v-col cols="12"><v-icon color="white" size="60" class="">mdi-circle-edit-outline</v-icon></v-col>
                            
                            <v-col cols="12" class="white--text text-center text-capitalize font-weight-medium title">
                                {{ materia.nb_materia}}
                                <v-divider dark inset></v-divider>
      
                            </v-col>
                        </v-row>
                        </v-card>
                    </v-slide-item>
                    <v-overlay 
                        absolute
                        :opacity="0.3"
                        :value="materias.length < 1"
                        :z-index="10">
                        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                    </v-overlay>
                    </v-slide-group>

                <v-toolbar color="purple" flat dense dark class="title">
                    <v-icon class="mr-3">mdi-play-box-multiple-outline</v-icon>Videos
                </v-toolbar>

                <v-slide-group
                    v-model="videoSelected"
                    class="pa-4 item-container"
                    active-class="warning"
                    show-arrows
                    center-active
                    >
                    <v-slide-item
                        v-for="materia in materias"
                        :key="materia.id"
                        v-slot:default="{ active, toggle }"
                    >
                        <v-card
                        :color="active ? undefined : 'primary'"
                        class="mx-4 px-1 rounded-lg"
                        height="200"
                        width="150"
                        @click="toggle"
                        elevation="3"
                        >
                            <v-row justify="center" no-gutters class="fill-height align-stretch" > 
                                <v-col cols="12"><v-icon color="white" size="60" class="">mdi-play-circle</v-icon></v-col>
                                <v-col cols="12" class="white--text text-center text-capitalize font-weight-medium title">
                                    {{ materia.nb_materia}}
                                    <v-divider dark inset></v-divider>
                                </v-col>
                            </v-row>
                        </v-card>
                    </v-slide-item>
                    <v-overlay 
                        absolute
                        :opacity="0.3"
                        :value="materias.length < 1"
                        :z-index="10">
                        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                    </v-overlay>
                    </v-slide-group>
            </v-sheet>
        </v-card-text>

        <v-dialog v-model="libroDialog" fullscreen  content-class="amber lighten-2">
            <visor-libros :libro="libro" @closeModal="closeDialog('libroDialog')" v-if="libro"></visor-libros>
        </v-dialog>  

    </v-card>
        <pre>{{$data.peers}}</pre>
    </v-dialog>  

</template>

<script>
import DataHelper   from '@mixins/AppData';
import MenuItems    from '@components/list/ListMenu'
import VisorLibros  from './VisorLibros'

export default {

    components: { 
        'menu-items': MenuItems,
        'visor-libros': VisorLibros,
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
        }
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
            file:     0,
            headers:  [
                { text: ' ',        value: 'expand'},
                { text: 'Materia',  value: 'nb_materia' },
            ],

            recursos: [],
            materias:[],
            libros: [],
            libroDialog: false,

            libro: null,

            dialog: false,
            active: false,
            selected: false,

            libroSelected: false,
            videoSelected: false,
            guiaSelected:  false,

        }
    },
    methods:
    {
        list()
        {
            this.getResource( `recurso/grupo/${this.grupo.id}` ).then( data =>  {
               this.recursos = data
               this.file     = 0
            })

            this.getResource( `materia/grupo/${this.grupo.id}` ).then( data =>  this.materias = data )
            this.getResource( `libro/grado/${this.grado.id}` ).then( data =>  this.libros = data )
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

        closeDialog(dialog)
        {
            this[dialog] = false
            this.libro   = false
            this.libroSelected = false
        }

    }
}
</script>

<style>
.item-container{
    min-height: 240px;
}
</style>