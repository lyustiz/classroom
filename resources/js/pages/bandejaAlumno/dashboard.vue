<template>

    <v-container fluid class="amber lighten-4 contend"> 

        <v-row>

            <v-col cols="12" md="8" >

                <v-row no-gutters >
                    <v-col cols="12" >
                        <app-agenda-alumno :events="eventEvaluations"></app-agenda-alumno>
                    </v-col>
               </v-row>
               
            </v-col>

            <v-col cols="12" md="4">

                <app-eventos :events="events"></app-eventos>

                <app-secciones></app-secciones>

            </v-col>

        </v-row>
            
    </v-container>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData from '@mixins/AppData';
import AppAgendaAlumno from './agenda/AppAgendaAlumno'
import AppAlumnoSections from './AppAlumnoSections'
import AppEventos from './eventos/AppEventos'

export default {

    mixins: [AppData],

    components: 
    { 
        'app-agenda-alumno': AppAgendaAlumno,
        'app-eventos': AppEventos,
        'app-secciones': AppAlumnoSections
    },

    created()
    {
        this.list()
    },

    data () 
	{
        return {
            events: [],
            evaluaciones: [],
            eventEvaluations: []
        }
    },

    methods: {
        
        list()
        {
            /* this.getResource( 'agenda' ).then( (data) => 
            { 
                this.events = data.data
            }) */

           /*  this.getResource( 'evaluacion/grupo/1' ).then( (data) => 
            { 
                this.evaluaciones = data
                this.getEventEvaluations()
            }) */
        },

        getEventEvaluations()
        {
           
            this.evaluaciones.map( (evaluacion) => {
                 
                let currentDate  = new Date(evaluacion.fe_evaluacion).toISOString().substr(0, 10)
                
                this.eventEvaluations.push(
                    {
                        id:             evaluacion.id,
                        name:           evaluacion.tipo_evaluacion.nb_tipo_evaluacion,
                        date:           currentDate,
                        start:          `${currentDate} 07:00`,
                        end:            `${currentDate} 07:30`,
                        startHour:      '08:00',    
                        endHour:        '09:00',   
                        color:          evaluacion.plan_evaluacion.materia.area_estudio.tx_color,
                        category:       evaluacion.plan_evaluacion.materia.nb_materia, 
                        categoryId:     98,    
                        type:           'evaluacion',
                        typeId:         98,
                        icon:           'mdi-notebook',
                        topic:          evaluacion.tx_tema,
                        description:    evaluacion.tx_observaciones,
                        status:         evaluacion.id_status,
                        weight:         evaluacion.nu_peso

                    } 
                )
            })
        }
    }
    
}
</script>

<style>
.contend{
    min-height: 92.8vh;
}
</style>
