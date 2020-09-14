<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Recursos" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>
        
        <v-card-text class="pt-3" >
    
            <v-row justify="center"> 

                <v-expansion-panels  focusable class="rounded-xl" accordion>

                    <v-expansion-panel v-for="recurso in recursos" :key="recurso.id">

                        <v-expansion-panel-header>

                            <v-row no-gutters>

                                <v-col>
                                    <v-icon :color="recurso.tipo_recurso.tx_color" class="mr-1">{{ recurso.tipo_recurso.tx_icono }}</v-icon> {{recurso.tipo_recurso.nb_tipo_recurso}}
                                </v-col>
                                <v-col>
                                    {{ recurso.grado.nb_grado }} 
                                </v-col>
                            
                            </v-row>
                            
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

            </v-row>

        </v-card-text>

        <v-dialog v-model="dialog" max-width="500px" content-class="rounded-t-xl" fullscreen>

            <app-visor :fileUrl="fileUrl" :fileType="fileType" :title="title" @closeModal="closeModal()"></app-visor>
            
        </v-dialog>   

    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
import AppVisor   from '@pages/bandejaAlumno/recurso/AppVisor'  

export default {

    components: { 
        'app-visor':  AppVisor
    },

    mixins:     [ DataHelper ],

    created()
    {
       this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
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

            filesMenu: [
                {
                    label: 'Ver Archivo',
                    icon:  'mdi-file-eye',
                    action: 'showfile'
                },
            ],

            //visor
            fileUrl:  null,
            fileType: null,
            title:    null

        }
    },
    methods:
    {
        list()
        {
            this.getResource( `recurso/docente/${this.docente.id}` ).then( data =>  {
               this.recursos = data
               this.file     = 0
            })
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