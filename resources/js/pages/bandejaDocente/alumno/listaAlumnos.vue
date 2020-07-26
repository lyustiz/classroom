<template>

    <v-card flat :loading="loading">

        <v-card-text class="pt-2">
            <v-row justify="center"> 
              
              <v-expansion-panels focusable class="rounded-xl" accordion v-model="section" >
                    <v-expansion-panel v-for="grupo in grupos" :key="grupo.id">
                        
                        <v-expansion-panel-header>
                            <template v-slot:default >
                                <div>
                                    <v-icon color="red" class="mr-1">mdi-school</v-icon> {{ grupo.nb_grupo }} 
                                </div>
                            </template>
                        </v-expansion-panel-header>

                        <v-expansion-panel-content class="expand-alumnos">
                            <v-list subheader two-line dense> 

                                <v-list-item v-for="alumno in grupo.alumno" :key="alumno.id" > 
                                    <v-list-item-avatar>
                                        <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                                        <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                                    </v-list-item-avatar>

                                    <v-list-item-content>
                                    <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                                    <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                                    </v-list-item-content>

                                    <v-list-item-icon>
                                        <item-menu :item="alumno" iconColor="deep-purple lighten-5" :menus="itemsMenu" @onItemMenu="onItemMenu($event)" ></item-menu>
                                    </v-list-item-icon>
                                </v-list-item>
                            </v-list>
                        </v-expansion-panel-content>

                    </v-expansion-panel>
                </v-expansion-panels> 

            </v-row>

        </v-card-text>   

        <v-dialog v-model="dialogNotificacion" max-width="600" content-class="rounded-xl">
            <app-notificacion 
                :tipo-destinatario="notificacion.tipoDestinatario"
                :tipo-notificacion="notificacion.tipoNotificacion"
                :tipo-prioridad="notificacion.tipoPrioridad"
                :id-destinatario="notificacion.idDestinatario"
                v-if="dialogNotificacion" 
                @closeModal="closeDialog('dialogNotificacion')">
            </app-notificacion>
        </v-dialog>

    </v-card>

</template>

<script>
import AppData from '@mixins/AppData';
import AppNotificacion from '@pages/notificacion/AppNotificacion';

export default {

    mixins:     [ AppData ],

    components:
    {
        'app-notificacion' : AppNotificacion
    },

    created()
    {
        this.list()
    },

    data () {
        return {
            docente:  1,     //TODO: agregar docente
            section: null,
            grupos:   [],
            itemsMenu: [
                { label: 'Evaluaciones Alumno', icon: 'mdi-notebook', action: 'addEvaluacion' },
                { label: 'Notificar Alumno', icon: 'mdi-bell-alert', action: 'addNotificacion' },
            ],
            dialogNotificacion: false,
            notificacion:       {}
        }
    },
    methods:
    {
        list()
        {
           this.getResource( `grupo/alumnos/docente/${this.docente}` ).then( data => this.grupos = data )
        },

        addNotificacion(alumno)
        {
            this.dialogNotificacion = true

            this.notificacion = {
                tipoDestinatario:  3,
                tipoNotificacion: 1,
                tipoPrioridad:    1,
                idDestinatario:   alumno.id,
                asunto:           null,
                mensaje:          null,
                fecha:            null,
                inicio:           null,
                fin:              null
            }
        },

        closeDialog(dialog)
        {
            this[dialog] = false
            this.notificacion = {}
        }

    }
}
</script>

<style scoped>

.expand-alumnos{
    max-height: 51vh !important;
    overflow-y: scroll;
}
</style>