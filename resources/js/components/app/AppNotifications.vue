<template>
    <v-dialog v-model="showDialog" width="600" content-class="rounded-xl" scrollable>
        <template v-slot:activator="{ on }">
            <v-btn icon v-on="on">
                <v-badge color="orange" :content="totalNotificationes" overlap dark :value="totalNotificationes > 0">
                    <v-icon >notification_important</v-icon>
                </v-badge>
            </v-btn>
        </template>

        <v-card :loading="loading" class="rounded-xl" height="80vh">

            <v-card-title class="pa-0">
               <app-simple-toolbar title="Notificaciones" @closeModal="showDialog = false"></app-simple-toolbar>
            </v-card-title>
    
            <v-card-text class="pa-0">

                <v-toolbar color="grey lighten-3" flat dense>
                    <v-btn class="mx-1" depressed dark fab x-small color="indigo" @click="getUnreads()"><v-icon>mdi-email-sync</v-icon></v-btn>
                    <v-btn class="mx-1" depressed dark fab x-small color="indigo" @click="getReads()"><v-icon>mdi-email-open-multiple</v-icon></v-btn>
                    <v-spacer></v-spacer>
                    <v-btn class="mx-1" depressed dark fab x-small color="amber" @click="markReadAll()"><v-icon>mdi-check-all</v-icon></v-btn>
                </v-toolbar>


                <v-list two-line dense width="100%"> 

                    <v-list-item-group v-model="notificacion" flat>

                    <v-list-item v-for="(notificacion, idx) in notificaciones" :key="idx" class="my-n3" :value="notificacion"> 
                        <v-badge right color="red" dot :offset-x="26" :offset-y="26" avatar bordered :value="!notificacion.fe_lectura">
                            <v-list-item-avatar :color="notificacion.tipo_prioridad.tx_color">
                                    <v-icon dark size="30" v-text="notificacion.tipo_notificacion.tx_icono"></v-icon>
                            </v-list-item-avatar>
                        </v-badge>                        
                        <v-list-item-content>
                            <v-list-item-title v-text="notificacion.usuario.nb_nombres"></v-list-item-title>
                            <v-list-item-subtitle v-text="notificacion.tx_asunto"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-icon>
                            <item-menu 
                                :menus="itemsMenu" 
                                iconColor="grey lighten-5" 
                                btnColor="cyan" 
                                :item="notificacion"
                                @onItemMenu="onItemMenu($event)" 
                            ></item-menu>
                        </v-list-item-icon>

                    </v-list-item>

                    </v-list-item-group>

                </v-list>
            
            </v-card-text>
                
        </v-card>

        <v-dialog v-model="selected" max-width="500" content-class="rounded-xl">
            <v-card v-if="notificacion">

                <v-card-title class="pa-0" >
                    <v-toolbar dense class="rounded-t-xl" flat :color="notificacion.tipo_prioridad.tx_color" dark>
                        <v-icon dark class="mr-4" v-text="notificacion.tipo_notificacion.tx_icono"></v-icon>
                        {{notificacion.tipo_notificacion.nb_tipo_notificacion}}
                    </v-toolbar>
                </v-card-title>
                <v-card-text class="pt-3">
                    
                    <v-row dense>
                       <v-col class="text-uppercase font-weight-black">
                           <v-icon color="indigo" class="mr-1">mdi-account-circle</v-icon>{{notificacion.usuario.nb_nombres}}
                        </v-col>
                       <v-col cols="auto" >
                           <v-icon color="indigo" class="mr-1">mdi-calendar</v-icon>{{notificacion.fe_notificacion | formatDate}}
                        </v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Asunto:</v-col>
                       <v-col cols="8" class="body-2">{{notificacion.tx_asunto}}.</v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Mensaje:</v-col>
                       <v-col cols="8" class="body-2">{{notificacion.tx_mensaje}}</v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Lugar:</v-col>
                       <v-col cols="8" class="body-2">{{notificacion.tx_lugar}}</v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Hora:</v-col>
                       <v-col cols="8" class="body-2">{{notificacion.hh_inicio | formatTime}} - {{notificacion.hh_fin | formatTime}}</v-col>
                   </v-row>
                </v-card-text>
            </v-card>
        </v-dialog>


    </v-dialog>
</template>

<script>
import AppData from '@mixins/AppData';
export default {

    mixins: [ AppData ],

    created()
    {
        this.getUnreads()
    },

    computed:
    {
        user() 
        {
            return this.$store.getters['getUser']
        },

        totalNotificationes()
        {
            return this.notificaciones.length
        },

    },

    watch:
    {
        notificacion(notificacion)
        {
            if(notificacion)
            {
                this.selected = true
                if(!notificacion.fe_lectura)
                {
                    this.markRead(notificacion)
                }
            }
        },

        selected(selected)
        {
            if(!selected)
            {
                this.notificacion = null
            }
        }
    },


    data () {
        return {
            showDialog: false,
            loading: false,
            notificaciones: [],
            itemsMenu: [
                { action: 'reply',    icon: 'mdi-reply', label: 'Responder' }, 
                { action: 'delete',   icon: 'mdi-delete', label: 'Eliminar' },
            ],
            notificacion: null,
            selected: false
            
        }
    },

    methods: 
    {
        getUnreads()
        {            
            this.getResource(`notificacion/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/unread`).then( data =>{
                this.notificaciones = data
            })
        },

        getReads()
        {            
            this.getResource(`notificacion/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/read`).then( data =>{
                this.notificaciones = data
            })
        },

        reply(notificacion)
        {
            /* this.getResource(`notificacion/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/unread`).then( data =>{
                this.notificaciones = data
            }) */
        },

        markRead(notificacion)
        {
            this.updateResource(`notificacion/${notificacion.id}/read`).then( data =>{
                
                
                this.notificaciones.forEach( (notif, idx) =>{ 
                    if(notif.id == notificacion.id )  this.notificaciones[idx].fe_lectura  = 1
                })
            })
        },

        markReadAll()
        {
            if(this.mensajes.length < 1) return
            this.updateResource(`notificacion/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/markreadall`)
            .then( data =>{
                this.notificaciones.forEach( (notif, idx) => this.notificaciones[idx].fe_lectura  = 1  )
            })
        },

        delete(notificacion)
        {
            this.deleteResource(`notificacion/${notificacion.id}`).then( data =>{
                this.showMessage(data.msj)
                this.notificaciones = this.notificaciones.filter( (notif) => notif.id  !=  notificacion.id  )
            })
        }
    }
}
</script>