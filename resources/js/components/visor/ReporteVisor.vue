<template>

<v-dialog
    v-model="dialog"
    width="400" 
    persistent 
    content-class="rounded-lg"
    transition="dialog-transition">

    <template v-slot:activator="{ on, attrs }">
         <v-btn x-small color="warning" v-on="on" v-bind="attrs">
            <v-icon size="16" class="mr-1"> mdi-clipboard-alert</v-icon>
            Reportar
        </v-btn>
    </template>

  <v-card class="rounded-lg">

      <v-card-title primary-title>
           <v-toolbar-title class="caption">Reportar Video</v-toolbar-title>
            <v-spacer></v-spacer>
             <v-btn icon x-small class="mr-2 ml-4"  @click="dialog=false">    
                <v-icon>mdi-close-circle</v-icon>
            </v-btn>
      </v-card-title>

      <v-card-text v-if="dialog" class="pb-0">
          <v-form ref="form" v-model="valid" lazy-validation>
          <v-row no-gutters>

              <v-col cols="12" class="mt-3">
                <v-select
                    v-model="form.nb_tipo_reporte"
                    :items="tipos"
                    :rules="[rules.select]"
                    menu-props="auto"
                    label="Tipo Reporte"
                    rounded
                    dense
                    filled
                ></v-select>
              </v-col>

              <v-col cols="12" class="mb-0">
                <v-textarea
                    v-model="form.tx_observaciones"
                    :rules="[rules.required,rules.max(100)]"
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
        },

        evaluacion: {
            type: Object,
            default: () => {}
        }
    },

    created()
    {
        console.log('data',this.data, this.evaluacion)
        
        this.form.nb_tipo       =  this.tipo
        this.form.id_evaluacion =  this.evaluacion.id_evaluacion;
        this.form.nb_asignacion =  this.data['name'];
    },

   data()
    {
        return {
            tipos: ['Enlace Caido', 'No corresponde a la Materia', 'Contenido Inadecuado'],
            dialog: false,
            form: {
                nb_tipo:           null,
                id_evaluacion:     null,
                nb_asignacion:     null,
                nb_tipo_reporte:   null,
                tx_observaciones:  null,
                id_usuario:        this.IdUser
            }
        }
    },

    methods:  {
        send()
        {
           if (!this.$refs.form.validate())  return 
           
           this.storeResource('notificacion/reportarEvaluacion', this.form).then( data => {
               this.showMessage(data.msj)
               this.$refs.form.reset()
               this.dialog = false

           })       
        },

        getName()
        {
            
        }
    }
}
</script>

<style>

</style>