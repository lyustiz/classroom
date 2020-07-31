<template>

    <v-card flat :loading="loading">

        <v-card-text class="pt-2">

            <v-toolbar color="grey lighten-4 subtitle-2" dense flat class="rounded-xl mb-2 avatar-toolbar" >
                <v-avatar color="grey lighten-3" class="mx-0">
                    <v-icon color="indigo" size="40">mdi-account-tie</v-icon>
                </v-avatar>
                <div class="indigo--text ml-3">Docentes por Materia</div>
            </v-toolbar>

            <v-row justify="center"> 

                 <v-list subheader two-line dense> 

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
                            <item-menu :item="getDocente(materia)" btn-color="primary" iconColor="deep-purple lighten-5" :menus="itemsMenu" @onItemMenu="onItemMenu($event)" ></item-menu>
                        </v-list-item-icon>
                    </v-list-item>

                </v-list>

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

