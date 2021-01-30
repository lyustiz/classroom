<template>

    <v-card class="rounded-xl pb-2" >

        <v-toolbar color="pink" dense dark flat>
            <v-row>
                <v-col cols="auto">
                    <v-icon size="30">mdi-human-male-height-variant</v-icon>
                </v-col>
                <v-col class="headline text-left">Rasgos</v-col>
                <v-spacer></v-spacer>
                <v-col cols="auto" class="title">
                   {{ totalSeguimientos() }}
                </v-col>
            </v-row>
        </v-toolbar>

        <v-card-text class="seguimiento-container pt-0 px-1">
            <v-list dense>
                <v-list-item color="amber" v-for="(seguimiento, idx) in evaluacionesAlumno" :key="idx">
                    <v-list-item-avatar color="white" size="35" >
                        <v-icon 
                            :color="seguimiento.evaluacion.origen.tx_color" 
                            v-text="seguimiento.evaluacion.origen.tx_icono">
                        </v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title> 
                            {{seguimiento.evaluacion.origen.nb_rasgo}}
                        </v-list-item-title> 
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-edit-dialog
                            persistent large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                            @open="preUpdate(seguimiento.evaluacion_alumno)"
                            @save="updateCalificacion(seguimiento.evaluacion_alumno, idx)"
                        >
                            <v-chip label outlined link class="percent-field">
                                {{((seguimiento.evaluacion_alumno.nu_calificacion) ? seguimiento.evaluacion_alumno.nu_calificacion: 0 ) | formatNumber}}
                                Pts
                            </v-chip>
                        
                            <template v-slot:input>
                                <v-text-field
                                    v-model="seguimiento.evaluacion_alumno.nu_calificacion"
                                    label="Calificacion"
                                    :rules="[rules.required,  rules.maxNum(5), rules.minNum(1)]"
                                    type="number"
                                    class="mt-3 mb-n2"
                                    dense
                                    outlined
                                    autofocus
                                ></v-text-field>
                            </template>
                        </v-edit-dialog>
                        </v-list-item-action>
                        <v-list-item-action>
                        <v-edit-dialog
                            persistent large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                            @save="updateObservacion(seguimiento.evaluacion_alumno, idx)"
                        >

                            <list-simple-icon 
                                :size="28" class="mx-2"
                                :label="(seguimiento.evaluacion_alumno.tx_observaciones) ? seguimiento.evaluacion_alumno.tx_observaciones : '-'" 
                                :icon="(seguimiento.evaluacion_alumno.tx_observaciones) ? 'mdi-card-text' : 'mdi-card-text-outline'" color="indigo">
                            </list-simple-icon>
                        
                            <template v-slot:input>
          
                                <v-textarea
                                    v-model="seguimiento.evaluacion_alumno.tx_observaciones"
                                    label="Observaciones"
                                    :rules="[rules.max(200)]"
                                    class="mt-3 mb-n2"
                                    dense
                                    outlined
                                    autofocus
                                    counter
                                    rows="2"
                                ></v-textarea>
                            </template>
                        </v-edit-dialog>
                    </v-list-item-action>
                    </v-list-item>
                </v-list>

        </v-card-text>

    </v-card>
         
</template>

<script>
import DataHelper  from '@mixins/AppData';
import EvaluarPrueba  from '@pages/prueba/AppEvaluarPrueba';
import EvaluarTarea  from '@pages/tarea/AppEvaluarTarea';

export default {

    mixins:     [ DataHelper ],

    components:
    {
        EvaluarPrueba,
        EvaluarTarea
    },

    props: 
    {
        seguimientos:{
            type: [ Array ],
            default: () => null
        },
    },

    watch:
    {
        seguimientos()
        {
            this.evaluacionesAlumno = this.seguimientos
        }
    },

    created()
    {
        this.evaluacionesAlumno = this.seguimientos
    },

    data() {
        return {
            data:  [],
            addRasgo: false,
            rasgo:    null,
            evaluacionesAlumno: null,
            nuCalificacion:     null,
            form:{
                id:               null,
                nu_calificacion:  null,    
                tx_observaciones: null,     
                id_usuario:       null,
            },
            default: {
                id_status: 1
            },
        }
    },

    methods:
    {

        addItem(rasgo)
        {
            this.rasgo    = rasgo
            this.addRasgo = true
        },

        cancel()
        {
            this.rasgo    = null
            this.addRasgo = false
        },
       
        totalSeguimientos()
        {
            let completados = 0
            for (const seg of this.evaluacionesAlumno) {
                if(seg.evaluacion_alumno.nu_calificacion > 0)
                {
                    completados++
                }
            }
            
            return  `${completados} / ${this.evaluacionesAlumno.length}`
        },

        preUpdate(evaluacionAlumno)
        {
            this.nuCalificacion = evaluacionAlumno.nu_calificacion
        },

        updateCalificacion(evaluacionAlumno, idx)
        {
            if(evaluacionAlumno.nu_calificacion > 5 ||  evaluacionAlumno.nu_calificacion < 1)
            {
                this.showError('Calificacion debe estar entre 1 y 5')
                this.evaluacionesAlumno[idx].evaluacion_alumno.nu_calificacion = this.nuCalificacion
                return
            }
            this.updateEvaluacion(evaluacionAlumno)
        },

        updateObservacion(evaluacionAlumno)
        {
           this.updateEvaluacion(evaluacionAlumno)
        },

        updateEvaluacion(evaluacionAlumno)
        {
            this.form.nu_calificacion  =  evaluacionAlumno.nu_calificacion,    
            this.form.tx_observaciones =  evaluacionAlumno.tx_observaciones

            this.updateResource(`evaluacionAlumno/${evaluacionAlumno.id}`, this.form).then( data => {
                this.showMessage(data.msj)
                this.$emit('updateData', true)
            })
        }

  /*
        evaluar(evaluacion)
        {
            this.evaluacion = evaluacion
            
            if(evaluacion.evaluacion.tx_origen == 'prueba')
            {
                this.dialogPrueba = true
            } 

            if(evaluacion.evaluacion.tx_origen == 'tarea')
            {
                this.dialogTarea = true
            } 
        },

        closeDialog(dialog,  refresh)
        {
            this[dialog] = false
            if(refresh)
            {
                this.$emit('onUpdateData')
            }
            
        }*/
    } 
}
</script>

<style>
.seguimiento-alumno-container
{
    min-height: 80vh;
}
.seguimiento-container{
    height: 180px;
    overflow-y: auto;
}

</style>