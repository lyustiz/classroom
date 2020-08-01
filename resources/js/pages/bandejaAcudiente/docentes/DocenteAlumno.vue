<template>

    <v-card flat :loading="loading" height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Docentes" @closeModal="$emit('closeModal')"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="mt-3">

            <v-row no-gutters justify="center"> 

                <v-col>

                 <v-list subheader two-line dense width="100%" color="grey lighten-4" class="rounded-xl"> 

                    <v-subheader class="grey pl-4 lighten-3 rounded-t-xl">
                        <v-icon class="mr-2" color="orange">mdi-account-tie</v-icon>Docente por Materia
                    </v-subheader>

                    <v-list-item v-for="(materia, idx) in marerias" :key="idx" > 
                        <v-list-item-avatar>
                            <v-img :src="getDocente(materia).foto.full_url" v-if="getDocente(materia).foto"></v-img>
                            <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                        <v-list-item-title v-text="getDocente(materia).nb_corto"></v-list-item-title>
                        <v-list-item-subtitle v-text="materia.nb_materia"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-icon>
                            <item-menu :item="getDocente(materia)" btn-color="indigo" iconColor="white" :menus="itemsMenu" @onItemMenu="onItemMenu($event)" ></item-menu>
                        </v-list-item-icon>
                    </v-list-item>

                </v-list>

                </v-col>

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
import DataHelper from '@mixins/AppData';
import AppNotificacion from '@pages/notificacion/AppNotificacion';
export default {

    mixins:     [ DataHelper ],

    components:
    {
        'app-notificacion' : AppNotificacion
    },

    props: {
         alumno: {
            type:       Object,
            default:    {}
        },
    },

    created()
    {
        this.list()
    },

    data () {
        return {
        
            marerias: [],
            itemsMenu: [
                { label: 'Notificar Docente', icon: 'mdi-bell-alert', action: 'addNotificacion' },
            ],
            dialogNotificacion: false,
            notificacion:       {}
        }
    },

    methods:
    {
        list()
        {
           this.getResource( `materia/docente/alumno/${this.alumno.id}` ).then( data =>  this.marerias = data )
        },

        getDocente(materia)
        {
            return (materia.plan_evaluacion) ? materia.plan_evaluacion[0].docente : { nb_corto: 'Por Asignar'};
        },

        addNotificacion(docente)
        {
            if(docente.nb_corto == 'Por Asignar')
            {
                this.showError('Docente pendiente por Asignar')
                return
            }
            
            this.dialogNotificacion = true

            this.notificacion = {
                tipoDestinatario: 2,
                tipoNotificacion: 1,
                tipoPrioridad:    1,
                idDestinatario:   docente.id,
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

