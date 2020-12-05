<template>
  <div >
      <v-toolbar color="grey lighten-3"  flat class="mt-2 mx-2" rounded dense> 
            
            <v-row>
                <v-col>

                    <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn fab x-small color="grey lighten-5" v-on="on" @click="prev($event)" depressed>
                            <v-icon>mdi-chevron-left</v-icon>
                        </v-btn>
                    </template>
                    <span>Anterior</span>
                    </v-tooltip>

                    <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn fab x-small color="grey lighten-5" v-on="on" @click="next($event)" depressed>
                            <v-icon>mdi-chevron-right</v-icon>
                        </v-btn>
                    </template>
                    <span>Siguiente</span>
                    </v-tooltip>

                </v-col>

                <v-spacer></v-spacer>

                <v-col>
                    <v-toolbar-title>
                        {{ title }}
                    </v-toolbar-title>
                </v-col>
  
                <v-spacer></v-spacer>

                <v-col class="flex-grow-0">
                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }">
                            <v-btn depressed value="1" @click="setToday()" v-on="on" rounded>
                                <v-icon color="grey darken-2">mdi-calendar-today</v-icon>
                            </v-btn>
                        </template>
                        <span>Hoy</span>
                    </v-tooltip>
                </v-col>

                <v-col class="flex-grow-0">
                    <v-btn-toggle v-model="type" mandatory dense rounded borderless>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn value="month" v-on="on">
                                    <v-icon>mdi-calendar-month</v-icon>
                                </v-btn>
                            </template>
                            <span>Ver Mes</span>
                        </v-tooltip>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn value="week" v-on="on">
                                    <v-icon>mdi-calendar-week</v-icon>
                                </v-btn>
                            </template>
                            <span>Ver Semana</span>
                        </v-tooltip>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn value="day" v-on="on">
                                    <v-icon>mdi-view-day</v-icon>
                                </v-btn>
                            </template>
                            <span>Ver Dia</span>
                        </v-tooltip>
     
                    </v-btn-toggle>
                </v-col>

                <v-col class="flex-grow-0">
                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }">
                            <v-btn depressed v-on="on" @click="weekend =! weekend" rounded :color="(weekend) ? 'grey lighten-1' : 'grey lighten-4'">
                                <v-icon color="grey darken-2">mdi-calendar-weekend</v-icon>
                            </v-btn>
                        </template>
                        <span>Fines de Semana</span>
                    </v-tooltip>
                </v-col>

            </v-row>
        </v-toolbar>

      <v-sheet color="pa-2">
           <v-calendar 
                ref="calendar"
                v-model="focus"
                :now="today"
                :end="endDate"
                class="rounded agenda-container" 
                :type="type"
                :weekdays="weekdays"
                color="info"
                :events="events"
                :event-color="getEventColor"
                @click:event="showEvent"
                @click:date="addEvent"
                :first-interval="6"
                :interval-minutes="60"
                :interval-count="14"
                :interval-format="formatHour"
                :interval-height="60"
                @change="updateRange" 
            > 
                <template v-slot:event="{ event }">
                    <v-icon size="18" class="white--text mx-2" v-text="event.icon"></v-icon>{{event.name}}
                </template> 
                
            </v-calendar>
        </v-sheet>

        <v-dialog v-model="dialogShow" max-width="500px" content-class="rounded-xl" >
            <agenda-evento 
                v-if="dialogShow"
                :event="event" 
                @closeModal="closeModal('showEvento')" 
                @refresh="list()" 
                @delete="deleteForm($event)"
                @update="updateForm($event)"
            ></agenda-evento>
        </v-dialog>

        <app-modal
            :modal="dialogForm"
            @closeModal="closeModal('addEvento')"
            :head-color="$App.theme.headModal"
            :title="title"
        >
            <agenda-form 
                :date="date" 
                :action="action"
                :item="event"
                @closeModal="closeModal('addEvento')"
            ></agenda-form>

        </app-modal>

        <form-delete
            :dialog="dialogDel"
            :loading="loading"
            message="Desea eliminar el Registro Seleccionado?"
            @deleteItem="eventDelete()"
            @deleteCancel="closeModal('delEvento')"
        ></form-delete>


    </div>
</template>

<script>
import AppData         from '@mixins/AppData';
import AppAgendaForm   from './AppAgendaForm'
import AppAgendaEvento from './AppAgendaEvento'

export default {

    components: {   
                'agenda-form':   AppAgendaForm,
                'agenda-evento': AppAgendaEvento,
                },

    mixins:     [ AppData ],

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

        calendario()
        {
            return this.$store.getters['getCalendario']
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
                resource:   'agenda',
                today:      new Date().toISOString().substr(0, 10),
                focus:      new Date().toISOString().substr(0, 10),
                title:      null,
                month:      null,
                weekend:    null,
                start:      null,
                end:        null,
                type:       'month',
                endDate:    '2020-07-31',
                events:     [],
                event:      {},
                date:       {},
                dialogForm:  false,
                dialogShow: false,
                dialogDel: false,
                action:     null
            }
    },

    methods:
    {
        
        list()
        {   
            this.month = this.months[0]         
            this.getResource( this.resource ).then( data =>  {this.events = data.data } )
        },
        
        formatHour({time})
        {
            return time
        },

        prev (event) {
            this.$refs.calendar.prev()
        },

        next (event) {
            this.$refs.calendar.next()
        },

        setToday () {
            this.focus = this.today
        },

        getEventColor (event) {
            return event.color
        },

        showEvent ({  event }) {
            this.event = event
            this.dialogShow = true
        },

        addEvent ( date) {
            this.date      = date
            this.dialogForm = true
            this.action = 'ins'
        },

        updateRange ({ start, end }) {
            this.start = start
            this.end = end
            this.title = this.$refs.calendar.title
        },

        closeModal(type)
        {
            console.log(type)
            switch (type) {
                case 'showEvento':
                    this.dialogShow = false
                    break;
                case 'addEvento':
                    this.dialogForm  = false
                    this.action = null
                    this.event = null
                    this.list()
                    break;
                case 'delEvento':
                    this.dialogDel  = false
                    break;
            }
        },

        deleteForm (item)
        {
            this.dialogShow = false;
            this.dialogDel  = true;
            this.item       = item;
        },

        eventDelete()
        {
            this.deleteResource('agenda/' + this.event.id )
            .then( (data) => {
                this.showMessage(data.msj)
                this.event = {}
                this.dialogDel  = false;
                this.list();
            })
        },

        updateForm(event)
        {
            this.dialogShow = false;
            this.date       = { date: event.date }
            this.action     = 'upd'
            this.dialogForm = true;
        }
    }
}
</script>

<style>
.agenda-container{
    height: 79vh !important;
}
</style>