<template>

    <v-card color="info darken-3 rounded-lg elevation-3" height="60vh">

    <v-card-title>

         <v-toolbar-title class="white--text caption"> <v-icon ripple dark class="mx-2">mdi-wechat</v-icon> Chat </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn dark icon x-small @click="$emit('closeDialog', false)"><v-icon>mdi-close-circle</v-icon></v-btn>

    </v-card-title> 

    <v-card-text class="rounded-lg">
                
        <v-list two-line ref="chat" subheader dense width="100%" color="rgba(255,255,255,0.05)" class="rounded-lg" dark>
                                
                <v-list-item  v-for="(msj, idx) in chat" :key="idx" color="rgba(255,255,255,0.05)"> 

                    <v-list-item-avatar color="grey lighten-2" size="45">
                        <v-icon color="indigo" size="48">mdi-account-circle</v-icon>
                    </v-list-item-avatar>
                    
                    <v-list-item-content>
                        <v-list-item-title v-text="msj.nb_usuario"></v-list-item-title>
                        <v-list-item-subtitle v-text="msj.message"></v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item> 
               
              <span ref="scroll" tabindex="1"></span>  
        </v-list> 
        

    </v-card-text>

    <v-card-actions>
        <v-row dense>
            <v-col>
                <v-text-field
                    ref="send"
                    dark
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
                <v-btn  fab x-small class="mt-1" color="success" @click="sendMessage()" @keyup.enter="sendMessage()">
                    <v-icon>mdi-send</v-icon>
                </v-btn>
            </v-col>
        </v-row>
        
    </v-card-actions>

    </v-card>

</template>

<script>

export default {

    created()
    {
        this.chat = this.messages
    },

    props: {
        messages: {
            type: Array,
            default: () => []
        }

    },

    created()
    {
        this.setFocus()
    },

    data: () => ({
        chat: [],
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

            this.chat.push({ nb_usuario: 'lyustiz',  message: this.message  } )
           
            this.message = null
 
            this.$nextTick(() => {
               this.setFocus()
            })
        },

        setFocus()
        {
            this.$refs.scroll.scrollIntoView({block: "end", behavior: "smooth"})
            this.$refs.send.focus() 
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