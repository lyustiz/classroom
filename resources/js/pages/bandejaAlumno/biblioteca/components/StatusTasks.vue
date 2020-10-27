<template>
   <v-card
        class="mx-4 my-4 px-1 rounded-lg"
        height="154"
        width="135"
        color="white"
    >
        <v-card-text class="pa-0">
            <h4 class="text-center title-1 pa-1 font-weight-bold"> Completadas </h4>
            <v-row justify="center" no-gutters class="fill-height align-stretch" > 
                <v-col cols="auto">
                    <v-progress-circular
                        :size="118"
                        :width="15"
                        :value="percent"
                        :color="statusColor"
                        :indeterminate="loading"
                        >
                        <div>
                            <span class="display-1">{{completed}}</span>/
                            <span class="">{{total}}</span>  
                        </div>
                    </v-progress-circular>
                </v-col>
            </v-row>
        </v-card-text>
    </v-card>
</template>

<script>
export default {

    props:{

        total: {
            type: Number,
            default: 0
        },

        completed: {
            type: Number,
            default: 0
        },

        loading: {
            type: Boolean,
            default: false
        }
    },

    computed:
    {
        statusColor()
        {
            if(this.percent == 0)   return 'red'
            if(this.percent <= 50) return 'orange'
            if(this.percent > 50)  return 'green'
        },

        percent()
        {
            return (this.total > 0) ? ((this.completed * 100) / this.total) : 0
        }
    },

    data () {
        return {
            task: 0,
        }
    },
}
</script>

<style>

</style>