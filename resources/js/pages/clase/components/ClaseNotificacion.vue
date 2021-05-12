<template>
  
    <v-card>
        
        <v-card-title class="pa-0" >
            <app-simple-toolbar :title="`Notificar: ${clase.grupo.nb_grupo} - ${clase.materia.nb_materia}`" @closeModal="$emit('closeDialog')"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="pb-0">

        <v-form ref="form" v-model="valid" lazy-validation>

        <v-row no-gutters class="mt-4">
                    
            <v-col cols="12" md="12">
                <v-textarea
                    :rules="[rules.required]"
                    v-model="form.tx_mensaje"
                    label="Mensaje"
                    placeholder="Indique Mensaje"
                    prepend-icon="mdi-message-bulleted"
                    dense
                    single-line
                    rounded
                    filled
                    counter
                    maxlength="300"
                ></v-textarea>
            </v-col>

        </v-row>

        </v-form>

        </v-card-text>
            
        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab depressed x-small color="error" @click="$emit('closeDialog')" :loading="loading">
               <v-icon>mdi-reply</v-icon>
            </v-btn>
            <v-btn fab depressed small color="success" :disabled="!valid" @click="send()" :loading="loading">
                <v-icon>mdi-send</v-icon>
            </v-btn>
            
        </v-card-actions>

    </v-card>

</template>

<script>
import AppData       from '@mixins/AppData';

export default {

    mixins: [AppData],

    props:
    {
        clase: {
            type: Object,
            default: () => {}
        }
    },

   data () {
        return {
            form: {               
                id_tipo_destinatario: 3,
                tx_mensaje:           null,
                id_tipo_notificacion: 5,
                id_usuario:           this.idUser,
            }
        }
   },

   methods:
   {
       send() {

           if (!this.$refs.form.validate())  return 

           this.storeResource(`notificacion/grupo/${this.clase.grupo.id}`, this.form).then((data) => {
               this.showMessage(data.msj)
               this.$emit('closeDialog')
           })
           
       }
   }
}
</script>

<style>

</style>