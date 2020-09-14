<template>

    <v-card flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Calificar Alumnos" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>
        <v-row justify="center" no-gutters>
            
            <v-col cols="12" class="pt-3">
                <v-list subheader dense width="100%"> 

                    <v-subheader>
                        <v-row  dense>
                            <v-col>Evaluacion: {{evaluacion.tipo_evaluacion.nb_tipo_evaluacion}}</v-col>
                            <v-col>Tema: {{evaluacion.tx_tema}}</v-col>
                            <v-col>Peso: {{evaluacion.nu_peso}}%</v-col>
                        </v-row>
                    </v-subheader>

                    <v-list-item v-for="(evaluacionAlumno, idx) in evaluacionAlumnos" :key="idx" :value="evaluacionAlumno.id">

                        <v-list-item-avatar>
                            <v-icon color="indigo" size="36">mdi-school</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                            <v-list-item-title v-text="evaluacionAlumno.alumno.nb_alumno"></v-list-item-title>
                            <v-list-item-subtitle v-text="evaluacionAlumno.alumno.tx_documento"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-action>
                            <span class="mr-1"></span>
                        </v-list-item-action>

                        <v-list-item-action>

                            <template v-if="evaluacion.id_evaluacion_metodo == 3">
                                <list-simple-icon :size="34" v-if="evaluacionAlumno.archivo" :label="`${evaluacionAlumno.archivo.nb_archivo} subido: ${evaluacionAlumno.archivo.fe_archivo }`" color="green" icon="mdi-file-download" depressed @click="download(evaluacionAlumno.archivo)"></list-simple-icon>
                                <list-simple-icon :size="34" v-else label="No se ha cargado el docuemnto" color="red" icon="mdi-file-cancel" depressed></list-simple-icon> 
                            </template>

                            <template v-else>
                                <list-simple-icon :icon="evaluacion.evaluacion_metodo.tx_icono" :color="evaluacion.evaluacion_metodo.tx_color" :label="evaluacion.evaluacion_metodo.nb_evaluacion_metodo" ></list-simple-icon>
                            </template>

                        </v-list-item-action> 

                        <v-list-item-action>

                            <template v-if="evaluacion.id_status == 11">
                                <v-tooltip bottom color="red">
                                    <template v-slot:activator="{ on }">
                                        <v-chip v-on="on" outlined class="field-evaluation body-2">
                                            {{evaluacionAlumno.calificacion.nu_calificacion }}
                                        </v-chip>
                                    </template>
                                    <span>Evaluacion Cerrada</span>
                                </v-tooltip>
                            </template>

                            <template v-else>  
                                    <template v-if="evaluacion.id_evaluacion_metodo == 1" >
                                        <v-tooltip bottom color="amber">
                                            <template v-slot:activator="{ on }">
                                                <v-chip v-on="on" outlined class="field-evaluation body-2">
                                                    {{(evaluacionAlumno.calificacion) ? evaluacionAlumno.calificacion.nu_calificacion : 'pendiente'}}
                                                </v-chip>
                                            </template>
                                            <span>Ir al Modulo de Pruebas</span>
                                        </v-tooltip>
                                    </template>
                                
                                    <v-edit-dialog
                                        :return-value.sync="evaluacionAlumno.id"
                                        persistent large
                                        cancel-text="Cancelar"
                                        save-text="Guardar"
                                        @open="setDataForm(evaluacionAlumno)"
                                        @save="updateEvaluacion(evaluacionAlumno)"
                                        @cancel="clearForm()"
                                        v-else
                                    >
                                        
                                        <v-tooltip bottom color="green">
                                            <template v-slot:activator="{ on }">
                                                <v-text-field
                                                    v-on="on"
                                                    :value="(evaluacionAlumno.calificacion) ? evaluacionAlumno.calificacion.nu_calificacion : '-'"
                                                    readonly                                    
                                                    single-line
                                                    hide-details
                                                    dense
                                                    filled
                                                    type="number"
                                                    class="field-evaluation body-2 text-center"
                                                    suffix='Pts'
                                                ></v-text-field>
                                            </template>

                                            <template v-if="evaluacionAlumno.calificacion">
                                                    Letra: {{ evaluacionAlumno.calificacion.nb_calificacion }} Ptos Acumulados: {{ evaluacionAlumno.nu_calificacion }}
                                            </template>
                                            <template v-else>
                                                <span>Sin Calificacion</span>
                                            </template>
                                        </v-tooltip>
                                        
                                        <template v-slot:input>
                                            
                                                <v-select
                                                    v-model="form.id_calificacion"
                                                    :items="calificaciones"
                                                    item-text="nu_calificacion"
                                                    item-value="id"
                                                    :rules="[rules.select]"
                                                    label="calificacion"
                                                    :loading="loading"
                                                    dense
                                                    full-width
                                                    autofocus
                                                ></v-select>

                                                <v-text-field
                                                    v-model="form.tx_observaciones"
                                                    :rules="[rules.max(80)]"
                                                    label="Observaciones"
                                                    single-line
                                                ></v-text-field>
                                        
                                        </template>
                                    </v-edit-dialog>
                            </template>
                        </v-list-item-action>

                    </v-list-item>
                </v-list>

                <a ref="download" target="_blank" rel="noopener noreferrer" class="d-none"></a>
            </v-col>

        </v-row>
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab depressed x-small color="error" @click="$emit('closeModal', true)" class="mr-1">
               <v-icon>mdi-reply</v-icon>
            </v-btn>

            <v-tooltip bottom color="amber">
                <template v-slot:activator="{ on }">
                    <v-btn v-on="on" fab depressed small color="success" :disabled="!valid" :loading="loading" @click="confirm = true" v-if="evaluacion.id_status != 11"> 
                        <v-icon>mdi-lock</v-icon>
                    </v-btn>
                    <v-btn v-on="on" fab depressed small color="error" :disabled="!valid" :loading="loading" v-else> 
                        <v-icon>mdi-lock-check</v-icon>
                    </v-btn>
                </template>
                <span>{{ (evaluacion.id_status == 11) ? 'Evaluacin Cerrada' : 'Cerrar Evaluacion' }}</span>
            </v-tooltip>
            
        </v-card-actions>

        <app-confirm 
            :confirm="confirm" 
            titulo="Cerrar Evaluacion" 
            mensaje="Desea Cerrar la Evaluacion?" 
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
import AppArchivo from '@pages/archivo/AppShowArchivo'

