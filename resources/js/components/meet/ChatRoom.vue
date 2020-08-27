<template>
    <v-list subheader two-line dense width="100%" color="grey darken-3" class="rounded-xl" dark> 
                    
        <v-subheader class="indigo pl-6 rounded-t-xl">
            Chat {{members.length}} 
        </v-subheader>

        <v-list-item v-if="members.length < 1">
            <v-list-item-avatar color="grey lighten-2">
                <v-icon color="indigo" size="34">mdi-account-multiple-remove</v-icon>
            </v-list-item-avatar>
            <v-list-item-content>
                <v-list-item-title>No existen Usuarios Conectados</v-list-item-title>
            </v-list-item-content>
        </v-list-item>    
        
        <v-list-item v-for="(member, idx) in members" :key="idx" v-else> 
            
            <v-list-item-action tile class="mb-6">
                
                <video class="rounded-lg mb-n3 elevation-3 grey darken-4" :ref="[`remote-video-${member.id}`]" width="170" height="90" autoplay playsinline></video>
                
                <v-hover v-slot:default="{ hover }">
                    
                    <v-toolbar color="rgba(0,0,0,0.05)" class="mt-n16 elevation-0 text-center rounded-l-lg">
                        <v-row no-gutters justify="center">
                            
                            <v-expand-x-transition>
                                <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" v-show="hover" transition="slide-x-transition">
                                    <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                                </v-btn>
                            </v-expand-x-transition>
                            
                            <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed>
                                <v-icon>mdi-dots-vertical</v-icon>
                            </v-btn>
                            
                        </v-row>
                    </v-toolbar>
                    
                </v-hover>

            </v-list-item-action>

            <v-list-item-content>
                <v-list-item-title v-text="member.nb_usuario"></v-list-item-title>
                <v-list-item-subtitle v-text="member.nb_nombres"></v-list-item-subtitle>
            </v-list-item-content>

            <v-list-item-action>
                <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed @click="handUp(member.id)">
                    <v-icon color="amber">mdi-hand</v-icon>
                </v-btn>

            </v-list-item-action>

            <v-list-item-action>
                <send-message @sendMessage="sendMessage($event, member)"></send-message>
            </v-list-item-action>

            <v-list-item-action>
                <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed>
                    <v-icon color="grey lighten-2">mdi-dots-vertical</v-icon>
                </v-btn>
            </v-list-item-action>
        </v-list-item> 


    </v-list>
</template>

<script>

export default {

    props: {
        messages: {
            type: Array,
            default: () => []
        } 
    },

    data: () => ({
        message:  null,
    }),

    methods:
    {
        cancel()
        {
            this.message = null
        },

        sendMessage()
        {
            this.$emit('send-message', message )
            this.message = null
        }
    }


}
</script>

<style>

</style>