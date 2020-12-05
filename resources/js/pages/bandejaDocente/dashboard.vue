<template>

    <v-container fluid class="green lighten-4 contend"> 

        <v-row>

            <v-col cols="12" md="8" >

                <v-row no-gutters >
                    <v-col cols="12" >
                        <agenda-docente :events="evaluaciones"></agenda-docente>
                    </v-col>
               </v-row>
               
            </v-col>

            <v-col cols="12" md="4">

                <calendario-docente :events="events"></calendario-docente>

                <seccion-docente></seccion-docente>

            </v-col>

        </v-row>
            
    </v-container>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData           from '@mixins/AppData';
import AgendaDocente     from './agenda/AgendaDocente'
import CalendarioDocente from './calendario/CalendarioDocente'
import SeccionDocente    from './seccionDocente'

export default {

    mixins: [AppData],

    components: 
    { 
        'agenda-docente':     AgendaDocente,
        'calendario-docente': CalendarioDocente,
        'seccion-docente':    SeccionDocente
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data () 
	{
        return {
            events: [],
            items: [],
            evaluaciones: []
        }
    },

    methods: {
        
        list()
        {
            this.getResource( 'agenda' ).then( (data) => 
            { 
                this.events = data.data
            })

          /*   this.getResource( 'evaluacion/docente/' + this.docente.id ).then( (data) => 
            { 
                this.items = data
                
                this.getEvaluaciones()
            }) */
        },

        getEvaluaciones()
        {
           
            this.items.map( (evaluacion) => {
                 
                if(evaluacion.fe_evaluacion)
                {
                    let currentDate  = new Date(evaluacion.fe_evaluacion).toISOString().substr(0, 10)
                    
                    this.evaluaciones.push(
                    {
                            id:             evaluacion.id,
                            name:           evaluacion.tipo_evaluacion.nb_tipo_evaluacion,
                            date:           currentDate,
                            start:          `${currentDate} 07:00`,
                            end:            `${currentDate} 07:30`,
                            startHour:      '08:00',    
                            endHour:        '09:00',   
                            color:          evaluacion.plan_evaluacion.materia.area_estudio.tx_color,
                            category:       evaluacion.plan_evaluacion.grupo.nb_grupo, 
                            categoryId:     98,    
                            type:           'evaluacion',
                            typeId:         98,
                            icon:           'mdi-notebook',
                            topic:          evaluacion.tx_tema,
                            description:    evaluacion.tx_observaciones,
                            status:         evaluacion.id_status,
                            weight:         evaluacion.nu_peso,

                        } 
                    )

                }
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
