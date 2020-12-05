<template>

    <v-card height="100vh" flat>

        <v-card-title class="pa-0">
            <app-simple-toolbar background-color="teal" dense :title="evaluacionAlumno.evaluacion.origen.nb_prueba" @closeModal="$emit('closeDialog', true)"></app-simple-toolbar>
        </v-card-title>
        
        <component 
            :is="component" 
            v-if="prueba" 
            :evaluacionAlumno="evaluacionAlumno" 
            :prueba="prueba" 
            @onIniciarPrueba="iniciarPrueba($event)" 
            @onFinalizarPrueba="finalizarPrueba($event)" >
        </component>
        
        <v-overlay absolute :opacity="0.3" :value="loading">
            <v-icon size="50" class="mdi-spin" color="white">mdi-loading</v-icon>
        </v-overlay>
    </v-card>

</template>

<script>

import AppData from '@mixins/AppData';
import AppIniciarPrueba   from './AppIniciarPrueba'
import AppEjecutarPrueba  from './AppEjecutarPrueba'
import AppResultadoPrueba from './AppResultadoPrueba'

export default {

    mixins:     [ AppData ],

    components: {
        'iniciar-prueba':   AppIniciarPrueba,
        'ejecutar-prueba':  AppEjecutarPrueba,
        'resultado-prueba': AppResultadoPrueba,
    },

    props:
    {
        evaluacionAlumno: {
            type: Object,
            default: () => {}
        }
    },

    created()
    {
        this.getPruebaAlumno()
    },

    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno']
        }
    },

    data()
    {
        return {
            prueba:    null,
            component: null,
            dialog:    false,
        }
    },

    methods:
    {
        
        getPruebaAlumno()
        {
            this.getResource(`prueba/${this.evaluacionAlumno.evaluacion.id_origen}/evaluacion/${this.evaluacionAlumno.evaluacion.id}/evaluacionAlumno/${this.evaluacionAlumno.id}`).then((data) =>{
                this.prueba = data
                this.setComponent()
            })
        },
        
        iniciarPrueba(iniciar)
        {
            if(iniciar)
            {
                this.component = 'ejecutar-prueba'
            }
        },

        finalizarPrueba(finalizar)
        {
            if(finalizar)
            {
                this.component = 'resultado-prueba'
            }
        },
    
        setComponent()
        {            
            switch (true) {

                case this.prueba.evaluacion[0].evaluacion_alumno[0].id_status == 3:
                    this.component = 'iniciar-prueba'
                    break;

                case this.prueba.evaluacion[0].evaluacion_alumno[0].id_status == 4:
                    this.component = 'ejecutar-prueba'
                    break;

                case this.prueba.evaluacion[0].evaluacion_alumno[0].id_status > 4:
                    this.component = 'resultado-prueba'
                    break;
            
                default:
                    this.showError('Cuestionario no valido')
                    this.$emit('closeDialog', true)
                    break;
            }
        }
    }
}
</script>

<style>

</style>