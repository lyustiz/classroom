<template>
  <v-card height="76vh" flat class="rounded-xl">

    <app-agenda-toolbar 
        :title="title" 
        :type="type" 
        :weekend="weekend"
        @OnPrev="prev()"
        @OnNext="next()"
        @OnToday="setToday()"
        @OnType="setType($event)"
        @OnWeekend="weekend = !weekend"> 
    </app-agenda-toolbar>

    <v-calendar 
        ref="calendar"
        color="info"
        class="elevation-1"
        v-model="focus"
        :type="type"
        :weekdays="weekdays"
        :now="today"
        :end="endDate"
        :events="allEvents"
        :event-color="getEventColor"
        event-overlap-mode="column"
        :first-interval="6"
        :interval-minutes="60"
        :interval-count="14"
        :interval-format="formatHour"
        @change="updateRange"
        @click:event="showEvent"
        @click:date="setType('day')"
        @click:more="setType('day')"
    > 
        <template v-slot:event="{ event }">
            <v-icon size="18" class="white--text mx-2" v-text="event.icon"></v-icon>{{event.name}}
        </template> 
    </v-calendar>

    <v-dialog v-model="dialogShow" max-width="500px" content-class="rounded-xl" >
            <agenda-evento 
                v-if="dialogShow"
                :event="event" 
                @closeModal="closeModal()" 
            ></agenda-evento>
        </v-dialog>

    </v-card>
</template>

<script>

import AppData from '@mixins/AppData';
import AgendaEvento from './AppAgendaEvento'

export default {

    components: 
    {
        'agenda-evento': AgendaEvento
    },

    mixins: [AppData],

    props:
    {
        events: {
            type:    [ Array],
            default: () => [] 
        },
    },

    created()
    {
        this.list()
    },
    
    computed:
    {
        weekdays()
        {
            return (this.weekend) ? [ 1, 2, 3, 4, 5, 6, 0] : [ 1, 2, 3, 4, 5] 
        },
    },

    mounted()
    {
        this.$nextTick(() => {
            this.title = this.$refs.calendar.title
        })
    },

    data()
    {
        return{
                resource:   'horario',

                horario:    [],
                allEvents:  [],
                today:      new Date().toISOString().substr(0, 10),
                focus:      new Date().toISOString().substr(0, 10),
                title:      null,
                month:      null,
                weekend:    null,
                start:      null,
                end:        null,
                type:       'week',
                endDate:    '2020-07-31',
                event:      {},
                date:       {},
                dialogShow: false,
            }
    },

    methods: {

        list()
        {
            this.getResource( 'horario/grupo/1' ).then( (data) => 
            { 
                this.horario = data.detalle_horario
                const { lastStart, lastEnd } = this.$refs.calendar
                this.updateRange({start: lastStart , end: lastEnd})
            })
            
        },

        formatHour({time})
        {
            return time
        },

        prev() {
            this.$refs.calendar.prev()
        },

        next() {
            this.$refs.calendar.next()
        },

        setToday() {
            this.focus = this.today
        },

        setType(type)
        {
            this.type = type
        },

        getEventColor (event) {
            return event.color
        },

        showEvent ({  event }) {
            this.event = event
            this.dialogShow = true
        },
    
        updateRange ({ start, end }) {
            this.start = start
            this.end   = end
            this.title = this.$refs.calendar.title
            this.setHorario()
        },

        closeModal()
        {
            this.dialogShow = false
            this.event      = []
        },

        setHorario(){

            const { lastStart, lastEnd } = this.$refs.calendar

            switch (this.type) {

                case 'month':
                    this.horarioMonth(lastStart, lastEnd)                   
                    break;
                
                case 'week':
                    this.horarioWeek(lastStart, lastEnd)
                    break;

                case 'day':
                    this.horarioWeek(lastStart, lastEnd)
                    break;
            
                default:
                    break;
                 }
        },

        horarioMonth(start, end)
        {
            this.allEvents = this.events
        },

        horarioWeek(start, end)
        {
            var date = new Date(start.year, start.month-1, start.day);
            
            let horarios   = []

            for (const horario of this.horario) {
               
                let currentDate  = this.sumDateDays(date, (horario.id_dia_semana-1)).toISOString().substr(0, 10)
                
                horarios.push(
                    {
                        id:             horario.id,
                        name:           horario.materia.nb_materia,
                        date:           currentDate,
                        start:          `${currentDate} ${horario.hh_inicio}`,
                        end:            `${currentDate} ${horario.hh_fin}`,
                        startHour:      horario.hh_inicio,    
                        endHour:        horario.hh_fin,    
                        color:          horario.materia.area_estudio.tx_color,
                        category:       'Estudiante', 
                        categoryId:     4,    
                        type:           'horario',
                        typeId:         99,
                        icon:           'mdi-clock-outline',
                        description:    horario.materia.nb_materia,
                        teacher:        horario.docente.nb_docente,
                        classroom:      horario.aula.nb_aula,
                        location:       horario.aula.estructura.tx_path         
                    } 
                )
            }
            this.allEvents = horarios.concat(this.events);
        },

        sumDateDays(date, days)
        {
            let newDate  = new Date(date)
            return  new Date(newDate.setDate(newDate.getDate() + days))       
        }
    }
}
</script>

<style>

</style>

