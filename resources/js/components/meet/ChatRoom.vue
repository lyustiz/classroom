<template>

    <v-card color="info darken-3 rounded-lg elevation-3"> 
        
    <v-list subheader dense width="100%" color="info darken-3" class="rounded-lg" dark>
            
        <v-subheader dark class="rounded-t-lg ">
            Chat
        </v-subheader>
        <v-divider dark></v-divider>

        <v-virtual-scroll height="147" :items="messages" :item-height="45">

        <template v-slot="{ item }">

            <v-list-item color="amber lighten-3"> 

                <v-list-item-avatar color="grey lighten-2">
                    <v-icon color="indigo" size="30">mdi-account-circle</v-icon>
                </v-list-item-avatar>
                
                <v-list-item-content>
                    <v-list-item-title v-text="item.user.nb_usuario"></v-list-item-title>
                    <v-list-item-subtitle v-text="item.text"></v-list-item-subtitle>
                </v-list-item-content>

            </v-list-item> 

        </template>

        <v-divider id="newmsg"></v-divider>

        </v-virtual-scroll>

        <v-row class="mx-1 mb-n2">
            <v-col>
                <v-text-field
                    v-model="message"
                    label="Mensaje..."
                    counter
                    filled
                    rounded
                    single-line
                    hide-details
                    clearable
                    dense
                    @keyup.enter="sendMessage()"
                ></v-text-field>
            </v-col>
            <v-col cols="auto">
                <v-btn fab x-small class="mt-1" color="success" @click="sendMessage()">
                    <v-icon>mdi-send</v-icon>
                </v-btn>
            </v-col>
        </v-row>
    <!-- </v-card>   -->     
    </v-list>

    </v-card>

</template>

<script>

export default {

    created()
    {
        this.message = null
    },

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
            if(!this.message) return
            if(this.message.length < 1) return
            this.$emit('send-chat', this.message )
            this.message = null
            //this.$vuetify.goTo("#newmsg", {duration: 800, offset: 0, easing: 'easeInOutCubic'})
        }
    }
}
</script>

<style>
.chat-container{
    height: 22vh;
    max-height: 22vh;
    overflow-y: scroll;
}

</style>