<template>

     <v-toolbar :color="color" :dark="dark" flat :dense="dense"> 
            
        <v-row>
            <v-col>
                <div>
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small :color="`${color} lighten-1`" v-on="on" @click="$emit('OnPrev')" depressed>
                        <v-icon :color="textColor">mdi-chevron-left</v-icon>
                    </v-btn>
                </template>
                <span>Anterior</span>
                </v-tooltip>

                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab dark x-small :color="`${color} lighten-1`" v-on="on" @click="$emit('OnNext')" depressed>
                        <v-icon :color="textColor">mdi-chevron-right</v-icon>
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
                        <v-btn depressed x-small :color="`${color} lighten-1`" fab value="1" @click="$emit('OnToday')" v-on="on" rounded>
                            <v-icon size="24" :color="textColor">mdi-calendar-today</v-icon>
                        </v-btn>
                    </template>
                    <span>Hoy</span>
                </v-tooltip>
           
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }" >
                        <v-btn depressed value="month" fab x-small v-on="on" :color="( type == 'month' ) ? `${color} lighten-4` : `${color} lighten-1`" @click="$emit('OnType', 'month')">
                            <v-icon :color="textColor">mdi-calendar-month</v-icon>
                        </v-btn>
                    </template>
                    <span>Ver Mes</span>
                </v-tooltip>

                <v-tooltip bottom>
                    <template v-slot:activator="{ on }" >
                        <v-btn depressed value="week" fab x-small v-on="on" :color="( type == 'week' ) ? `${color} lighten-4` : `${color} lighten-1`" @click="$emit('OnType', 'week')">
                            <v-icon  size="24" :color="textColor">mdi-calendar-week</v-icon>
                        </v-btn>
                    </template>
                    <span>Ver Semana</span>
                </v-tooltip>

                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn depressed value="day" fab x-small v-on="on" :color="( type == 'day' ) ? `${color} lighten-4` : `${color} lighten-1`" @click="$emit('OnType', 'day')">
                            <v-icon  size="24" :color="textColor">mdi-view-day</v-icon>
                        </v-btn>
                    </template>
                    <span>Ver Dia</span>
                </v-tooltip>
    
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn depressed x-small fab v-on="on" :color="(weekend) ? `${color} lighten-4` : `${color} lighten-1`" @click="$emit('OnWeekend')">
                            <v-icon  size="24" :color="textColor">mdi-calendar-weekend</v-icon>
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

        color: {
            type:    String,
            default: 'indigo'
        },

        textColor: {
            type:    String,
            default: 'black'
        },

        dense: {
            type:    Boolean,
            default: false
        },

        dark: {
            type:    Boolean,
            default: true
        }
    },

}
</script>

<style>

</style>