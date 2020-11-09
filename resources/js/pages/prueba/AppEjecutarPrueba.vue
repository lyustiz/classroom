<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar color="teal" dense title="Ejecutar Cuestionario" @closeModal="$emit('closeDialog', true)"></app-simple-toolbar>
        </v-card-title>

      
        <v-card-text>



            <v-row>

                <v-col>

                     <v-list-item  >
                            <v-list-item-avatar color="teal" size="70">
                                <v-icon color="white" size="40">mdi-order-bool-descending-variant</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title v-text="evaluacion.evaluacion.origen.nb_prueba"></v-list-item-title>
                                <v-list-item-subtitle v-text="evaluacion.evaluacion.materia.nb_materia"></v-list-item-subtitle>
                                <v-list-item-subtitle v-text="evaluacion.evaluacion.tema.nb_tema"></v-list-item-subtitle>
                            </v-list-item-content>
                    </v-list-item>

                </v-col>
            </v-row>

            <v-row>



            <v-col cols="4">
                          
                <v-subheader>Desde:</v-subheader>
                <v-sheet
                    color="green"
                    class="rounded-lg pa-2 pointer mx-auto"
                    elevation="1"
                    width="180"
                    v-ripple
                >
                <v-row no-gutters>
                    <v-col>
                        <h3 class="white--text text-center text-uppercase">
                            {{ (evaluacion.evaluacion.fe_fin) ? monthNameFromDate(evaluacion.evaluacion.fe_fin): '--' }} 
                            {{ (evaluacion.evaluacion.fe_fin) ? yearFromDate(evaluacion.evaluacion.fe_fin): '--' }}
                        </h3> 
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <div class="display-3 white--text text-center">
                            {{ (evaluacion.evaluacion.fe_fin) ? dayFromDate(evaluacion.evaluacion.fe_fin): '--' }} 
                        </div>
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <h3 class="white--text text-center">
                            {{ evaluacion.evaluacion.hh_fin }} 
                        </h3> 
                    </v-col>
                </v-row>
                </v-sheet>


            </v-col>
            <v-col cols="4">
                          
                <v-subheader>Hasta:</v-subheader>
                <v-sheet
                    color="deep-orange"
                    class="rounded-lg pa-2 pointer mx-auto"
                    elevation="1"
                    width="180"
                    v-ripple
                >
                <v-row no-gutters>
                    <v-col>
                        <h3 class="white--text text-center text-uppercase">
                            {{ (evaluacion.evaluacion.fe_fin) ? monthNameFromDate(evaluacion.evaluacion.fe_fin): '--' }} 
                            {{ (evaluacion.evaluacion.fe_fin) ? yearFromDate(evaluacion.evaluacion.fe_fin): '--' }}
                        </h3> 
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <div class="display-3 white--text text-center">
                            {{ (evaluacion.evaluacion.fe_fin) ? dayFromDate(evaluacion.evaluacion.fe_fin): '--' }} 
                        </div>
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <h3 class="white--text text-center">
                            {{ evaluacion.evaluacion.hh_fin }} 
                        </h3> 
                    </v-col>
                </v-row>
                </v-sheet>
            </v-col>

            
            <v-col cols="4">
                
                <v-subheader>Tiempo Ejecucion</v-subheader>
                <v-sheet
                    color="info"
                    class="rounded-lg pa-2 pointer mx-auto"
                    elevation="1"
                    width="180"
                    v-ripple
                >
                <v-row no-gutters>
                    <v-col class="mb-2">
                        <h3 class="white--text text-center text-uppercase">minutos:</h3> 
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <div class="display-3 white--text text-center mb-3">
                            {{evaluacion.evaluacion.nu_minutos}}
                        </div>
                    </v-col>
                </v-row>
                </v-sheet>
            </v-col>
            

<!--             {{evaluacion}}
 -->
            <v-col cols="12"  class="text-center mt-12" @click="confirm=true">
                    <v-btn large color="success"><v-icon class="mr-2">mdi-flag-checkered</v-icon>Iniciar Prueba</v-btn>
            </v-col>

</v-row>
            <pre v-if="$App.debug">{{ $data }}</pre>
        </v-card-text>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],

    props:
    {
        evaluacion: {
            type:    Object,
            default: () => {}
        },
    },

    created()
    {
        /* this.preguntaPendiente()
        this.setRespondidas() */
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