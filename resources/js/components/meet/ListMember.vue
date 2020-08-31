<template>

    <v-list subheader two-line dense width="100%" color="grey darken-3" class="rounded-lg elevation-3" dark> 
                                
        <v-subheader dark inset class="rounded-t-lg ">
            Participantes Conectados:  {{members.length}} 
        </v-subheader>
        <v-divider dark></v-divider>

        <div class="members-container py-1">

            <v-list-item v-if="members.length < 1">
                <v-list-item-avatar color="grey lighten-2">
                    <v-icon color="indigo" size="26">mdi-account-multiple-remove</v-icon>
                </v-list-item-avatar>
                <v-list-item-content>
                    <v-list-item-title>No existen Usuarios Conectados</v-list-item-title>
                </v-list-item-content>
            </v-list-item>    
            
            <v-list-item v-for="(member, idx) in members" :key="idx" v-else> 
                
                <v-list-item-action tile class="mr-2 ml-n2 mt-0 mb-1">
                    <slot name="video" :member="member"></slot>
                </v-list-item-action>

                <v-list-item-content>
                    <v-row no-gutters class="grey darken-4 rounded-lg pa-1 subtitle-2 text-center">
                        <list-simple-icon icon="mdi-information" :label="member.nb_nombres" color="blue" class="mr-2"></list-simple-icon>
                        <v-col>{{`${member.nb_usuario}`}} </v-col> 
                    </v-row>
                    <v-row no-gutters justify="space-around">
                        <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed>
                            <v-icon color="amber" size="36">mdi-hand</v-icon>
                        </v-btn>
                        <send-message @sendMessage="sendMessage($event, member)"></send-message>
                    </v-row>
                </v-list-item-content>

            </v-list-item> 

        </div>

    </v-list>

</template>

<script>
import Message     from './TextMessage';
export default {

    components:
    {
        'send-message': Message,
    },

    props:
    {
        members: {
            type:    Array,
            default: null
        },

    },

}
</script>

<style>
.members-container{
    height: 60vh;
    max-height: 60vh;
    display: block;
    overflow-y: scroll;
}
</style>