<template>
<div class="text-center">
    <v-dialog v-model="showDialog" width="365" content-class="rounded-xl">
        <template v-slot:activator="{ on }">
            <v-btn icon v-on="on">
                <v-badge color="orange" :content="totalNotificationes" overlap dark :hidden="totalNotificationes < 1">
                    <v-icon >notification_important</v-icon>
                </v-badge>
            </v-btn>
        </template>

        <v-card :loading="loading" class="rounded-xl">
    
            <app-simple-toolbar title="Notificaciones" @closeModal="showDialog = false"></app-simple-toolbar>

                <v-list two-line dense width="100%"> 

                    <v-list-item v-for="(notificacion, idx) in notificaciones" :key="idx" > 
                        
                        <v-list-item-avatar color="grey lighten-4">
                            <v-icon  color="red" size="38">mdi-bell-circle</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                        <v-list-item-title v-text="notificacion.title"></v-list-item-title>
                        <v-list-item-subtitle v-text="notificacion.detail"></v-list-item-subtitle>
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
                </v-list>
                
        </v-card>
    </v-dialog>
</div>
</template>

<script>
import AppData from '@mixins/AppData';
export default {
    mixins: [ AppData ],
    data () {
        return {
            showDialog: false,
            loading: false,
            notificaciones: [
                { user: 'Luis Yustiz', full_url: null, title: 'Reunion', detail: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', start:'2020-07-07 07:20', end: '2020-07-07 09:20' },
                { user: 'Jose Rizo', full_url: null, title: 'Reunion', detail: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', start:'2020-07-07 07:20', end: '2020-07-07 09:20' },
                { user: 'Luisa Tovar', full_url: null, title: 'Reunion', detail: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', start:'2020-07-07 07:20', end: '2020-07-07 09:20' }
            ],
            itemsMenu: [
                { action: 'repply', icon: 'mdi-reply', label: 'Responder' },
                { action: 'close', icon: 'mdi-delete-circle', label: 'Eliminar' },
        ],
        }
    },
    computed:
    {
        totalNotificationes()
        {
            return this.notificaciones.length
        }
    },

    methods: 
    {
    
    }
}
</script>