export default {

    mixins:     [ AppData ],

    components:
    {
        'app-archivo': AppArchivo
    },

    props: 
    {
        evaluacion: {
            type: Object,
            default: () =>{}
        },
    },

    created()
    {
        this.form.id_evaluacion = this.evaluacion.id
        this.list()
    },

    data() {
        return {
            evaluacionAlumnos: [],
            calificaciones: [],
            confirm:         false,
            confirmEvaluar:  false,
            form:
            {
                id_alumno:         null,
                id_evaluacion:     null,
                id_calificacion:   null,
                tx_observaciones:  null
            }
        }
    },

    methods:
    {
        list()
        {           
            let resource = `evaluacionAlumno/evaluacion/${this.evaluacion.id}`
            
            this.getResource( resource ).then( data =>  this.evaluacionAlumnos = data )

            this.getResource( `calificacion` ).then( data =>  this.calificaciones = data )
        },

        updateEvaluacion(evaluacionAlumno)
        {
            if(this.form.id_calificacion == null)  return

            this.updateResource( `evaluacionAlumno/${evaluacionAlumno.id}`, this.form).then( data =>{
                this.showMessage(data.msj)
            }).finally( () =>{
                this.clearForm()
                this.list()
            });
        },

        setDataForm(evaluacionAlumno)
        {
            this.form.id_calificacion  = evaluacionAlumno.id_calificacion
            this.form.tx_observaciones = evaluacionAlumno.tx_observaciones
            this.form.id_alumno        = evaluacionAlumno.alumno.id 
        },

        clearForm()
        {
            this.form.id_alumno        = null
            this.form.nu_calificacion  = null
            this.form.tx_observaciones = null
        },

        download(archivo)
        {            
            var href = archivo.tipo_archivo.tx_base_path + archivo.tx_path

            this.$refs['download'][0].setAttribute('download', archivo.nb_real);

            this.$refs['download'][0].setAttribute('href', href);

            this.$refs['download'][0].click();

            this.showMessage(`Descargando archivo ...`)
        },

        closeConfirm(confirm, dialog)
        {           
            this[dialog]   = false;
            if(confirm)   this.cerrarEvaluacion()
        },

        cerrarEvaluacion()
        {
            let data = {id_usuario: this.idUser}
            this.updateResource( `evaluacion/cerrar/${this.evaluacion.id}`, data).then( data =>{
                this.showMessage(data.msj)
                this.$emit('closeModal', true)
            })
        }
    }
}
</script>

<style scoped>
.field-evaluation{
    width: 90px;
}
</style>