<template>

    <v-card class="rounded-xl">

        <v-date-picker 
            full-width
            v-model="today"
            :events="getEvent"
            @click:date="showEvent"
            readonly
            color="indigo"
            class="rounded-xl"
        ></v-date-picker>

        <v-dialog v-model="dialogShow" max-width="500px" content-class="rounded-xl" >
            <calendario-evento :events="eventsShow" @closeModal="closeModal"></calendario-evento>
        </v-dialog>

    </v-card>

</template>

<script>

import AppData           from '@mixins/AppData'
import CalenadarioEvento from './CalendarioEvento'

export default {

    mixins: [AppData],

    components: 
    { 
        'calendario-evento': CalenadarioEvento,
    },

    created()
    {
        this.list()
    },

    data()
    {
        return {
            today:      new Date().toISOString().substr(0, 10),
            dialogShow: false,
            eventsShow: [],
            events: [],
            
        }
    },

    methods: 
    {
        
        list()
        {
            this.getResource( 'agenda' ).then( (data) => this.events = data.data)
        },
        
        getEvent(date)
        {
           let colors = []

           this.events.map( (event) => {
               if(event.date == date )
               {
                   colors.push(event.color);
               }
           })
           return colors
           
        },

        datesEvents()
        {
            let dates = []

            this.events.map( (event) => dates.push(event.date))

            return dates
        },

        showEvent(date)
        {
            this.eventsShow  = this.events.filter((event) => event.date == date);
            
            if(this.eventsShow.length > 0)
            {
                this.dialogShow  = true
            }
        },

        closeModal()
        {
            this.eventsShow  = []

            this.dialogShow  = false
        }
    }

}
</script>

<style>

</style>