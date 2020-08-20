<template>

    <v-card flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Calificar Alumnos" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>
        <v-row justify="center" no-gutters>
            
            <v-col cols="12" class="pt-3">
                <v-list subheader dense width="100%"> 

                    <v-list-item v-for="(alumno, idx) in alumnos" :key="idx" :value="alumno.id">
                        <v-list-item-avatar>
                            <v-icon color="indigo" size="36">mdi-school</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                            <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-action>
                            <span class="mr-1"></span>
                        </v-list-item-action>

                        <v-list-item-action>

                            <template v-if="evaluacion.id_evaluacion_metodo == 3">
                                <app-archivo color="red" icono="mdi-notebook" origen="evaluacion_alumno" :origenId="1" :tipoArchivo="1" :hasArchivo="0 > 0"></app-archivo>
                            </template>

                            <template v-else>
                                <list-simple-icon :icon="evaluacion.evaluacion_metodo.tx_icono" :color="evaluacion.evaluacion_metodo.tx_color" :label="evaluacion.evaluacion_metodo.nb_evaluacion_metodo" ></list-simple-icon>
                            </template>

                        </v-list-item-action> 

                        <v-list-item-action>

                            <v-chip outlined v-if="evaluacion.id_evaluacion_metodo == 1">Ver Modulo de pruebas</v-chip>

                            <v-edit-dialog
                                :return-value.sync="alumno.id"
                                persistent large
                                cancel-text="Cancelar"
                                save-text="Guardar"
                                @open="setDataForm(alumno)"
                                @save="updateData(alumno)"
                                @cancel="clearForm()"
                                v-else
                            >
                                <v-text-field
                                    :value="(alumno.evaluacion_alumno.length > 0) ? alumno.evaluacion_alumno[0].nu_calificacion : null"
                                    readonly                                    
                                    single-line
                                    hide-details
                                    dense
                                    filled
                                    type="number"
                                    class="field-evaluation"
                                ></v-text-field>

                                <template v-slot:input>
                                    
                                        <v-text-field
                                            v-model="form.nu_calificacion"
                                            :rules="[rules.minNum(0), rules.maxNum(100)]" 
                                            label="Calificacion"
                                            type="number"
                                            autofocus
                                        ></v-text-field>
                                        <v-text-field
                                            v-model="form.tx_observaciones"
                                            :rules="[rules.max(80)]"
                                            label="Observaciones"
                                            single-line
                                        ></v-text-field>
                                 
                                </template>
                            </v-edit-dialog>
                        </v-list-item-action>

                    </v-list-item>
                </v-list>
            </v-col>

        </v-row>
        </v-card-text>

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
            alumnos:         [],
            confirm:         false,
            confirmEvaluar:  false,
            form:
            {
                id_alumno:         null,
                id_evaluacion:     null,
                nu_calificacion:   null,
                tx_observaciones:  null
            }
        }
    },

    methods:
    {
        list()
        {
            let resource = `alumno/evaluacion/${this.evaluacion.id}/grupo/${this.evaluacion.plan_evaluacion.id_grupo}/materia/${this.evaluacion.plan_evaluacion.id_materia}`
            this.getResource( resource ).then( data =>  this.alumnos = data )
        },

        updateData(alumno)
        {
            if(this.form.nu_calificacion == null)  return

            if(alumno.evaluacion_alumno.length > 0)
            {
                this.updateEvaluacion(alumno.evaluacion_alumno[0].id)
            } else {
                this.storeEvaluacion()
            }
        },

        storeEvaluacion()
        {
            this.storeResource( `evaluacionAlumno`, this.form).then( data =>{
                this.showMessage(data.msj)
            }).finally( () =>{
                this.clearForm()
                this.list()
            });
        },

        updateEvaluacion(idEvaluacion)
        {
            this.updateResource( `evaluacionAlumno/${idEvaluacion}`, this.form).then( data =>{
                this.showMessage(data.msj)
            }).finally( () =>{
                this.clearForm()
                this.list()
            });
        },

        setDataForm(alumno)
        {
            if(alumno.evaluacion_alumno.length > 0)
            {
                this.form.nu_calificacion  = alumno.evaluacion_alumno[0].nu_calificacion
                this.form.tx_observaciones = alumno.evaluacion_alumno[0].tx_observaciones
            }
            this.form.id_alumno        = alumno.id
        },

        clearForm()
        {
            this.form.id_alumno        = null
            this.form.nu_calificacion  = null
            this.form.tx_observaciones = null
        },

    }
}
</script>

<style scoped>
.field-evaluation{
    width: 100px;
}
</style>