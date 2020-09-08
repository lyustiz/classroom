<template>
  <v-card class="rounded-xl">

        <v-toolbar color="indigo" dark flat>
            <div class="col-11">
                Eventos
            </div>
            <v-btn icon x-small  dark @click="$emit('closeModal')"><v-icon>mdi-close-circle</v-icon></v-btn>
        </v-toolbar>


        <v-card-text class="pt-4"> 

            <v-list three-line>

                <v-list-item  v-for="(event, i) in events" :key="i">
                    <v-tooltip bottom :color="event.color">
                        <template v-slot:activator="{ on }">
                            <v-list-item-avatar size="46" :color="event.color" v-on="on" >
                                <v-icon size="30" color="white">{{event.icon}}</v-icon>
                            </v-list-item-avatar>
                        </template>
                        <span v-text="`Tipo: ${event.type} - Categoria: ${event.category}`"></span>
                    </v-tooltip>

                    <v-list-item-content>
                        <v-list-item-title v-html="event.name"></v-list-item-title>
                        <v-list-item-subtitle v-html="event.description"></v-list-item-subtitle>
                    </v-list-item-content>

                    <v-list-item-action>
                        <item-menu 
                            :item="event" 
                            iconColor="grey darkend-1" 
                            btnColor="grey lighten-4" 
                            :menus="itemsMenu" 
                            @onItemMenu="onItemMenu($event)" >
                        </item-menu>
                    </v-list-item-action>
                </v-list-item>
            </v-list>

        </v-card-text>

     <v-dialog v-model="dialogNotificacion" max-width="600" content-class="rounded-xl">
            <app-notificacion 
                :tipo-destinatario="notificacion.tipoDestinatario"
                :tipo-notificacion="notificacion.tipoNotificacion"
                :tipo-prioridad="notificacion.tipoPrioridad"
                :id-destinatario="notificacion.idDestinatario"
                :asunto="notificacion.asunto"
                :mensaje="notificacion.mensaje"
                :lugar="notificacion.lugar"
                :fecha="notificacion.fecha"
                :inicio="notificacion.inicio"
                :fin="notificacion.fin"
                :readonly="true"
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
    
    props:
    {
        events: {
            type:       Array,
            default:    () => []
        },
    },

    computed:
    {
        user() 
        {
            return this.$store.getters['getUser']
        },
    },

    data()
    {
        return{
            itemsMenu: [
                { action: 'addNotificacion',   icon: 'mdi-bell-plus', label: 'Agregar Notificacion' },
            ],
            dialogNotificacion: false,
            notificacion:       {}
        }
    },

    methods:
    {
        addNotificacion(event)
        {
            this.notificacion = {
                tipoDestinatario: this.user.id_tipo_usuario,
                tipoNotificacion: 2,
                tipoPrioridad:    1,
                idDestinatario:   this.user.id,
                asunto:           event.name,
                mensaje:          event.description,
                lugar:            'N/A',
                fecha:            event.date,
                inicio:           this.hourFromDate(event.start),
                fin:              this.hourFromDate(event.end)
            }
            
            this.dialogNotificacion = true
        },

        closeDialog(dialog)
        {
            this[dialog] = false
            this.notificacion = {}
        }
    }
}
</script>

<style>

</style>