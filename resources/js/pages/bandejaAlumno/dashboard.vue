<template>
    <!-- Contenido -->
    <v-container fluid>

        <v-row>

            <v-col cols="8" >

                <v-row no-gutters >
                    <v-col cols="12" >
                        <app-agenda-alumno :events="events"></app-agenda-alumno>
                    </v-col>
               </v-row>
               
            </v-col>

            <v-col cols="4">

                <app-eventos :events="events"></app-eventos>

                <v-card class="mt-3 rounded-xl">

                    <v-toolbar color="indigo" flat dark>
                        Secciones
                    </v-toolbar>
     
                    <v-card-text>

                        <v-tooltip top v-for="section in sections" :key="section.name" color="info">
                            <template v-slot:activator="{ on }">
                                <v-btn v-on="on" fab dark depressed :color="section.color" @click="showSection(section.component)" class="ml-1">
                                    <v-icon size="32" v-text="section.icon"></v-icon>
                                </v-btn>
                            </template>
                            <span v-text="section.label"></span>
                        </v-tooltip>

                    </v-card-text>
    
                </v-card>

            </v-col>
        </v-row>
            
    </v-container>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData from '@mixins/AppData';
import AppAgendaAlumno from './AppAgendaAlumno'
import AppEventos from './AppEventos'


export default {

    mixins: [AppData],

    components: 
    { 
        'app-agenda-alumno': AppAgendaAlumno,
        'app-eventos': AppEventos
    },

    created()
    {
        this.list()
    },

    computed: 
    { 
    
    },

    data () 
	{
        return {
            events: [],
            sections: [
                { label: 'Tareas', icon: 'mdi-notebook', component: 'tareas-alumno', color: 'red' },
                { label: 'Recursos', icon: 'mdi-book-open-page-variant', component: 'recursos-alumno', color: 'purple' },
                { label: 'Evaluaciones', icon: 'mdi-order-bool-descending-variant', component: 'evaluacion-alumno', color: 'blue' },
                { label: 'Materias', icon: 'mdi-bookshelf', component: 'materias-alumno', color: 'amber' },
                { label: 'Aula Virtual', icon: 'mdi-google-classroom', component: 'materias-alumno', color: 'green' },
            ]
        }
    },

    methods: {
        
        list()
        {
            this.getResource( 'agenda' ).then( (data) => 
            { 
                this.events = data.data
            })
            
        },
        
        intervalFormat(interval) 
        {
            return interval.time
        },

        showSection(conponent)
        {
            this.dialog = true
        }
    }
    
}
</script>

<style>

</style>
