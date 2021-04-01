<template>
<div class="botman">
   
    <v-avatar size="70" v-if="!chat"  @click="chat=true" class="elevation-12 pointer">
        <v-tooltip right top :value="true" color="transparent">
        <template v-slot:activator="{ on, attrs }">
            <v-img v-on="on" v-bind="attrs" src="/images/bot.gif"></v-img>
        </template>
        <v-chip dark color="amber">
            ¿En qué te puedo ayudar?
            <v-icon right>
                mdi-help
            </v-icon></v-chip>
        </v-tooltip>
    </v-avatar>

    <v-card v-else width="300" max-height="400" class="rounded-xl">
        <v-card-title class="primary white--text">
            <v-icon dark left>mdi-robot</v-icon>
            Virtualin <v-spacer></v-spacer> <v-btn dark icon small @click="chat=false"><v-icon>mdi-close-circle-outline</v-icon></v-btn>
        </v-card-title>
        <v-card-text>
            <v-list three-line dense v-if="!loading">
             <v-list-item v-for="(message,idx) in messages" :key="idx" class="grey lighten-2 rounded-tl-xl rounded-br-xl" > 
                <v-list-item-avatar>
                    <v-img src="/images/botman-ico.jpg"></v-img>
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title v-text="message.user"></v-list-item-title>
                    <v-list-item-subtitle v-text="message.text"></v-list-item-subtitle>
                </v-list-item-content>

            </v-list-item>
            </v-list>

            <v-row justify="center" v-else class="my-2">
                <v-progress-circular size="40" indeterminate color="purple"></v-progress-circular>
            </v-row>

            
              <!--   <v-list-item>
                    <v-list-item-avatar>
                        <v-img src="/images/bot-ico.gif"></v-img>
                    </v-list-item-avatar>
                </v-list-item> 
            ->
            
          <v-img src="/images/bot.gif"></v-img> -->
        </v-card-text>
        <v-card-actions>
            <v-row dense>
                <v-col> 
                    <v-text-field
                    v-model="message.message"
                    dense
                    rounded
                    single-line
                    hide-details=""
                    placeholder="escribe aqui..."
                    filled
                    autofocus
                    @keyup.enter="send()"
                    > </v-text-field>
                </v-col>
                <v-col cols="auto">
                    <v-btn icon color="success"><v-icon size="40" color="green" @click="send()">mdi-send-circle</v-icon></v-btn>
                </v-col>
           </v-row>
           
        </v-card-actions>
    </v-card>

</div>
  
</template>

<script>
import DataHelper from '@mixins/AppData';
    
export default {

    mixins:     [ DataHelper ],

    data()
    {
        return {
            component:    null,
            chat: false,
            messages: [ { user: 'virtualin', text: 'Hola, me llamo Virtualin ¿Cómo puedo ayudarte?'}],
            message:{
                driver: 'web',
                userId: this.idUser,
                message: null
            }
        }
    },

    methods:
    {
        send()
        {

            if(!this.message.message) return

            this.messages = [];

            this.postResource('botman', this.message).then( data =>{
                this.message.message = null
                for (const message of data.messages) {
                    this.messages.push({user: 'virtualin', text: message.text })
                }
            })
        }

    }
}
</script>

<style>
 .botman{
    position: fixed;
    right: 16px;
    bottom: 16px;
    z-index: 99;
 }
</style>