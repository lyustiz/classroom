<template>

     <v-toolbar color="grey lighten-3"  flat dense> 
            
        <v-row>
            <v-col md="auto">
                <div>
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab x-small color="grey lighten-5" v-on="on" @click="$emit('OnPrev')" depressed>
                        <v-icon>mdi-chevron-left</v-icon>
                    </v-btn>
                </template>
                <span>Anterior</span>
                </v-tooltip>

                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab x-small color="grey lighten-5" v-on="on" @click="$emit('OnNext')" depressed>
                        <v-icon>mdi-chevron-right</v-icon>
                    </v-btn>
                </template>
                <span>Siguiente</span>
                </v-tooltip>
                </div>

            </v-col>

            <v-spacer ></v-spacer>

            <v-col>
                <v-toolbar-title>
                    {{ title }}
                </v-toolbar-title>
            </v-col>

            <v-spacer></v-spacer>

            <v-col class="flex-grow-0">
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn depressed value="1" @click="$emit('OnToday')" v-on="on" rounded>
                            <v-icon color="grey darken-2">mdi-calendar-today</v-icon>
                        </v-btn>
                    </template>
                    <span>Hoy</span>
                </v-tooltip>
            </v-col>

            <v-col class="flex-grow-0">
                <v-btn-toggle value="type" mandatory dense rounded borderless >

                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }" >
                            <v-btn value="month" v-on="on" @click="$emit('OnType', 'month')">
                                <v-icon>mdi-calendar-month</v-icon>
                            </v-btn>
                        </template>
                        <span>Ver Mes</span>
                    </v-tooltip>

                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }" >
                            <v-btn value="week" v-on="on" @click="$emit('OnType', 'week')">
                                <v-icon>mdi-calendar-week</v-icon>
                            </v-btn>
                        </template>
                        <span>Ver Semana</span>
                    </v-tooltip>

                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }">
                            <v-btn value="day" v-on="on" @click="$emit('OnType', 'day')">
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
                        <v-btn depressed v-on="on" rounded :color="(weekend) ? 'grey lighten-1' : 'grey lighten-4'" @click="$emit('OnWeekend')">
                            <v-icon color="grey darken-2">mdi-calendar-weekend</v-icon>
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