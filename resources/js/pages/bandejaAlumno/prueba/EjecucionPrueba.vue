<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Ejecutar Pruebas" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="pa-0 grey lighten-4" v-if="pregunta">

            <v-col cols="8">
                <v-avatar color="grey lighten-3 mx-4" size="38">
                    <v-icon color="green">mdi-comment-question</v-icon>
                </v-avatar>
                <span class="subtitle-1" >{{ pregunta.nb_pregunta }}</span> 
            </v-col>

            <v-spacer></v-spacer>

             <v-col cols="auto">
                 Puntos: 
                <span class="subtitle-1">{{ pregunta.nu_valor  }}</span> 
            </v-col>

            <v-col cols="auto">
               <list-simple-icon icon="mdi-help" color="green" :label="(pregunta.tx_observaciones) ? pregunta.tx_observaciones: 'sin ayuda' "></list-simple-icon>
            </v-col>
                   
        </v-card-title>

        <v-card-text>

            <v-form ref="form" v-model="valid" lazy-validation v-if="pregunta">

            <v-row  justify="center">
                
                <v-subheader>{{pregunta.tipo_pregunta.nb_tipo_pregunta}} : {{pregunta.tipo_pregunta.tx_observaciones}}</v-subheader>

                <v-col cols="11" md="10" v-if="pregunta.id_tipo_pregunta == 1">
                    <v-textarea
                        :rules="[rules.desarrollo]"
                        v-model="form.tx_respuesta"
                        rows="8"
                        outlined
                        name="input-7-4"
                        label="Respuesta"
                        hint="Indique la respuesta"
                    ></v-textarea>
                </v-col>

                <v-col cols="10" v-if="pregunta.id_tipo_pregunta == 2">
                   <v-list subheader dense> 
                        <v-list-item-group :mandatory="(form.id_respuesta) ? form.id_respuesta.length > 0 : false " v-model="form.id_respuesta">
                        <v-list-item v-for="(respuesta, idx) in pregunta.respuesta" :key="idx" :value="respuesta.id"> 
                            <template v-slot:default="{ active }">
                                <v-list-item-avatar color="grey lighten-4">
                                    <span class="indigo--text">{{ idx+1 }}</span>
                                </v-list-item-avatar>
                                <v-list-item-content>
                                    <v-list-item-title v-text="respuesta.nb_respuesta"></v-list-item-title>
                                </v-list-item-content>
                                <v-list-item-action>
                                    <v-checkbox :input-value="active" :disabled="loading" ></v-checkbox>
                                </v-list-item-action>
                            </template>
                        </v-list-item>
                        </v-list-item-group>
                    </v-list>
                    <v-input :value="form.id_respuesta" :rules="[rules.option]"></v-input>
                </v-col>

                <v-col cols="10" v-if="pregunta.id_tipo_pregunta == 3">
                   <v-list subheader dense> 
                        <v-list-item-group  multiple v-model="form.id_respuesta">
                        <v-list-item v-for="(respuesta, idx) in pregunta.respuesta" :key="idx" :value="respuesta.id"> 
                            <template v-slot:default="{ active }" >
                                <v-list-item-avatar color="grey lighten-4">
                                    <span class="indigo--text">{{ idx+1 }}</span>
                                </v-list-item-avatar>
                                <v-list-item-content>
                                    <v-list-item-title v-text="respuesta.nb_respuesta"></v-list-item-title>
                                </v-list-item-content>
                                <v-list-item-action>
                                    <v-checkbox :input-value="active" :disabled="loading" ></v-checkbox>
                                </v-list-item-action>
                            </template>
                        </v-list-item>
                        </v-list-item-group>
                    </v-list>
                    <v-input :value="form.id_respuesta" :rules="[rules.multiple, rules.respuestas(pregunta.respuesta.length-1)]"></v-input>
                </v-col>

            </v-row>

            <v-row justify="center">
              
                <v-btn color="success" :loading="loading" @click="responder()">Responder</v-btn>
           
            </v-row>

            </v-form>

            <v-row justify="center" v-else >
                <v-col cols="11" md="10" v-if="!loading">
                    <v-alert type="warning" :value="true"  prominent outlined border="left" class="mt-3 text-justify">
                        ¿Todas las preguntas han sido respondidas?. Puede revisar nuevamente su respuestas dando click en los numeros de la barra inferior o presione el boton "Finalizar" para finalizar la prueba.
                    </v-alert>
                </v-col>

                <v-col cols="11" md="10" v-if="!loading" class="text-center" @click="confirm=true">
                    <v-btn large color="success"><v-icon class="mr-2">mdi-flag-checkered</v-icon>  Finalizar</v-btn>
                </v-col>

                <app-confirm 
                    :confirm="confirm" 
                    titulo="Finalizar Prueba" 
                    mensaje="Desea finalizar la Prueba?" 
                    @closeConfirm="closeConfirm($event, 'confirm', prueba)">
                </app-confirm>
            </v-row>

            <pre v-if="$App.debug">{{ $data }}</pre>
        </v-card-text>

        <v-card-actions class="grey lighten-4">
            <v-row no-gutters justify="space-between">
            <v-col cols="auto">
                <v-slide-group show-arrows   class="text-center"  >
                    <v-stepper  class="subtitle-2 pregunta-stepper elevation-0 rounded-xl" @change="showPregunta($event)" v-model="nroPregunta" >
                        <v-stepper-header>
                            <v-stepper-step v-for="(pregunta, idx) in prueba.pregunta" :key="idx" :step="pregunta.nu_orden" :color="colorPregunta(pregunta.nu_orden)" editable>
                            </v-stepper-step>
                            <v-stepper-step step="Fin" :rules="[() => true]" editable>
                            </v-stepper-step>
                        </v-stepper-header>
                    </v-stepper> 
                </v-slide-group>
            </v-col>

            <v-col cols="auto">
                <app-timer :width="8" :size="70" :minutes="0" :seconds="tiempo*60"></app-timer>
                <v-progress-circular width="8" :rotate="-90" color="red" :size="70" value="90" class="white rounded-circle">00:0{{tiempo}}</v-progress-circular>
            </v-col>
            </v-row>

        </v-card-actions>
    
        <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

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
        this.preguntaPendiente()
        this.setRespondidas()
    },

    computed()
    {
        isMandatory()
        {
            if(this.pregunta)
            {
               return  this.pregunta.id_tipo_pregunta == 3 && this.form.tx_respuesta
            }
            return false
        }
    },

    watch:
    {
        pregunta(pregunta)
        {           
            if(!pregunta) {
               this.nroPregunta = 'Fin'
               return
            }
            
            if(pregunta.respuesta_alumno.length > 0)
            {
                switch (pregunta.id_tipo_pregunta) {
                    case 1:
                        this.form.tx_respuesta = pregunta.respuesta_alumno[0].tx_respuesta 
                        this.form.id           = pregunta.respuesta_alumno[0].id 
                        break;
                    case 2:
                        this.form.id_respuesta = pregunta.respuesta_alumno[0].id_respuesta 
                        this.form.id           = pregunta.respuesta_alumno[0].id 
                        break;
                    case 3:
                        this.form.id = [];
                        this.form.id_respuesta = [];
                        for (const respuesta of pregunta.respuesta_alumno) {
                            this.nroRespuestas 
                            this.form.id_respuesta.push(respuesta.id_respuesta)
                            this.form.id.push(respuesta.id)
                        }
                        break;
                    default:
                        break;
                }
                this.hasRespuesta = true

            }else{
                this.form.id_respuesta = (pregunta.id_tipo_pregunta == 3) ?  [] : null
                this.form.tx_respuesta = null
                this.hasRespuesta      = false
            } 

            this.nroPregunta = pregunta.nu_orden
            
        }
    },

    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno'];
        },
    },

    data() {
        return {
            timer:  true, 
            pregunta:  null,
            respuesta: null,
            hasRespuesta: false,
            respondidas: [],
            confirm: false,
            nroPregunta: null,
            nroRespuestas: 0,
            form:
            {
                id: 	            null,
                id_prueba: 	        null,
                id_pregunta:        null,
                id_respuesta:       null,
                id_alumno:          null,
				tx_respuesta:       null,
				id_usuario:         null,
            },
            rules: {
                multiple:     v => v.length > 0 || 'Seleccione almenos una (1) respuesta',
                option:       v => !!v || 'Seleccione una (1) respuesta',
                desarrollo:   v => !!v || 'Describa su respuesta',
                respuestas:   cant => v => v.length <= cant || `Seleccione maximo ${cant} respuesta`
            }
        }
    },

    methods:
    {
       
        preguntaPendiente()
        {
           this.getResource( `pregunta/prueba/${this.prueba.id}/alumno/${this.alumno.id}/pendiente`).then( data =>  this.pregunta = data )
        },

        showPregunta(orden)
        {
           if(orden == 'Fin')
           {
               this.pregunta    = null
               this.nroPregunta = 'Fin'
               return
           }

           this.getResource( `pregunta/${orden}/prueba/${this.prueba.id}/alumno/${this.alumno.id}`).then( data =>  this.pregunta = data )
        },

        setRespondidas()
        {
            for (const pregunta of this.prueba.pregunta) {

                if(pregunta.respuesta_alumno.length > 0)
                {
                    this.respondidas.push(pregunta.nu_orden)
                }
            }
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