<template>
    
    <v-dialog :value="confirm" persistent max-width="400" content-class="rounded-xl">

        <v-card>

        <app-simple-toolbar :title="titulo" @closeModal="$emit('closeConfirm', false)"></app-simple-toolbar> 
        
       
        <v-list two-line width="100%"> 

                    <v-list-item  > 
                        
                        <v-list-item-avatar color="grey lighten-4">
                            <v-icon  color="cyan" size="32">mdi-comment-question</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                        <v-list-item-title v-text="mensaje"></v-list-item-title>
                        </v-list-item-content>

                    </v-list-item>
            </v-list>

        <v-card-actions>
          <v-spacer></v-spacer>
          
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn  v-on="on" fab x-small @click="$emit('closeConfirm', false)"  class="error">
                        <v-icon>reply</v-icon>
                    </v-btn>
                </template>
                <span>Cancelar</span>
            </v-tooltip>

            <v-tooltip bottom >
                <template v-slot:activator="{ on }">
                    <v-btn v-on="on" fab small @click="$emit('closeConfirm', true)"  class="success ml-2">
                        <v-icon>mdi-check-bold</v-icon>
                    </v-btn>
                </template>
                <span>Confirmar</span>
            </v-tooltip>

        </v-card-actions>
        </v-card>

      </v-dialog>
</template>

<script>
export default {

    props:
    {
        confirm: {
            type: Boolean,
            default: false
        },

        titulo: {
            type: String,
            default: 'Confirmacion'
        },

        mensaje: {
            type: String,
            default: null
        },
    },
}
</script>

<style>
</style>
