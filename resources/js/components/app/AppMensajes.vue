<template>
    <v-dialog v-model="showDialog" width="600" content-class="rounded-xl" scrollable>
        <template v-slot:activator="{ on }">
            <v-btn icon v-on="on">
                <v-badge color="orange" :content="totalMensaje" overlap dark :value="totalMensaje > 0">
                    <v-icon >mail</v-icon>
                </v-badge>
            </v-btn>
        </template>

        <v-card :loading="loading" class="rounded-xl" height="80vh">

            <v-card-title class="pa-0">
               <app-simple-toolbar title="Mensajes" @closeModal="showDialog = false"></app-simple-toolbar>
            </v-card-title>
    
            <v-card-text class="pa-0">

                <v-toolbar color="grey lighten-3" flat dense>

                    <v-tooltip bottom color="success">
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" class="mx-1" depressed dark icon small color="success" @click="getUnreads()"><v-icon>mdi-email-multiple</v-icon></v-btn>
                        </template>
                        <span>Mensajes sin Leer</span>
                    </v-tooltip>

                    <v-tooltip bottom color="purple">
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" class="mx-1" depressed dark icon small color="purple" @click="getReads()"><v-icon>mdi-email-open-multiple</v-icon></v-btn>
                        </template>
                        <span>Mensajes Leidos</span>
                    </v-tooltip>

                    <v-spacer></v-spacer>

                    <v-tooltip bottom color="orange">
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" class="mx-1" depressed dark icon small color="orange" @click="markReadAll()"><v-icon>mdi-email-check</v-icon></v-btn>
                        </template>
                        <span>Marcar todos como Leido</span>
                    </v-tooltip>

                </v-toolbar>

                <v-list two-line dense width="100%"> 

                    <v-list-item-group v-model="mensaje" flat>

                    <v-list-item v-for="(mensaje, idx) in mensajes" :key="idx" class="my-n3" :value="mensaje"> 
                        <v-badge right color="red" dot :offset-x="26" :offset-y="26" avatar bordered :value="!mensaje.fe_lectura">
                            <v-list-item-avatar :color="mensaje.tipo_prioridad.tx_color">
                                    <v-icon dark size="30" v-text="mensaje.tipo_mensaje.tx_icono"></v-icon>
                            </v-list-item-avatar>
                        </v-badge>                        
                        <v-list-item-content>
                            <v-list-item-title v-text="mensaje.usuario.nb_nombres"></v-list-item-title>
                            <v-list-item-subtitle v-text="mensaje.tx_asunto"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-icon>
                            <item-menu 
                                :menus="itemsMenu" 
                                iconColor="grey lighten-5" 
                                btnColor="cyan" 
                                :item="mensaje"
                                @onItemMenu="onItemMenu($event)" 
                            ></item-menu>
                        </v-list-item-icon>

                    </v-list-item>

                    </v-list-item-group>

                </v-list>
            
            </v-card-text>
                
        </v-card>

        <v-dialog v-model="selected" max-width="500" content-class="rounded-xl" v-if="(mensaje) ? mensaje.id : false ">
            <v-card >

                <v-card-title class="pa-0" >
                    <v-toolbar dense class="rounded-t-xl" flat :color="mensaje.tipo_prioridad.tx_color" dark>
                        <v-icon dark class="mr-4" v-text="mensaje.tipo_mensaje.tx_icono"></v-icon>
                        {{mensaje.tipo_mensaje.nb_tipo_mensaje}}
                    </v-toolbar>
                </v-card-title>
                <v-card-text class="pt-3">
                    
                    <v-row dense>
                       <v-col class="text-uppercase font-weight-black">
                           <v-icon color="indigo" class="mr-1">mdi-account-circle</v-icon>{{mensaje.usuario.nb_nombres}}
                        </v-col>
                       <v-col cols="auto" >
                           <v-icon color="indigo" class="mr-1">mdi-calendar</v-icon>{{mensaje.fe_mensaje | formatDate}}
                        </v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Asunto:</v-col>
                       <v-col cols="8" class="body-2">{{mensaje.tx_asunto}}.</v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Mensaje:</v-col>
                       <v-col cols="8" class="body-2">{{mensaje.tx_mensaje}}</v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Lugar:</v-col>
                       <v-col cols="8" class="body-2">{{mensaje.tx_lugar}}</v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Hora:</v-col>
                       <v-col cols="8" class="body-2">{{mensaje.hh_inicio | formatTime}} - {{mensaje.hh_fin | formatTime}}</v-col>
                   </v-row>
                </v-card-text>
            </v-card>
        </v-dialog>

        <v-dialog v-model="dialogReply" max-width="500" content-class="rounded-xl">
           <app-mensaje 
                :tipo-destinatario="replyMensaje.tipoDestinatario"
                :tipo-mensaje="replyMensaje.tipoMensaje"
                :tipo-prioridad="replyMensaje.tipoPrioridad"
                :id-destinatario="replyMensaje.idDestinatario"
                :asunto="replyMensaje.asunto"
                v-if="dialogReply" 
                @closeModal="closeDialog('dialogReply')">
            </app-mensaje>
        </v-dialog>


    </v-dialog>
