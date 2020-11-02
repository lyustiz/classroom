<template>

    <v-card :loading="loading" flat height="80vh" color="grey lighten-5" >

        <v-card-title class="pa-0">
            <v-toolbar color="deep-purple" dark dense>
                <v-row dense>
                <v-col>
                    <v-icon size="30" class="ml-4" dark >mdi-order-bool-descending-variant</v-icon>
                    <span class="ml-3 mx-1">{{ prueba.nb_prueba}}  </span>    
                    <span class="ml-3 mx-1">({{ prueba.nu_peso}}) Pts. </span>                 
                </v-col>

                <v-col cols="auto">
                   <v-btn small icon dark class="mr-2"><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col>
                </v-row>
            </v-toolbar>
        </v-card-title>

        <v-card-text>

            <v-container fluid>
                
            <v-row>

                <v-col cols="4" v-for="pregunta in preguntas" :key="pregunta.id">
                    <v-card min-height="487" class="rounded-lg">
                        
                        <v-img class="white--text align-end" height="200px" src="/storage/foto/prueba/1/preguta1.png"></v-img> 
                        
                        <v-card-title>

                            <list-simple-icon 
                            color="info" 
                            icon="mdi-help" 
                            :label="pregunta.tx_observaciones"></list-simple-icon>
                            <div class="mx-2">{{pregunta.nb_pregunta}}</div>
                        </v-card-title>
                        
                        <v-card-text>
                           <v-list dense subheader>
                                <v-subheader class="">{{ pregunta.tipo_pregunta.tx_observaciones}} ({{pregunta.nu_valor}} Pts.)</v-subheader>
                                <v-list-item color="teal" v-for="respuesta in pregunta.respuesta" :key="respuesta.id">
                                    <v-list-item-icon>
                                        <v-icon :color="pregunta.tipo_pregunta.tx_color">{{pregunta.tipo_pregunta.tx_icono}}</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title>{{ respuesta.nb_respuesta }}</v-list-item-title>
                                    </v-list-item-content>
                                    <v-list-item-icon>
                                        <v-icon :color="(respuesta.bo_correcta) ? 'success' : 'error' ">
                                            {{ (respuesta.bo_correcta) ? 'mdi-checkbox-marked-circle' : 'mdi-close-circle-outline' }}
                                        </v-icon>
                                    </v-list-item-icon>
                                </v-list-item>
                            </v-list> 

                            <v-alert type="info" v-if="pregunta.tipo_pregunta.nb_tipo_pregunta == 'Desarrollo'" prominent>
                                Las preguntas tipo desarrollo requiere de la revision y ponderacion manual por parte del docente 
                            </v-alert>
                        </v-card-text>
                    </v-card>
                </v-col>

            </v-row>

            </v-container>


        </v-card-text>

        <v-card-actions class="grey lighten-4">
         

        </v-card-actions>
    
      
    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],

    props:
    {
        prueba: {
            type:    Object,
            default: () => {}
        },

        tiempo: {
            type:    Number,
            default: 0
        }
    },

    created()
    {
       this.list()
    },

    computed:
    {
    
    },

    data() {
        return {
            preguntas:  [], 
        }
          
    },

    methods:
    {

        list()
        {
            this.getResource( `pregunta/prueba/${this.prueba.id}` ).then( data =>  this.preguntas = data )
        },
       
      
        colorPregunta(nuOrden)
        {
            return this.respondidas.includes(nuOrden) ? 'success' : 'orange'
        },

        responder()
        {
            if (!this.$refs.form.validate())  return 

            this.form.id_prueba        = this.prueba.id
            this.form.id_pregunta      = this.pregunta.id 
            this.form.id_alumno        = this.alumno.id
            this.form.id_usuario       = this.idUser 

            if(this.hasRespuesta)
            {
                this.updateRespuesta();
            }
            else{
                this.storeRespuesta();
            }
        },

        storeRespuesta()
        {
            this.storeResource(`respuestaAlumno`, this.form).then( data => {
                this.showMessage(data.msj)
                if(!this.respondidas.includes(this.pregunta.nu_orden)) 
                {
                    this.respondidas.push(this.pregunta.nu_orden)
                }
                this.preguntaPendiente();
            }) 
        },

        updateRespuesta()
        {
            this.updateResource(`respuestaAlumno/0`, this.form).then( data => {
                this.showMessage(data.msj)
                this.preguntaPendiente();
            }) 
        },

        closeConfirm(confirm, dialog, prueba)
        {           
            this[dialog]   = false;
            if(confirm)   this.finalizarPrueba(prueba)
        },

        finalizarPrueba()
        {
            let data = {id_usuario: this.idUser }
            this.validateForm = false
            this.updateResource(`pruebaAlumno/finalizar/${this.prueba.prueba_alumno[0].id}`, data).then( data => {
                this.showMessage(data.msj)
                this.$emit('closeModal', true);
            }) 
        },
    
    }
}
</script>

<style scoped>
.pregunta-stepper{
    width: 100% !important;
}
</style>