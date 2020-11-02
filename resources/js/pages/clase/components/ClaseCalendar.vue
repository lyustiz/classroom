<template>

        <v-date-picker 
            no-title
            scrollable
            full-width
            v-model="today"
            color="indigo"
            class="rounded-xl"
            elevation="3"
            @change="$emit('onUpdateDate', $event)"
        ></v-date-picker>

</template>

<script>
export default {

    props:
    {
        clases: {
            type:     Array,
            default: () => [] 
        },
    },

    data()
    {
        return {
            today:      new Date().toISOString().substr(0, 10),
        }
    },

    methods: 
    {
        getEvent(date)
        {
          /*  let colors = []

           this.clases.map( (event) => {
               if(event.date == date )
               {
                   colors.push(clases.color);
               }
           })
           return colors */

           
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
.clase-calendar {
    height: 180px !important;
}

</style>