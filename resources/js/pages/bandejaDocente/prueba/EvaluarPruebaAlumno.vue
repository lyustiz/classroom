<template>

    <v-card flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Alumnos asignados a la Prueba" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>
        <v-row justify="center" no-gutters>
            
            <v-col cols="12" class="pt-3">
                <v-list subheader dense width="100%"> 
                    <v-list-item-group v-model="alumnoSelected">
                    <v-list-item v-for="(alumno, idx) in alumnos" :key="idx" :value="alumno.id" @click="getRespuestasAlumno(alumno)">
                        <v-list-item-avatar>
                            <v-icon color="indigo" size="36">mdi-school</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                            <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-action v-if="alumno.prueba_alumno[0].calificacion">
                            <v-tooltip bottom color="green">
                                <template v-slot:activator="{ on }">
                                    <span v-on="on" class="mr-1 px-1 green rounded-xl white--text">{{alumno.prueba_alumno[0].calificacion.nu_calificacion}}</span>
                                </template>
                                <span>Letra {{alumno.prueba_alumno[0].calificacion.nb_calificacion}} Puntos Obtenidos {{alumno.prueba_alumno[0].nu_calificacion}}</span>
                            </v-tooltip>
                        </v-list-item-action>

                        <v-list-item-action>
                            <template v-if="alumno.prueba_alumno[0].id_status == 7">
                                <list-simple-icon color="success" icon="mdi-checkbox-marked-circle" label="evaluado"></list-simple-icon>
                            </template>
                            <template v-else>
                                <list-simple-icon color="amber" icon="mdi-alert-circle" label="Sin Evaluacion"></list-simple-icon>
                            </template>
                        </v-list-item-action>
                        <v-list-item-action>
                            <template v-if="hasEjecucion(alumno)">
                                <app-button label="ver respuestas" icon="mdi-book-search" :loading="loading"></app-button>
                            </template>
                            <template v-else>
                                <app-button 
                                    label="No ejecuto la prueba" 
                                    icon="mdi-book-remove" 
                                    color="red" 
                                    @click="confirmEvaluar = true"
                                    :loading="loading">
                                </app-button>
                                 <app-confirm 
                                    :confirm="confirmEvaluar" 
                                    titulo="Evaluar Prueba" 
                                    mensaje="El Alumno no ejecuto la prueba. Desea realizar la Evaluacion?" 
                                    @closeConfirm="closeConfirmEvaluar($event, 'confirmEvaluar', alumno)">
                                </app-confirm>
                            </template>
                        </v-list-item-action>
                    </v-list-item>
                    </v-list-item-group>
                </v-list>
            </v-col>

            <v-dialog v-model="dialogRespuesta" fullscreen scrollable>
                <evaluar-respuesta-alumno 
                    :prueba="prueba"
                    :alumno="alumno" 
                    v-if="dialogRespuesta" 
                    @closeModal="closeDialog($event,'dialogRespuesta')"
                ></evaluar-respuesta-alumno>
            </v-dialog>

        </v-row>
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab depressed x-small color="error" @click="$emit('closeModal')">
               <v-icon>mdi-reply</v-icon>
            </v-btn>
            <v-btn fab depressed small color="success" :disabled="!valid" :loading="loading" @click=" confirm = true ">
                <v-icon>mdi-lock</v-icon>
            </v-btn>
        </v-card-actions>

        <app-confirm 
            :confirm="confirm" 
            titulo="Cerrar Prueba" 
            mensaje="Desea Cerrar la Prueba?" 
            @closeConfirm="closeConfirm($event, 'confirm')">
        </app-confirm>

        <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';
import EvaluarRespuestaAlumno from './EvaluarRespuestaAlumno'

export default {

    mixins:     [ AppData ],

    components:
    {
        'evaluar-respuesta-alumno' : EvaluarRespuestaAlumno
    },

    props: 
    {
        prueba: {
            type: Object,
            default: () =>{}
        },
    },

    created()
    {
        this.list()
    },

    data() {
        return {
            alumnos:         [],
            alumno:          null,
            alumnoSelected:  null,
            dialogRespuesta: false,
            confirm:         false,
            confirmEvaluar:  false,
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `alumno/prueba/${this.prueba.id}`).then( data =>  this.alumnos = data )
        },

        hasEjecucion(alumno)
        {
           return alumno.prueba_alumno[0].id_status >= 5
        },

        getRespuestasAlumno(alumno)
        {
            if(!this.hasEjecucion(alumno)) return
            this.alumno = alumno
            this.dialogRespuesta = true
        },

        closeDialog(refresh, dialog)
        {
            this[dialog]   = false
            this.list()
        },

        closeConfirm(confirm, dialog)
        {           
            this[dialog]   = false;
            if(confirm)   this.cerrarPrueba()
        },

        closeConfirmEvaluar(confirm, dialog, alumno)
        {           
            this[dialog]   = false;
            if(confirm)   this.evaluarPruebaImcompleta(alumno)
        },

        evaluarPruebaImcompleta(alumno)
        {
            let data = {id_usuario: this.idUser}
            this.updateResource(`pruebaAlumno/evaluar/${alumno.prueba_alumno[0].id}`, data ).then( data =>  {
                this.showMessage(data.msj)
                this.list()
            })
        },

        cerrarPrueba()
        {
            let data = {id_usuario: this.idUser}
            this.updateResource( `prueba/cerrar/${this.prueba.id}`, data).then( data =>{
                this.showMessage(data.msj)
                this.$emit('closeModal')
            })
        }

    }
}
</script>

<style>
</style>