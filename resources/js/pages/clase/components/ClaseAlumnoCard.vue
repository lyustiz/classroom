<template>

    <v-card class="rounded-xl">

        <v-card-title class="pa-0" >
            <v-toolbar :color="clase.materia.area_estudio.tx_color" dense dark class="rounded-t-xl" flat>
                <v-row>
                    <v-col> 
                        <h5 class="mt-1">{{ clase.materia.nb_materia}} - {{clase.fe_clase | formatDate}}</h5>
                    </v-col>
                </v-row>
            </v-toolbar>
        </v-card-title>

        <v-card-text>

            <v-row dense align="center">
                <v-col>
                    <v-row no-gutters>
                        <v-col cols="12">
                            <v-avatar size="110" color="indigo" class="mx-2">
                                    <v-img :src="clase.docente.foto.full_url" v-if="clase.docente.foto"></v-img>
                                    <v-icon v-else dark size="90">mdi-account-tie</v-icon>
                            </v-avatar>
                        </v-col>
                        <v-col cols="12" class="caption text-center">{{clase.docente.nb_corto}}</v-col>
                    </v-row>
                   
                </v-col>

                <v-col>
                    <v-row justify="center" align="center">
                        <v-col cols="auto" class="text-center">
                            <v-icon color="green" size="85" v-if="clase.fe_completada">mdi-checkbox-marked-circle-outline</v-icon>
                            <v-icon color="amber" size="88" class="mdi-spin" v-else ripple>mdi-cog-clockwise</v-icon>
                            <div class="caption">{{  (clase.fe_completada) ? 'Completada' : 'En proceso...' }}</div>
                        </v-col>
                    </v-row>
                </v-col>

                <v-col>
                    
                    <v-row>
                        <v-col class="text-center">
                            <v-avatar size="80" color="indigo" class="mx-2 pointer" ripple @click="starChat()">
                                <v-icon ripple dark size="75">mdi-wechat</v-icon>
                            </v-avatar>
                            <div class="caption">chat</div>
                        </v-col>
                    </v-row>
                </v-col>

            </v-row>
            
        </v-card-text>

        <v-dialog v-model="dialogChat" max-width="600" content-class="rounded-xl" scrollable>
            <AppChat class="rounded-lg elevation-3" :messages="chatMsg" :active="dialogChat" @send-chat="sendChat($event)" @closeDialog="dialogChat = false"></AppChat>
        </v-dialog>

    </v-card>

</template>

<script>
import AppData       from '@mixins/AppData';
import AppChat       from './ClaseChat';

export default {

    components: {
        AppChat
    },

    mixins: [AppData],

    props:
    {
        clase: {
            type:   Object,
            defult: () => {}
        },
    },

    watch:
    {
        clase(clase)
        {
            if(clase)
            {
                this.asistencia = this.clase.asistencia
            }
        }
    },

    data () {
        return {
            title:    'Clase',
            resource: 'clase',
            asistencia: null,
            dialogChat: false,
            chatMsg:    [
                            { nb_usuario: 'lyustiz', message: 'Prueba de Chat' },
                            { nb_usuario: 'ljyustiz', message: 'Prueba de Chat2' },
                            { nb_usuario: 'ljyustiz', message: 'Prueba de Chat2' }
                        ]
        }
    },

    methods:
    {
        closeDialog(dialog, refresh)
        {
            this[dialog]   = false
            if(refresh)    this.list()
        },

        starChat(){
            this.dialogChat = true
        },

        sendChat()
        {

        }
    }
}
</script>

<style>

</style>