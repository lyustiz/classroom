<template>

    <v-card class="mt-3 rounded-xl">

        <v-toolbar color="indigo" flat dark>
            Secciones
        </v-toolbar>

        <v-card-text>

            <v-tooltip top v-for="section in sections" :key="section.name" color="info">
                <template v-slot:activator="{ on }">
                    <v-btn 
                        fab 
                        dark 
                        depressed 
                        v-on="on" 
                        :color="section.color" 
                        @click="showSection(section)" 
                        class="ml-1">
                        <v-icon size="32" v-text="section.icon"></v-icon>
                    </v-btn>
                </template>
                <span v-text="section.label"></span>
            </v-tooltip>

        </v-card-text>
    
        <v-dialog v-model="dialog" content-class="rounded-xl" scrollable :max-width="sectionWidth"> 
            <component :alumno="alumno" :is="component" inDialog @closeModal="dialog=false"></component>
        </v-dialog> 

    </v-card>

</template>

<script>

import TareaAlumno      from './tarea/AppTarea'
import RecursoAlumno    from './recurso/Apprecurso'
import EvaluacionAlumno from './evaluacion/AppEvaluacionAlumno'
import PruebaAlumno     from './prueba/PruebaAlumno'
import MateriaAlumno    from './materia/AppMateria'
import ClaseAlumno      from './clase/AppCLase'
export default {

    components: {
        'tarea-alumno':      TareaAlumno,
        'recurso-alumno':    RecursoAlumno,
        'evaluacion-alumno': EvaluacionAlumno,
        'prueba-alumno':     PruebaAlumno,
        'materia-alumno':    MateriaAlumno,
        'clase-alumno':      ClaseAlumno,
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
            component:    null,
            sectionTitle: null,
            sectionWidth: null,
            dialog:       false,
            sections: [
                { label: 'Tareas', icon: 'mdi-notebook', component: 'tarea-alumno', color: 'blue', sectionWidth: '700' },
                { label: 'Recursos', icon: 'mdi-book-open-page-variant', component: 'recurso-alumno', color: 'purple', sectionWidth: '700' },
                { label: 'Pruebas', icon: 'mdi-order-bool-descending-variant', component: 'prueba-alumno', color: 'red', sectionWidth: '85vw' },
                { label: 'Evaluaciones', icon: 'mdi-format-list-checks', component: 'evaluacion-alumno', color: 'indigo', sectionWidth: '700' },             
                { label: 'Calificaciones', icon: 'mdi-clipboard-list', component: 'materia-alumno', color: 'amber', sectionWidth: '700' },
                { label: 'Aula Virtual (En Construccion)', icon: 'mdi-google-classroom', component: 'clase-alumno', color: 'green', sectionWidth: '700' },
            ]
        }
    },

    methods:
    {
        showSection(section)
        {
            this.dialog       = true
            this.component    = section.component
            this.sectionTitle = section.label
            this.sectionWidth = section.sectionWidth
        }
    }
}
</script>

<style>

</style>