<template>
  <v-card class="rounded-xl elevation-5 pa-4">
    <v-card-text class="pa-0">
      <v-date-picker 
          full-width
          v-model="today"
          :events="getEvent"
          @click:date="showEvent"
          readonly
          color="blue darken-4"
          class="rounded-xl"
          width="275"
          landscape
          id="agenda-alumno"
      ></v-date-picker>
      <v-dialog v-model="dialogShow" max-width="500px" content-class="rounded-xl" >
        <app-show-events :events="eventsShow" @closeModal="closeModal"></app-show-events>
      </v-dialog>
    </v-card-text>
  </v-card>
</template>

<script>
import AppShowEvents from '../eventos/AppShowEvents'
import AppData from '@mixins/AppData';
export default {

    mixins: [ AppData ],
    
    components: 
    { 
        'app-show-events': AppShowEvents,
    },

    created()
    {
        this.list()
    },

    data()
    {
        return {
            events: [],
            today:      new Date().toISOString().substr(0, 10),
            dialogShow: false,
            eventsShow: [],
        }
    },

    methods: 
    {
         list()
        {
            this.getResource( 'agenda' ).then( (data) => 
            { 
                this.events = data.data
            })
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