</template>

<script>
import AppData from '@mixins/AppData';
import AppMensaje from '@pages/mensaje/AppMensaje';
export default {

    mixins: [ AppData ],

    components:
    {
        'app-mensaje' :         AppMensaje,
    },

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

        totalMensaje()
        {
            return this.mensajes.length
        },

    },

    watch:
    {
        mensaje(mensaje)
        {
            if(mensaje)
            {
                this.selected = true
                if(mensaje.fe_lectura ? mensaje.fe_lectura != 1 : false )
                {
                    this.markRead(mensaje)
                }
            }
        },

        selected(selected)
        {
            if(!selected)
            {
                this.mensaje = null
            }
        }
    },

    data () {
        return {
            showDialog: false,
            loading:    false,
            mensajes: [],
            itemsMenu: [
                { action: 'reply',    icon: 'mdi-reply', label: 'Responder' }, 
                { action: 'delete',   icon: 'mdi-delete', label: 'Eliminar' },
            ],
            mensaje:      null,
            selected:     false,
            dialogReply:  false,
            replyMensaje: null
        }
    },

    methods: 
    {
        getUnreads()
        {            
            this.getResource(`mensaje/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/unread`).then( data =>{
                this.mensajes = data
            })
        },

        getReads()
        {            
            this.getResource(`mensaje/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/read`).then( data =>{
                this.mensajes = data
            })
        },

        reply(mensaje)
        {
           this.replyMensaje = {
                                tipoDestinatario: mensaje.usuario.id_tipo_usuario,
                                tipoMensaje:      mensaje.id_tipo_mensaje,
                                tipoPrioridad:    mensaje.id_tipo_prioridad,
                                idDestinatario:   mensaje.usuario.id,
                                asunto:           'RP: ' + mensaje.tx_asunto,
                                mensaje:          null,
                                fecha:            null,
                                inicio:           null,
                                fin:              null
                            } 

            console.log('reply', this.replyMensaje)
            this.dialogReply = true
        },

        closeDialog()
        {
            this.dialogReply  = false
            this.replyMensaje = null
        },

        markRead(mensaje)
        {
            this.updateResource(`mensaje/${mensaje.id}/read`).then( data =>{

                this.mensajes.forEach( (notif, idx) =>{ 
                    if(notif.id == mensaje.id )  this.mensajes[idx].fe_lectura  = 1
                })
            })
        },

        markReadAll()
        {
            
            if(this.mensajes.length < 1) return
            this.updateResource(`mensaje/destinatario/${this.user.id}/tipoDestinatario/${this.user.id_tipo_usuario}/markreadall`)
            .then( data =>{
                this.mensajes.forEach( (notif, idx) => this.mensajes[idx].fe_lectura  = 1  )
            })
        },

        delete(mensaje)
        {
            this.deleteResource(`mensaje/${mensaje.id}`).then( data =>{
                this.showMessage(data.msj)
                this.mensajes = this.mensajes.filter( (notif) => notif.id  !=  mensaje.id  )
            })
        }
    }
}
</script>