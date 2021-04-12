<template>
    <v-dialog v-model="showDialog" width="500" content-class="rounded-xl" scrollable>
        
        <template v-slot:activator="{ on }">
            <v-btn icon v-on="on">
                <v-badge color="orange" :content="totalNotificationes" overlap dark :value="totalNotificationes > 0">
                    <v-icon >notification_important</v-icon>
                </v-badge>
            </v-btn>
            
            <audio ref="audioNotificacion" id="audioNotificacion">
                <source type="audio/wav" src="/notificacion.wav">
                <source type="audio/mp3" src="/notificacion.mp3">
            </audio>
        </template>

        <v-card :loading="loading" class="rounded-xl" height="410">
            <v-card-title class="pa-0">
               <app-simple-toolbar title="Notificaciones" @closeModal="showDialog = false"></app-simple-toolbar>
            </v-card-title>
            <v-card-text class="pa-0">
                <v-toolbar color="grey lighten-3" flat dense>
                    <v-btn class="mx-1" depressed dark fab x-small color="indigo" @click="getAll()"><v-icon size="20">mdi-sync</v-icon></v-btn>
                    <v-btn class="mx-1" depressed dark fab x-small color="orange" @click="getUnreads()"><v-icon size="20">mdi-bell-alert</v-icon></v-btn>
                    <v-btn class="mx-1" depressed dark fab x-small color="green" @click="getReads()"><v-icon size="20">mdi-bell-check</v-icon></v-btn>
                    <v-spacer></v-spacer>
                    <v-btn class="mx-1" depressed dark fab x-small color="amber" @click="markReadAll()"><v-icon>mdi-check-all</v-icon></v-btn>
                </v-toolbar>
                <v-list dense width="100%" class="mt-n2"> 
                    <v-list-item-group v-model="notificacion" flat>
                        <v-list-item v-for="(notificacion, idx) in notificaciones" :key="idx" :value="notificacion"> 
                            <v-list-item-avatar :color="notificacion.tipo_notificacion.tx_color">
                                <v-icon dark size="26" v-text="notificacion.tipo_notificacion.tx_icono"></v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title v-text="notificacion.tx_mensaje"></v-list-item-title>
                            </v-list-item-content>
                            <v-list-item-avatar color="grey lighten-5">
                                <v-icon dark size="25" :color="(notificacion.fe_lectura) ? 'green': 'orange'" v-text="(notificacion.fe_lectura) ? 'mdi-bell-check': 'mdi-bell-alert' "></v-icon>
                            </v-list-item-avatar>
                        </v-list-item>
                    </v-list-item-group>
                </v-list>
            </v-card-text>
        </v-card>

        <v-dialog v-model="selected" max-width="500" content-class="rounded-xl">
            <v-card v-if="notificacion">
                <v-card-title class="pa-0" >
                    <v-toolbar dense class="rounded-t-xl" flat :color="notificacion.tipo_notificacion.tx_color" dark>
                        <v-col>
                            <v-icon dark class="mr-4" v-text="notificacion.tipo_notificacion.tx_icono"></v-icon>
                            {{notificacion.tipo_notificacion.nb_tipo_notificacion}}
                        </v-col>
                        <v-col cols="auto">
                            <v-icon dark @click="selected = false">mdi-close-circle-outline</v-icon>
                        </v-col>
                        
                    </v-toolbar>
                </v-card-title>
                <v-card-text class="pt-3">
                    <v-row dense>
                       <v-col cols="auto" >
                           <v-icon color="indigo" class="mr-1">mdi-calendar</v-icon>{{notificacion.fe_notificacion | formatDate}}
                        </v-col>
                   </v-row>
                   <v-row dense>
                       <v-col cols="3" class="subtitle-2">Mensaje:</v-col>
                       <v-col cols="8" class="body-2">{{notificacion.tx_mensaje}}</v-col>
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

    computed:
    {
        user() 
        {
            return this.$store.getters['getUser']
        },

        profile() 
        {
            return this.$store.getters['getProfile']
        },

        totalNotificationes()
        {
            return this.notificaciones.filter((notificacion) => !notificacion.fe_lectura).length
        },

        destinatario()
        {
            return this.user.id_origen
        },

        tipoDestinatario()
        {
            return this.profile.id
        }

    },

    mounted()
    {
        this.getAll()

        window.Echo.channel('notificacion-creada')
        .listen('NotificacionEvent', ({notificacion}) => {
            console.log(notificacion)
            if(notificacion.id_destinatario == this.destinatario && notificacion.id_tipo_destinatario == this.tipoDestinatario)
            {
                this.$refs.audioNotificacion.play();
                this.notificaciones.unshift(notificacion)
            }
        });
    },

    beforeDestroy(){
       window.Echo.leaveChannel('notificacion-creada');
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
            notificacion: null,
            selected: false
            
        }
    },

    methods: 
    {
        getAll()
        {            
            this.getResource(`notificacion/destinatario/${this.user.id_origen}/tipoDestinatario/${this.profile.id}/all`).then( data =>{
                this.notificaciones = data
            })
        },
        
        getUnreads()
        {            
            this.getResource(`notificacion/destinatario/${this.user.id_origen}/tipoDestinatario/${this.profile.id}/unread`).then( data =>{
                this.notificaciones = data
            })
        },

        getReads()
        {            
            this.getResource(`notificacion/destinatario/${this.user.id_origen}/tipoDestinatario/${this.profile.id}/read`).then( data =>{
                this.notificaciones = data
            })
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
            if(this.notificaciones.length < 1) return
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

<style>
#audioNotificacion {
    display: none;
}
</style>