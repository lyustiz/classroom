<template>

     <v-toolbar color="indigo" dark flat :dense="dense"> 
            
        <v-row>
            <v-col>
                <div>
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small color="indigo lighten-1" v-on="on" @click="$emit('OnPrev')" depressed>
                        <v-icon>mdi-chevron-left</v-icon>
                    </v-btn>
                </template>
                <span>Anterior</span>
                </v-tooltip>

                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small color="indigo lighten-1" v-on="on" @click="$emit('OnNext')" depressed>
                        <v-icon>mdi-chevron-right</v-icon>
                    </v-btn>
                </template>
                <span>Siguiente</span>
                </v-tooltip>
                </div>

            </v-col>


            <v-col>
                <v-toolbar-title>
                    {{ title }}
                </v-toolbar-title>
            </v-col>

           

            <v-col md="auto">
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn depressed x-small color="indigo lighten-1" fab value="1" @click="$emit('OnToday')" v-on="on" rounded>
                            <v-icon size="24">mdi-calendar-today</v-icon>
                        </v-btn>
                    </template>
                    <span>Hoy</span>
                </v-tooltip>
           
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }" >
                        <v-btn depressed value="month" fab x-small v-on="on" :color="( type == 'month' ) ? 'indigo lighten-4' : 'indigo lighten-1'" @click="$emit('OnType', 'month')">
                            <v-icon>mdi-calendar-month</v-icon>
                        </v-btn>
                    </template>
                    <span>Ver Mes</span>
                </v-tooltip>

                <v-tooltip bottom>
                    <template v-slot:activator="{ on }" >
                        <v-btn depressed value="week" fab x-small v-on="on" :color="( type == 'week' ) ? 'indigo lighten-4' : 'indigo lighten-1'" @click="$emit('OnType', 'week')">
                            <v-icon  size="24">mdi-calendar-week</v-icon>
                        </v-btn>
                    </template>
                    <span>Ver Semana</span>
                </v-tooltip>

                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn depressed value="day" fab x-small v-on="on" :color="( type == 'day' ) ? 'indigo lighten-4' : 'indigo lighten-1'" @click="$emit('OnType', 'day')">
                            <v-icon  size="24">mdi-view-day</v-icon>
                        </v-btn>
                    </template>
                    <span>Ver Dia</span>
                </v-tooltip>
    
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn depressed x-small fab v-on="on" :color="(weekend) ? 'indigo lighten-4' : 'indigo lighten-1'" @click="$emit('OnWeekend')">
                            <v-icon  size="24">mdi-calendar-weekend</v-icon>
                        </v-btn>
                    </template>
                    <span>Fines de Semana</span>
                </v-tooltip>
            </v-col>

        </v-row>

    </v-toolbar>

</template>

<script>
export default {

    props:
    {
        title: {
            type:    String,
            default: 'Agenda'
        },
        type: {
            type:    String,
            default: 'month'
        },
        weekend: {
            type:    Boolean,
            default: false
        },
        dense: {
            type:    Boolean,
            default: false
        }
    },

}
</script>

<style>

</style>