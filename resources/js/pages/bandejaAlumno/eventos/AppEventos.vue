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
            <app-show-events :events="eventsShow" @closeModal="closeModal"></app-show-events>
        </v-dialog>

    </v-card>

</template>

<script>
import AppShowEvents from './AppShowEvents'
export default {

    components: 
    { 
        'app-show-events': AppShowEvents,
    },

    props:
    {
        events: {
            type:    [ Array],
            default: () => [] 
        },
    },

    data()
    {
        return {
            today:      new Date().toISOString().substr(0, 10),
            dialogShow: false,
            eventsShow: [],
        }
    },

    methods: 
    {
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