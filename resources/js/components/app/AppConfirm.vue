<template>
    
    <v-dialog :value="confirm" persistent max-width="400" content-class="rounded-xl">

        <v-card>

        <app-simple-toolbar :title="titulo" @closeModal="$emit('closeConfirm', false)"></app-simple-toolbar> 
        
    
        <v-alert type="info" icon="mdi-comment-question" prominent outlined class="mt-3 mx-3">
            {{mensaje}}
        </v-alert>
       
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
