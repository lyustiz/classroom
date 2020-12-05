<template>

    <v-card flat height="90vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Revision Tarea" dense @closeModal="$emit('closeDialog', false)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="pa-0">
            <v-toolbar color="grey lighten-4" dense class="elevation-0">
                    <v-row no-gutters justify="space-between">
                        <v-col cols="auto">Alumno: {{(alumno) ? alumno.nb_corto : null}}</v-col>
                        <v-col cols="auto">Puntuacion: {{form.nu_calificacion}} / {{ tarea.nu_peso }}</v-col>
                    </v-row>
                </v-toolbar>
        </v-card-title>

        <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>   

            <v-row v-if="tarea" justify="center" dense class="mt-4" no-gutters>
                <v-col cols="10" class="mb-4">
                    <v-list-item class=" rounded-lg elevation-3" >
                        <v-list-item-avatar color="deep-purple" size="60">
                            <v-icon color="white" size="46">mdi-notebook</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-text="tarea.nb_tarea"></v-list-item-title>
                            <v-list-item-subtitle >Materia: {{materia.nb_materia}}</v-list-item-subtitle>
                             <v-list-item-subtitle >Tema: {{tema.nb_tema}}</v-list-item-subtitle>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-row no-gutters>

                                <v-tooltip bottom color="green">
                                    <template v-slot:activator="{ on }">
                                        <v-avatar color="green" size="54" class="mx-1 white--text rounded-lg" v-on="on">
                                            <v-row no-gutters>
                                            <v-col cols="12">{{ monthShortNameFromDate(evaluacion.fe_inicio) }}</v-col>
                                            <v-col cols="12" class="body-1">{{ dayFromDate(evaluacion.fe_inicio) }}</v-col>
                                            </v-row>   
                                        </v-avatar>
                                    </template>
                                    <span>Valido Desde: {{evaluacion.fe_inicio | formatDate }}</span>
                                </v-tooltip>

                                <v-tooltip bottom color="amber">
                                    <template v-slot:activator="{ on }">
                                        <v-avatar color="amber" size="54" class="ml-1 mr-6 white--text rounded-lg" v-on="on">
                                            <v-row no-gutters>
                                            <v-col cols="12">{{ monthShortNameFromDate(evaluacion.fe_fin) }}</v-col>
                                            <v-col cols="12" class="body-1">{{ dayFromDate(evaluacion.fe_fin) }}</v-col>
                                            </v-row>   
                                        </v-avatar>
                                    </template>
                                    <span>Valido Hasta: {{evaluacion.fe_fin | formatDate }}</span>
                                </v-tooltip>
                            </v-row>
                        </v-list-item-action>
                       
                    </v-list-item>
                </v-col>

                <v-col cols="10" class="">
                    <v-alert :value="true" border="left" class="elevation-3 pt-2" colored-border color="indigo" >
                        <v-subheader class="my-0 indigo--text">Descripcion</v-subheader>
                        <p class="ml-4 my-0 py-0" v-text="tarea.tx_descripcion"></p>
                        <v-subheader class="my-0 indigo--text">Observaciones</v-subheader>
                        <p  class="ml-4 my-0 py-0"  v-text="tarea.tx_observaciones"></p>
                    </v-alert>
                </v-col>

                <v-col cols="10" class="grey lighten-4 rounded-lg">
                    <v-row >
                        <v-col cols="auto">
                            <v-row>
                            <v-col cols="12" class="text-center"> Tarea Alumno</v-col>
                            <v-col cols="12" class="text-center">
                                <list-simple-icon 
                                    v-if="archivo" 
                                    :label="archivo.nb_archivo" 
                                    :size="65" 
                                    icon="mdi-file-download" 
                                    @click="download()">
                                </list-simple-icon>
                            </v-col>
                            </v-row>
                        </v-col>
                        <v-col>
                            <v-row >
                            <v-col cols="12" > Observaciones</v-col>
                            <v-col cols="12">
                                <v-textarea
                                    :rules="[rules.required]"
                                    v-model="form.tx_observaciones"
                                    label="Observaciones"
                                    placeholder="Indique Observaciones de la tarea"
                                    dense
                                    solo
                                    rows="2"
                                ></v-textarea>  
                            </v-col>
                            </v-row>
                        </v-col>
                        <v-col cols="2">
                            <v-col cols="12 text-center"> Calificacion</v-col>
                            <v-col cols="12">
                                <v-text-field
                                    :rules="[rules.required, rules.maxNum(tarea.nu_peso)]"
                                    v-model="form.nu_calificacion"
                                    label="Peso"
                                    placeholder="0"
                                    type="number"
                                    solo
                                ></v-text-field>  
                            </v-col>
                        </v-col>
                    </v-row>
                  
                </v-col>

            </v-row> 
                
            </v-form>
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab depressed x-small color="error" @click="$emit('closeDialog', false)">
               <v-icon>mdi-reply</v-icon>
            </v-btn>
            <v-btn fab depressed small color="success" :disabled="!valid" :loading="loading" @click="evaluar()">
                <v-icon>save_alt</v-icon>
            </v-btn>
        </v-card-actions>

        <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

        <a ref="download" target="_blank" rel="noopener noreferrer" class="d-none"></a>

        <pre v-if="$App.debug">{{ $refs }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins:     [ AppData ],

    props: 
    {
        evaluacionAlumno: {
            type: Object,
            default: () =>{}
        },

    },

    created()
    {       
        this.evaluacion =  this.evaluacionAlumno.evaluacion
        this.alumno  =     this.evaluacionAlumno.alumno
        this.tarea   =     this.evaluacionAlumno.evaluacion.origen
        this.materia =     this.evaluacionAlumno.evaluacion.materia
        this.tema    =     this.evaluacionAlumno.evaluacion.tema
        this.item    =     this.evaluacionAlumno
        this.mapForm()
        console.log(this.evaluacionAlumno)
        this.list()
    },

    data() {
        return {
            evaluacion: null,
            tarea:      null,
            alumno:     null,
            materia:    null,
            tema:       null,
            archivo:    null,
            form: {
                id: 	          null,
				id_evaluacion: 	  null,
				id_alumno: 	      null,
				id_calificacion:  null,
				tx_observaciones: null,
				id_status: 	      null,
                id_usuario: 	  null,
                nu_calificacion:  0
            },
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `evaluacionAlumno/${this.evaluacionAlumno.id}/archivos`).then( data => 
            {
                this.archivo = data.archivo
            })
        },

        evaluar()
        {
            this.form.id_usuario = this.idUser
            
            this.updateResource(`evaluacionAlumno/${this.evaluacionAlumno.id}`, this.form ).then( data =>  {
                this.showMessage(data.msj)
                this.$emit('closeDialog', true)
            })
        },

         download()
        {            
            var href = this.archivo.full_url

            console.log(this.$refs['download'])

            this.$refs['download'].setAttribute('download', this.archivo.nb_real);

            this.$refs['download'].setAttribute('href', href);

            this.$refs['download'].click();

            this.showMessage(`Descargando archivo ...`)
        },

    }
}
</script>

<style>
</style>