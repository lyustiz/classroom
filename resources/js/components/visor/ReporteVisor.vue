<template>

<v-dialog
    v-model="dialog"
    width="400" 
    persistent 
    content-class="rounded-xl"
    transition="dialog-transition">

    <template v-slot:activator="{ on, attrs }">
         <v-btn x-small color="warning" v-on="on" v-bind="attrs">
            <v-icon size="16" class="mr-1"> mdi-alert-circle</v-icon>
            Reportar
        </v-btn>
    </template>

  <v-card class="rounded-xl">

      <v-card-title primary-title>
           <v-toolbar-title class="caption">Reportar Video</v-toolbar-title>
            <v-spacer></v-spacer>
             <v-btn icon x-small class="mr-2 ml-4" :class="textColor" @click="dialog=false">    
                <v-icon>mdi-close-circle</v-icon>
            </v-btn>
      </v-card-title>

      <v-card-text v-if="dialog">
          <v-form ref="form" v-model="valid" lazy-validation>
          <v-row dense>

              <v-col cols="12">
                   <v-select
                        v-model="e1"
                        :items="tipos"
                        :rules="[rules.select]"
                        menu-props="auto"
                        label="Tipo Reporte"
                        rounded
                        dense
                        filled
                    ></v-select>
              </v-col>
              <v-col cols="12">
                <v-textarea
                    :rules="[rules.max(100)]"
                    label="Observaciones"
                    textarea
                    rows="2"
                    counter
                    rounded
                    dense
                    filled
                ></v-textarea>
              </v-col>
          </v-row>
            </v-form>
      </v-card-text>
        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab depressed x-small color="error" @click="dialog = false">
               <v-icon>mdi-reply</v-icon>
            </v-btn>
            <v-btn fab depressed small color="success" :disabled="!valid" @click="send()">
                <v-icon>mdi-send</v-icon>
            </v-btn>
        </v-card-actions>
  </v-card>
  </v-dialog>
</template>

<script>
import AppData   from '@mixins/AppData';
export default {

   mixins: [AppData], 

    props:
    {
        tipo:{
            type: String,
        },

        data:{
            type: Object,
            default: () => {}
        }
    },

   data()
    {
        return {
            tipos: ['Enlace Caido', 'No corresponde a la Materia', 'Contenido Inadecuado'],
            dialog: false,
            form: {
                id_tipo:           null,
                tx_observaciones:  null,
                id_usuario:        this.IdUser
            }
        }
    },

    methods:  {
        send()
        {
            if (!this.$refs.form.validate())  return 
            this.showMessage('Notificacion Enviada')
            this.dialog = false
        }
    }
}
</script>

<style>

</style>