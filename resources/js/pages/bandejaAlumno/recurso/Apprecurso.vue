<template>

    <v-card flat :loading="loading">
        
        <v-card-text class="pt-3" >
    
            <v-row justify="center"> 

                <v-expansion-panels  focusable class="rounded-xl" accordion>

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

                                            <a class="d-none" :ref="archivo.id" rel="noreferrer noopener" target="_blank" :href="archivo.tipo_archivo.tx_base_path + archivo.tx_origen_id + '/' + archivo.tx_path" ></a>

                                        </v-list-item>

                                    </v-list-item-group>
                                </v-list>
                                  
                            </v-expansion-panel-content>

                    </v-expansion-panel>

                </v-expansion-panels>

            </v-row>

        </v-card-text>   

    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
import MenuItems  from '@components/list/ListMenu'

export default {

    components: { 
        'menu-items': MenuItems
    },

    mixins:     [ DataHelper ],

    created()
    {
       this.list()
    },

    data () {
        return {
            file:     0,
            grupo:    1,  //TODO: agregar grupo
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

        }
    },
    methods:
    {
        list()
        {
            this.getResource( `recurso/grupo/${this.grupo}` ).then( data =>  {
               this.recursos = data
               this.file     = 0
            })
        },

        downloadFile(file)
        {
            this.$refs[file.id][0].click()
        },

        onMenu(payload)
        {
            switch (payload.action) {

                case 'refresh':
                    this.list()
                    break;
                
                case 'showfile':
                    this.downloadFile(payload.item)
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