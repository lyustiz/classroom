<template>

    <div>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="30" innerClass="ma-1" color="red" label="Contenido Multimedia" icon="mdi-play-box-multiple" ></app-button>
        </template>

        <v-list-item-group color="red" mandatory>
            <v-list nav>
                <v-toolbar color="red subtitle-2" dense dark class="rounded-t-lg" flat>
                    Contenido Multimedia
                </v-toolbar>
                
                <v-list-item color="red" v-for="actividad in actividades" :key="actividad.id" @click="showMedia(actividad)">
                    <v-list-item-avatar color="white" size="55">
                        <v-icon size="45" v-if="actividad.type == 'video'">mdi-play-box</v-icon>
                        <v-icon size="45" v-else>mdi-music-box</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ actividad.nb_actividad }}</v-list-item-title>
                        <v-list-item-subtitle>{{ actividad.tx_descripcion}}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="25" color="red lighten-1">mdi-play</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

            </v-list>
            
        </v-list-item-group>
        
    </v-menu>

    <v-dialog v-model="dialogVideo" width="80vw" content-class="black rounded-xl">
        <visor-video :video="{src: '/storage/recurso/guia/3/1596209029_virtualin.mp4'}" @closeModal="closeDialog('dialogVideo')" v-if="dialogVideo"></visor-video>
    </v-dialog>

     <v-dialog v-model="dialogAudio"  width="450" content-class="rounded-xl primary" hide-overlay >
        <visor-audio :audio="{src: '/storage/recurso/audio/1/fundamentos_macroeconomia.mp3'}" @closeModal="closeDialog('dialogAudio')" v-if="dialogAudio"></visor-audio>
    </v-dialog>

    </div>

    <!--   <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>
                    <template v-slot:activator="{ on }">
                        <app-button v-on="on" small :size="30" innerClass="ma-1" color="red" label="Contenido Multimedia" icon="mdi-play-box-multiple" ></app-button>
                    </template>
                    <v-list-item-group color="red" mandatory>
                        <v-list nav>
                            <v-toolbar color="red lighten-1 subtitle-2" dense dark class="rounded-t-lg" flat>
                                Multimedia
                            </v-toolbar>

                            <v-list-item color="red" @click="dialogVideo = true">
                                <v-list-item-avatar color="white" size="65">
                                    <v-icon size="60">mdi-play-box</v-icon>
                                </v-list-item-avatar>
                                <v-list-item-content>
                                    <v-list-item-title>Video 1</v-list-item-title>
                                    <v-list-item-subtitle>Prueba Virtualin</v-list-item-subtitle>
                                </v-list-item-content>
                                <v-list-item-action>
                                    <v-btn icon>
                                        <v-icon size="25" color="red lighten-1">mdi-open-in-new</v-icon>
                                    </v-btn>
                                </v-list-item-action>
                            </v-list-item>

                                <v-list-item color="red"  @click="dialogAudio = true">
                                <v-list-item-avatar color="white" size="65">
                                    <v-icon size="60">mdi-music-box</v-icon>
                                </v-list-item-avatar>
                                <v-list-item-content>
                                    <v-list-item-title>Audio 1</v-list-item-title>
                                    <v-list-item-subtitle>Prueba Virtualin</v-list-item-subtitle>
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

</template>

<script>

import VisorVideo   from './VisorVideo'
import VisorAudio   from './VisorAudio'

export default {

     components: { 
        'visor-video': VisorVideo,
        'visor-audio': VisorAudio,
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
                { id: 1, nb_actividad: 'Macroeconomia', tx_descripcion: 'Principios Basicos', type: 'video'},
                { id: 2,  nb_actividad: 'Audio Nro 1', tx_descripcion: 'Clase de Principios', type: 'audio'},
            ],
            dialogVideo: false,
            dialogAudio: false,
        }
    },

    methods:
    {
        closeDialog(dialog)
        {
            this[dialog] = false
        },

        showMedia(media)
        {
            if(media.type =='video')
            {
                this.dialogVideo = true

            } else {
                this.dialogAudio = true
            }
        }
    }
}

</script>

