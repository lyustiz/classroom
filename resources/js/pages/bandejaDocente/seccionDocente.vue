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
                        @click="showSection(section.component, section.label)" 
                        class="ml-1">
                        <v-icon size="32" v-text="section.icon"></v-icon>
                    </v-btn>
                </template>
                <span v-text="section.label"></span>
            </v-tooltip>

        </v-card-text>
    
       <v-dialog v-model="dialog" max-width="700" content-class="rounded-xl"> 
            
            <v-toolbar color="indigo" dark flat>
                <v-toolbar-title v-text="sectionTitle"></v-toolbar-title>
                <v-spacer></v-spacer>
                 <v-btn icon x-small @click="dialog=false" class="mr-2">    
                     <v-icon>mdi-close-circle</v-icon>
                </v-btn>
            </v-toolbar>

            <component :is="component" inDialog></component>
            
        </v-dialog> 

    </v-card>

</template>

<script>

import ListaAumno        from './alumno/listaAlumnos'
import EvaluacionDocente from './evaluacion/evaluacionDocente'
/* import RecursoAlumno    from './recurso/Apprecurso'

import MateriaAlumno    from './materia/AppMateria'
import ClaseAlumno      from './clase/AppCLase' */
import ClaseAlumno      from '@pages/bandejaAlumno/clase/AppCLase'
export default {

    components: {
        'lista-alumno':       ListaAumno,
        'evaluacion-docente': EvaluacionDocente,

      /*   'tarea-alumno':      TareaAlumno,
        'recurso-alumno':    RecursoAlumno,
        
        'materia-alumno':    MateriaAlumno,*/
        'clase-alumno':      ClaseAlumno, 
    },

    data()
    {
        return {
            component:    null,
            sectionTitle: null,
            dialog:       false,
            sections: [

                    { label: 'Alumnos', icon: 'mdi-school', component: 'lista-alumno', color: 'red' },
                    { label: 'Evaluaciones', icon: 'mdi-notebook', component: 'evaluacion-docente', color: 'amber' },
                  /*   { label: 'Recursos', icon: 'mdi-bookshelf', component: 'recurso-alumno', color: 'purple' }, */
                    { label: 'Aula Virtual (En Construccion)', icon: 'mdi-google-classroom', component: 'clase-alumno', color: 'green' },
                ]
        }
    },

    methods:
    {
        showSection(component, label)
        {
            this.dialog       = true
            this.component    = component
            this.sectionTitle = label
        }
    }
}
</script>

<style>

</style>