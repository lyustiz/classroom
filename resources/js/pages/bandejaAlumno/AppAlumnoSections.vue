<template>
  <v-card flat  class="mb-4 rounded-xl elevation-5"> 

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
                        class="ml-1 mx-1">
                        <v-icon size="32" v-text="section.icon"></v-icon>
                    </v-btn>
                </template>
                <span v-text="section.label"></span>
            </v-tooltip>

               
                <v-tooltip top color="orange">
                    <template v-slot:activator="{ on }">
                    <v-btn  fab dark depressed v-on="on" color="orange" class="ml-1 mx-1" @click="navegateToName('biblioteca-alumno')">
                        <v-icon size="32">mdi-book-open-page-variant</v-icon>
                    </v-btn>
                    </template>
                    <span>Biblioteca</span>
                </v-tooltip>

                <v-tooltip top color="orange">
                    <template v-slot:activator="{ on }">
                    <v-btn  fab dark depressed v-on="on" color="red" class="ml-1 mx-1" @click="navegateToName('asignacion-alumno')">
                        <v-icon size="32">mdi-calendar-multiselect</v-icon>
                    </v-btn>
                    </template>
                    <span>Planificador</span>
                </v-tooltip>


        </v-card-text>
    
        <v-dialog v-model="dialog" content-class="rounded-xl" scrollable :max-width="sectionWidth"> 
            <component v-if="dialog" :alumno="alumno" :is="component" inDialog @closeModal="closeSection('dialog', $event)"></component>
        </v-dialog> 

    </v-card>

</template>

<script>

import TareaAlumno         from './tarea/AppTarea'
import RecursoAlumno       from './recurso/Apprecurso'
import HorarioAlumno       from '@pages/bandejaAlumno/horario/HorarioAlumno'
import EvaluacionAlumno    from './evaluacion/AppEvaluacionAlumno'
import PruebaAlumno        from './prueba/PruebaAlumno'
import CalificacionAlumno  from './calificacion/AppCalificacion'
import ClaseAlumno         from './clase/AppClase'
import BibliotecaAlumno    from './biblioteca/AppBiblioteca'
export default {

    components: {
        'tarea-alumno':        TareaAlumno,
        'horario-alumno':      HorarioAlumno,
        'recurso-alumno':      RecursoAlumno,
        'evaluacion-alumno':   EvaluacionAlumno,
        'prueba-alumno':       PruebaAlumno,
        'calificacion-alumno': CalificacionAlumno,
        'biblioteca-alumno':   BibliotecaAlumno,
        'clase-alumno':        ClaseAlumno,
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
            
             /*    { label: 'Recursos', icon: 'mdi-book-open-page-variant', component: 'recurso-alumno', color: 'purple', sectionWidth: '700' }, */
                { label: 'Horario', icon: 'mdi-calendar-clock', component: 'horario-alumno', color: 'green', width: '90vw' },
         /*        { label: 'Evaluaciones', icon: 'mdi-notebook', component: 'evaluacion-alumno', color: 'indigo', sectionWidth: '95vw' },    */
              /*   { label: 'Pruebas', icon: 'mdi-order-bool-descending-variant', component: 'prueba-alumno', color: 'red', sectionWidth: '85vw' },         */  
               /*  { label: 'Calificaciones', icon: 'mdi-clipboard-list', component: 'calificacion-alumno', color: 'amber', sectionWidth: '700' }, */
                /* { label: 'Biblioteca', icon: 'mdi-library', component: 'biblioteca-alumno', color: 'red', sectionWidth: '98vw' },
                  { label: 'Tareas', icon: 'mdi-notebook', component: 'tarea-alumno', color: 'blue', sectionWidth: '700' }, */
                /*  { label: 'Aula Virtual (En Construccion)', icon: 'mdi-google-classroom', component: 'clase-alumno', color: 'green', sectionWidth: '700' }, */
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
        },

        closeSection(dialog, action)
        {
            this.dialog = false
            
            if(action.goTo)
            {
                let section = this.sections.find( (sect) => sect.component == action.goTo)

                this.showSection(section)
            }
        }
    }
}
</script>

<style>

</style>