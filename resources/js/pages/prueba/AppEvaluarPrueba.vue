<template>

    <v-card flat height="90vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Evaluar Prueba" @closeModal="$emit('closeDialog', false)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="pa-0">
            <v-toolbar color="grey lighten-4" dense class="elevation-0">
                <v-row no-gutters justify="space-between">
                    <v-col cols="auto">Alumno: {{(alumno) ? alumno.nb_corto : null}}</v-col>
                    <v-col cols="auto">Total: {{ totalPrueba }}</v-col>
                </v-row>
            </v-toolbar>
        </v-card-title>

        <v-card-text>
        <v-form ref="form" v-model="valid" lazy-validation>   
        <v-row justify="center" no-gutters>
            <v-col>
                <v-col>
                   <v-list three-line dense width="100%"> 
                        <v-list-item v-for="(pregunta, idx) in preguntas" :key="idx" :value="pregunta.id" >
                            <v-list-item-avatar size="40" color="indigo lighten-5">
                                <v-icon color="indigo lighten-1" size="36">mdi-help-circle</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title >
                                    <v-row no-gutters>
                                        <v-col cols="11">{{pregunta.nb_pregunta}} ({{pregunta.nu_valor}} Pts.)</v-col>
                                        <v-col cols="1">
                                            <list-simple-icon 
                                                :icon="pregunta.tipo_pregunta.tx_icono"
                                                :label="pregunta.tipo_pregunta.nb_tipo_pregunta"
                                                :color="pregunta.tipo_pregunta.tx_color"
                                            ></list-simple-icon> 
                                        </v-col>
                                    </v-row>
                                </v-list-item-title>

                                <v-list-item-subtitle v-for="(respuesta, idx) in pregunta.respuesta_alumno" :key="idx" :value="respuesta.id">
                                    <v-row no-gutters>
                                    <template v-if="pregunta.id_tipo_pregunta == 1">
                                        <p class="col-12">
                                            <v-icon color="info"> mdi-alpha-r-circle-outline </v-icon> 
                                            {{respuesta.tx_respuesta}}
                                        </p>
                                    </template>

                                    <template v-else>
                                        <v-col cols="1">
                                            <list-simple-icon 
                                                :icon="(respuesta.bo_correcta) ? 'mdi-check-circle' : 'mdi-close-circle'"
                                                :label="(respuesta.bo_correcta) ? 'Respuesta Correcta' : 'Respuesta Incorrecta'" 
                                                :color="(respuesta.bo_correcta) ? 'green' : 'red'">
                                            </list-simple-icon> 
                                        </v-col>
                                        <v-col class="py-1">
                                            {{respuesta.respuesta.nb_respuesta}} 
                                        </v-col>
                                    </template>
                                    </v-row>
                                </v-list-item-subtitle>
                               
                            </v-list-item-content>
                            <v-list-item-action class="col-2 pa-0">

                                <template v-if="pregunta.id_tipo_pregunta == 1">
                                    <v-text-field
                                        label="Calificacion"
                                        type="number"
                                        outlined
                                        dense
                                        hint="indique calificacion"
                                        persistent-hint
                                        :rules="[rules.required, rules.minNum(0), rules.maxNum(pregunta.nu_valor)]"
                                        :value="pregunta.respuesta_alumno[0].nu_valor"
                                        :ref="`respuesta_${pregunta.respuesta_alumno[0].id}`"
                                    ></v-text-field>
                                </template>

                                <template v-else>
                                   <v-col class="subtitle-1">
                                       {{ getCalificacion(pregunta.respuesta_alumno) }} Pts.
                                   </v-col>
                                </template>
                               
                            </v-list-item-action>
                        </v-list-item>
                    </v-list>
                </v-col>
            </v-col>
        </v-row>
        </v-form>
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-edit-dialog
                >
                <v-btn color="success" small>Observaciones</v-btn>
                <template v-slot:input>
                    <v-textarea
                    v-model="form.tx_observaciones"
                    :rules="[rules.max(200)]"
                    label="Indicar Observaciones"
                    filled
                    rows="2"
                    class="mt-1"
                    counter
                    ></v-textarea>
                </template>
            </v-edit-dialog>
            <v-spacer></v-spacer>
            <v-btn fab depressed x-small color="error" @click="$emit('closeDialog', false)">
               <v-icon>mdi-reply</v-icon>
            </v-btn>
            <v-btn fab depressed small color="success" :disabled="!valid" :loading="loading" @click="confirm=true">
                <v-icon>save_alt</v-icon>
            </v-btn>
        </v-card-actions>

        <app-confirm 
            :confirm="confirm" 
            titulo="Cuestionario" 
            mensaje="Desea Finalizar la calificacion del Cuestionario?" 
            @closeConfirm="evaluar($event)">
        </app-confirm>

        <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

        <pre v-if="$App.debug">{{ $refs }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins:     [ AppData ],

    props: 
    {
        evaluacion: {
            type: Object,
            default: () =>{}
        },

    },

    created()
    {       
        console.log(this.evaluacionAlumno)
        this.evaluacionAlumno = this.evaluacion.evaluacion_alumno;
        this.alumno = this.evaluacionAlumno.alumno
        this.prueba = this.evaluacion.evaluacion.origen
        this.form.id_prueba = this.prueba.id
        this.form.tx_observaciones = this.evaluacionAlumno.tx_observaciones
        this.list()
    },

    data() {
        return {
            evaluacionAlumno: null,
            confirm: false,
            prueba: null,
            alumno: null,
            preguntas:   [],
            form: {
                respuestas:  [],
                id_prueba:   null,
                id_usuario:  null,
                tx_observaciones: null
            },
            totalPrueba: 0,
        }
    },

    methods:
    {
        list()
        {
           
           
           this.getResource( `pregunta/prueba/${this.prueba.id}/alumno/${this.alumno.id}/evaluacion`).then( data => 
            {
                this.preguntas = data
                this.getTotalCalificacion(data)
            })
        },

        getCalificacion(respuestas)
        {
            let total = 0;
            for (const respuesta of respuestas) {
                total += respuesta.nu_valor 
            }
            return total;
        },

        getTotalCalificacion(preguntas)
        {
            this.totalPrueba = 0
            for (const pregunta of preguntas) {

                for (const respuesta of pregunta.respuesta_alumno) {
                    this.totalPrueba += respuesta.nu_valor
                }
            }
        },

        evaluar(confirm)
        {
            this.confirm = false
            if(!confirm) return
            this.getEvaluaciones()
            this.form.id_usuario = this.idUser
            this.updateResource(`evaluacionAlumno/${this.evaluacionAlumno.id}/evaluar`, this.form ).then( data =>  {
                this.showMessage(data.msj)
                this.$emit('closeDialog', true)
            })
        },

        getEvaluaciones()
        {
            this.form.respuestas = [];
            for (const element in this.$refs) {

                if(element.includes('respuesta_'))
                {
                    let idRespuesta = element.split('_')[1]
                    let value       = this.$refs[element][0].internalValue

                    this.form.respuestas.push({ id: idRespuesta, value: value  });
                }
            }
        }

    }
}
</script>

<style>
</style>