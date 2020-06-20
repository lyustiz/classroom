<template>
  <div >
      <v-toolbar color="grey lighten-3"  flat class="mt-2 mx-2" rounded> 
            
            <v-toolbar-title class="mr-3">
                {{ title }}
            </v-toolbar-title>

            <v-row>
                <v-col cols="4" md="2">
                    <v-btn fab x-small text color="grey darken-2"  @click="prev($event)">
                        <v-icon>mdi-chevron-left</v-icon>
                    </v-btn>
                        
                    <v-btn fab x-small text color="grey darken-2"  @click="next($event)" >
                        <v-icon>mdi-chevron-right</v-icon>
                    </v-btn>
                </v-col>
  
                <v-spacer></v-spacer>

                <v-col class="flex-grow-0">
                    <v-btn-toggle v-model="type" mandatory dense rounded >
                        <v-btn value="month">
                            <v-icon>mdi-calendar-month</v-icon>
                        </v-btn>
                        
                        <v-btn value="week">
                            <v-icon>mdi-calendar-week</v-icon>
                        </v-btn>

                        <v-btn value="day">
                            <v-icon>mdi-view-day</v-icon>
                        </v-btn>
                    </v-btn-toggle>
                </v-col>


                <v-col class="flex-grow-0">
                    <v-btn-toggle v-model="weekend" dense rounded>
                        <v-btn value="1">
                            <v-icon>mdi-calendar-weekend</v-icon>
                        </v-btn>
                    </v-btn-toggle>

                </v-col>

                <v-col class="flex-grow-0">

                    <v-btn-toggle  dense rounded>
                        <v-btn value="1" @click="setToday()">
                            <v-icon>mdi-calendar-today</v-icon>
                        </v-btn>
                    </v-btn-toggle>
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
                :event="event" 
                @closeModal="closeModal('showEvento')" 
                @refresh="list()" 
                @delete="deleteForm"
            ></agenda-evento>
        </v-dialog>

       <!--  <v-dialog v-model="dialogAdd" max-width="500px" content-class="rounded-xl" >
           <agenda-form 
                :date="date" 
                :action="action"
                :item="item"
                @closeModal="closeModal()"
            ></agenda-form>
        </v-dialog>
        -->
        <app-modal
            :modal="dialogAdd"
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
import AppData from '@mixins/AppData';
import AppAgendaForm  from './AppAgendaForm'
import AppAgendaEvento  from './AppAgendaEvento'

export default {

    components: {   
                'agenda-form':      AppAgendaForm,
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
                dialogAdd:  false,
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
            this.dialogAdd = true
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
                    this.dialogAdd  = false
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
            console.log(item)
            this.dialogShow = false;
            this.dialogDel  = true;
            this.item       = item;
        },

        eventDelete()
        {
            console.log('delete')
            this.deleteResource('agenda/' + this.event.id )
            .then( (data) => {
                this.showMessage(data.msj)
                this.event = {}
                this.dialogDel  = false;
                this.list();
            })

        }
    }
}
</script>

<style>
.agenda-container{
    height: 78vh;
}
</style>