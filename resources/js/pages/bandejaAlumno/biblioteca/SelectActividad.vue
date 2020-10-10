<template>

    <div>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="32" innerClass="ma-1" color="deep-purple" label="Actividades" icon="mdi-file-edit" ></app-button>
        </template>

        <v-list-item-group color="deep-purple" mandatory>
            <v-list nav>

                <v-toolbar color="deep-purple subtitle-2" dense dark class="rounded-t-lg" flat>
                    Actividades
                </v-toolbar>
                
                <v-list-item color="deep-purple" v-for="actividad in actividades" :key="actividad.id" @click="dialogActividad = true">
                    <v-list-item-avatar color="white" size="55">
                        <v-icon size="45">mdi-file-edit</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ actividad.nb_actividad }}</v-list-item-title>
                        <v-list-item-subtitle>{{ actividad.tx_descripcion}}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="25" color="red lighten-1">mdi-open-in-new</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

            </v-list>
            
        </v-list-item-group>

  

         <!-- <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>
                    <template v-slot:activator="{ on }">
                        <app-button v-on="on" small :size="32" innerClass="ma-1" color="deep-purple" label="Actividad" icon="mdi-file-edit" ></app-button>
                    </template>
                    <v-list-item-group color="deep-purple" mandatory>
                        <v-list nav>
                            <v-toolbar color="deep-purple lighten-1 subtitle-2" dense dark class="rounded-t-lg" flat>
                                Actividades
                            </v-toolbar>
                            <v-list-item color="deep-purple" @click="dialogActividad = true">
                            <v-list-item-avatar color="white" size="65">
                                <v-icon size="60">mdi-file-edit</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title>Actividad 1</v-list-item-title>
                                <v-list-item-subtitle>Descripcion de la Actividad</v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-action>
                                <v-btn icon>
                                    <v-icon size="25" color="red lighten-1">mdi-open-in-new</v-icon>
                                </v-btn>
                            </v-list-item-action>
                            </v-list-item>

                            
                        </v-list>
                    </v-list-item-group>
                </v-menu> -->
        
    </v-menu>

    <v-dialog v-model="dialogActividad" fullscreen  content-class="cyan lighten-3">
        <app-actividad :actividad="actividad" @closeModal="closeDialog('dialogActividad')" v-if="dialogActividad"></app-actividad>
    </v-dialog>

     </div>

</template>

<script>

import AppActividad from './AppActividad'

export default {

    components: { 
        'app-actividad': AppActividad
    },

    props:
    {
        itemas:{
            type: Array,
            default: () => []
        } 
    },

    data()
    {
        return {
            actividades:[
                { id: 1, nb_actividad: 'Actividad 1', tx_descripcion: 'Descripcion de la Actividad' },
            ],
            actividad:       null,
            dialogActividad: false
        }
    },

    methods:
    {
        closeDialog(dialog)
        {
            this[dialog] = false
        }
    }
}

</script>

