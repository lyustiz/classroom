<template>

    <v-card :loading="loading" flat height="90vh">

        <v-card-text>

            <v-row>
                <v-col>
                    <v-list-item  >
                        <v-list-item-avatar color="teal" size="60">
                            <v-icon color="white" size="46">mdi-order-bool-descending-variant</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-text="evaluacion.origen.nb_prueba"></v-list-item-title>
                            <v-list-item-subtitle >Tema: {{evaluacion.tema.nb_tema}} - {{evaluacion.materia.nb_materia}}</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                </v-col>
            </v-row>
                                     
            <v-row>

                <v-col cols="4">
                            
                    <v-subheader>Desde:</v-subheader>
                    <v-sheet
                        color="green"
                        class="rounded-lg pa-2 mx-auto"
                        elevation="1"
                        width="180"
                    >
                    <v-row no-gutters>
                        <v-col>
                            <h3 class="white--text text-center text-uppercase">
                                {{ (evaluacion.fe_fin) ? monthNameFromDate(evaluacion.fe_fin): '--' }} 
                                {{ (evaluacion.fe_fin) ? yearFromDate(evaluacion.fe_fin): '--' }}
                            </h3> 
                        </v-col>
                    </v-row>
                    <v-row no-gutters>
                        <v-col>
                            <div class="display-3 white--text text-center">
                                {{ (evaluacion.fe_fin) ? dayFromDate(evaluacion.fe_fin): '--' }} 
                            </div>
                        </v-col>
                    </v-row>
                    <v-row no-gutters>
                        <v-col>
                            <h3 class="white--text text-center">
                                {{ evaluacion.hh_fin }} 
                            </h3> 
                        </v-col>
                    </v-row>
                    </v-sheet>
                </v-col>

                <v-col cols="4">
                            
                    <v-subheader>Hasta:</v-subheader>
                    <v-sheet
                        color="deep-orange"
                        class="rounded-lg pa-2 mx-auto"
                        elevation="1"
                        width="180"
                    >
                    <v-row no-gutters>
                        <v-col>
                            <h3 class="white--text text-center text-uppercase">
                                {{ (evaluacion.fe_fin) ? monthNameFromDate(evaluacion.fe_fin): '--' }} 
                                {{ (evaluacion.fe_fin) ? yearFromDate(evaluacion.fe_fin): '--' }}
                            </h3> 
                        </v-col>
                    </v-row>
                    <v-row no-gutters>
                        <v-col>
                            <div class="display-3 white--text text-center">
                                {{ (evaluacion.fe_fin) ? dayFromDate(evaluacion.fe_fin): '--' }} 
                            </div>
                        </v-col>
                    </v-row>
                    <v-row no-gutters>
                        <v-col>
                            <h3 class="white--text text-center">
                                {{ evaluacion.hh_fin }} 
                            </h3> 
                        </v-col>
                    </v-row>
                    </v-sheet>
                </v-col>
            
                <v-col cols="4">
                    
                    <v-subheader>Tiempo Ejecucion</v-subheader>
                    <v-sheet
                        color="info"
                        class="rounded-lg pa-2 mx-auto"
                        elevation="1"
                        width="180"
                    >
                    <v-row no-gutters>
                        <v-col class="mb-2">
                            <h3 class="white--text text-center text-uppercase">minutos:</h3> 
                        </v-col>
                    </v-row>
                    <v-row no-gutters>
                        <v-col>
                            <div class="display-3 white--text text-center mb-3">
                                {{evaluacion.nu_minutos}}
                            </div>
                        </v-col>
                    </v-row>
                    </v-sheet>
                </v-col>
            
                <v-col cols="12"  class="text-center mt-12" @click="confirm=true">
                        <v-btn large color="success"><v-icon class="mr-2">mdi-flag-checkered</v-icon>Iniciar Prueba</v-btn>
                </v-col>

            </v-row>

            <app-confirm 
                :confirm="confirm" 
                titulo="Iniciar Cuestionario" 
                mensaje="Desea Inicia el Cuestionario?" 
                @closeConfirm="iniciarPrueba($event, 'dialogEjecutar', item)">
            </app-confirm>

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
        evaluacionAlumno: {
            type:    Object,
            default: () => {}
        },
    },

    created()
    {
        this.evaluacion = this.evaluacionAlumno.evaluacion
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
            evaluacion: null
        }
    },

    methods:
    {
        iniciarPrueba(confirmar)
        {
            this.confirm = false

            if(!confirmar) return

            let form = {'id_usuario': this.idUser }
            this.updateResource( `evaluacionAlumno/${this.evaluacionAlumno.id}/iniciarPrueba`, form ).then( data =>  {
                this.showMessage(data.msj)
                this.$emit('onIniciarPrueba', true)
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