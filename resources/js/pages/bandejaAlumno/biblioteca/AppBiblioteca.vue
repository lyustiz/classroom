<template>

<v-dialog scrollable fullscreen persistent v-model="dialog">

        <template v-slot:activator="{ on, attrs }">
            <v-btn fab dark depressed v-bind="attrs" v-on="on" color="orange" class="ml-1">
                <v-icon size="32">mdi-notebook</v-icon>
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
                    class="pa-4"
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
                        class="mx-4 my-1 px-1 rounded-lg"
                        height="200"
                        width="150"
                        @click="toggle"
                        elevation="3"
                        >

                        <v-row justify="center" no-gutters class="fill-height align-stretch" > 
                            <v-col cols="12"><v-icon color="white" size="80" class="ml-n3 mt-n1">mdi-bookmark</v-icon></v-col>
                            
                            <v-col cols="12" class="white--text text-center text-capitalize font-weight-medium title">
                                {{ materia.nb_materia}}
                                <v-divider dark inset></v-divider>
      
                            </v-col>
                        </v-row>
                        </v-card>
                    </v-slide-item>
                    </v-slide-group>

                <v-toolbar color="green" flat dense dark class="title">
                   <v-icon class="mr-3">mdi-clipboard-multiple-outline</v-icon> Guias
                </v-toolbar>

                <v-slide-group
                    v-model="guiaSelected"
                    class="pa-4"
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
                    </v-slide-group>

                <v-toolbar color="purple" flat dense dark class="title">
                    <v-icon class="mr-3">mdi-play-box-multiple-outline</v-icon>Videos
                </v-toolbar>

                <v-slide-group
                    v-model="videoSelected"
                    class="pa-4"
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
                    </v-slide-group>
            </v-sheet>





         <!--        <v-expansion-panels  focusable class="rounded-xl" accordion>

                    <v-expansion-panel v-for="recurso in recursos" :key="recurso.id">

                        <v-expansion-panel-header>

                            <div>
                                <v-icon :color="recurso.tipo_recurso.tx_color" class="mr-1">{{ recurso.tipo_recurso.tx_icono }}</v-icon> {{recurso.tipo_recurso.nb_tipo_recurso}}
                            </div>
                            
                        </v-expansion-panel-header>

                            <v-expansion-panel-content>
                                    
                                <v-list dense two-line>
                                    <v-subheader>{{recurso.tipo_recurso.nb_tipo_recurso}}</v-subheader>
                                    <v-list-item-group v-model="file" :color="recurso.tipo_recurso.tx_color">

                                        <v-list-item v-for="archivo in recurso.archivo" :key="archivo.id">

                                            <v-list-item-avatar :color="recurso.tipo_recurso.tx_color">
                                                    <v-tooltip right color="green lighten-2" open-on-click>
                                                    <template v-slot:activator="{ on }">
                                                        <v-icon 
                                                            v-on="on"
                                                            color="white"
                                                            v-text="recurso.tipo_recurso.tx_icono"
                                                        ></v-icon>
                                                    </template>
                                                    <span>{{archivo.tx_observaciones }}</span>
                                                </v-tooltip>
                                            </v-list-item-avatar>

                                            <v-list-item-content>
                                                <v-list-item-title v-text="archivo.nb_archivo"></v-list-item-title>
                                                <v-list-item-subtitle v-text="archivo.nb_real"></v-list-item-subtitle>
                                            </v-list-item-content>

                                            <v-list-item-action>
                                                <menu-items :itemsMenu="filesMenu" :item="archivo" iconColor="green lighten-5" @onMenu="onMenu($event)"></menu-items>
                                            </v-list-item-action>

                                        
                                        </v-list-item>

                                    </v-list-item-group>
                                </v-list>
                                  
                            </v-expansion-panel-content>

                    </v-expansion-panel>

                </v-expansion-panels>
 -->

        </v-card-text>

        <v-dialog v-model="libroSelected" fullscreen content-class="rounded-t-xl">
            <visor-libros :fileUrl="fileUrl" :fileType="fileType" :title="title" @closeModal="closeModal()"></visor-libros>
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
        }

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

            filesMenu: [
                {
                    label: 'Ver Archivo',
                    icon:  'mdi-file-eye',
                    action: 'showfile'
                },
            ],

            file:{
                fileUrl: 1,
                fileType: 1,
                title: 'Libro Prueba'
            },

            dialog: false,
            active: false,
            selected: false,

            libroSelected: false,
            videoSelected: false,
            guiaSelected:  false,

            //visor
            fileUrl:  '/storage/recurso/libro/1/1593656676_Integra-Sociales.pdf',
            fileType: 'PDF',
            title:    'Libro Texto 1 Grado'

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
        },

        closeModal()
        {
            this.fileUrl  = null
            this.fileType = null
            this.title    = null
            this.dialog   = false
        },

        showFile(file)
        {
            this.fileUrl  = file.tipo_archivo.tx_base_path + file.tx_origen_id + '/' + file.tx_path
            this.fileType = file.tx_mimetype
            this.title    = file.nb_archivo
            this.dialog   = true
        },

        onMenu(payload)
        {
            switch (payload.action) {

                case 'refresh':
                    this.list()
                    break;
                
                case 'showfile':
                    this.showFile(payload.item)
                    break;
            
                default:
                    break;
            }
        }

    }
}
</script>

<style>
</style>