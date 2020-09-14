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

            <meet-room :usuario="3"></meet-room>

        </v-card-text>

            <v-dialog v-model="dialog" content-class="rounded-xl" scrollable :max-width="sectionWidth"> 
                <component :is="component" v-if="dialog" @closeModal="dialog=false"></component>
            </v-dialog> 
            
    </v-card>

</template>

<script>
import ListaAumno        from './alumno/listaAlumnos'
import RecursoDocente    from './recurso/RecursoDocente' 
import PlanEvaluacion    from './evaluacion/PlanEvaluacion'
import EvaluacionDocente from './evaluacion/EvaluacionDocente'
import ClaseAlumno       from '@pages/bandejaAlumno/clase/AppClase'
import MenuPrueba        from './prueba/MenuPrueba.vue'

export default {

    components: {
        'lista-alumno':       ListaAumno,
        'recurso-docente':    RecursoDocente,
        'plan-evaluacion':    PlanEvaluacion,
        'evaluacion-docente': EvaluacionDocente,
        'menu-prueba':        MenuPrueba,
        'clase-alumno':       ClaseAlumno, 
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data()
    {
        return {
            component:     null,
            sectionTitle:  null,
            sectionWidth:  null,
            dialog:        false,
            sections: [

                    { label: 'Alumnos', icon: 'mdi-school', component: 'lista-alumno', color: 'blue', sectionWidth: '700' },
                    { label: 'Recursos', icon: 'mdi-book-open-page-variant', component: 'recurso-docente', color: 'purple', sectionWidth: '700' },
                    { label: 'Plan Evaluacion', icon: 'mdi-table-clock', component: 'plan-evaluacion', color: 'indigo', sectionWidth: '700' },
                    { label: 'Evaluaciones', icon: 'mdi-table-check', component: 'evaluacion-docente', color: 'amber', sectionWidth: '95vw' },
                    { label: 'Pruebas', icon: 'mdi-order-bool-descending-variant', component: 'menu-prueba', color: 'red', sectionWidth: '700' },
                ]
        }
    },

    methods:
    {
        showSection(section)
        {
            this.sectionWidth  = section.sectionWidth
            this.dialog        = true
            this.component     = section.component
            this.sectionTitle  = section.label
        }
    }
}
</script>

<style>

</style>