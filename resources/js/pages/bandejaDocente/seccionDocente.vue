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

                <v-tooltip top color="orange">
                    <template v-slot:activator="{ on }">
                    <v-btn fab dark depressed v-on="on" color="orange" class="ml-1 mt-1 " @click="navegateToName('gestion-tema')">
                        <v-icon size="32">mdi-inbox-multiple</v-icon>
                    </v-btn>
                    </template>
                    <span>Gestion de Contenidos</span>
                </v-tooltip>

                <v-tooltip top color="red">
                    <template v-slot:activator="{ on }">
                    <v-btn fab dark depressed v-on="on" color="red" class="ml-1 mt-1" @click="navegateToName('planificador-docente')">
                        <v-icon size="32">mdi-calendar-multiselect</v-icon>
                    </v-btn>
                    </template>
                    <span>Planificador</span>
                </v-tooltip>

                <v-tooltip top color="green">
                    <template v-slot:activator="{ on }">
                    <v-btn fab dark depressed v-on="on" color="green" class="ml-1 mt-1" @click="navegateToName('seguimiento-actividades')">
                        <v-icon size="32">mdi-calendar-search</v-icon>
                    </v-btn>
                    </template>
                    <span>Seguimiento</span>
                </v-tooltip>

                <v-tooltip top color="cyan">
                    <template v-slot:activator="{ on }">
                    <v-btn fab dark depressed v-on="on" color="cyan" class="ml-1 mt-1" @click="navegateToName('clase-docente')">
                        <v-icon size="32">mdi-google-classroom</v-icon>
                    </v-btn>
                    </template>
                    <span>Clase</span>
                </v-tooltip>

                <v-tooltip top color="amber">
                    <template v-slot:activator="{ on }">
                    <v-btn fab dark depressed v-on="on" color="amber" class="ml-1 mt-1" @click="navegateToName('meet-docente')">
                        <v-icon size="32">mdi-video-plus</v-icon>
                    </v-btn>
                    </template>
                    <span>Aula Virtual</span>
                </v-tooltip>


            
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
import AppAsignar        from './asignacion/AppAsignar'
import GestionTemas      from './tema/GestionTema'

export default {

    components: {
        'lista-alumno':       ListaAumno,
        'plan-evaluacion':    PlanEvaluacion,
        'evaluacion-docente': EvaluacionDocente,
        'clase-alumno':       ClaseAlumno, 
        'app-asignar':        AppAsignar, 
        'gestion-tema':       GestionTemas, 
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
                    { label: 'Plan Evaluacion', icon: 'mdi-table-clock', component: 'plan-evaluacion', color: 'indigo', sectionWidth: '700' },
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