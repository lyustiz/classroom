<template>
<div v-cloak class="welcome-holder">

    <!-- Contenido -->
    <v-container fluid>

        <v-row>

            <v-col cols="8">

                <v-row>
                    <v-col cols="12">
                    <v-calendar
                    type="week" 
                    :weekdays="[1,2,3,4,5]"
                    :interval-count="8"
                    :first-interval="14"
                    :interval-format="intervalFormat"
                    :events="events"
                    interval-minutes="30"
                    interval-width="65"
                    :today="today"
                    ></v-calendar>
                    </v-col>
               </v-row>
               
               <v-row no-gutters>
                   <v-col>
                <v-list three-line>
                        <v-subheader> Comentarios</v-subheader>

                        <v-list-item>

                            <v-list-item-avatar>
                                <v-icon size="38">mdi-account-circle</v-icon>
                            </v-list-item-avatar>

                            <v-list-item-content>
                                <v-list-item-title>Jose Pedroza</v-list-item-title>
                                <v-list-item-subtitle >Existe la posibilidad de cambiar la fecha del examen</v-list-item-subtitle>
                            </v-list-item-content>
                        </v-list-item>

                        <v-list-item>

                            <v-list-item-avatar>
                                <v-icon size="38">mdi-account-circle</v-icon>
                            </v-list-item-avatar>

                            <v-list-item-content>
                                <v-list-item-title>Luis Yustiz</v-list-item-title>
                                <v-list-item-subtitle >Tengo dudas con la formula de despeje</v-list-item-subtitle>
                            </v-list-item-content>
                        </v-list-item>

                    </v-list>
                    </v-col>
                </v-row>

            </v-col>
            <v-col cols="4">
                <v-card>
                    <v-card-title >
                            Actividades 
                    </v-card-title>
                    <v-card-text>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. At a ipsa, quod recusandae consectetur tenetur modi deserunt ab animi nesciunt sit libero odit quasi eos veniam reiciendis nulla. Suscipit, odio.
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn fab small color="success">
                            <v-icon>mdi-save</v-icon>
                        </v-btn>
                    </v-card-actions>
                </v-card>
                <v-card class="mt-5">
                    <v-card-title >
                            Tareas 
                    </v-card-title>
                    <v-card-text>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. At a ipsa, quod recusandae consectetur tenetur modi deserunt ab animi nesciunt sit libero odit quasi eos veniam reiciendis nulla. Suscipit, odio.
                    </v-card-text>
    
                </v-card>

            </v-col>
        </v-row>
            
    </v-container>

</div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData from '@mixins/AppData';
import AppMessage from '@mixins/AppMessage';

export default {
    mixins: [AppMessage],
    components: 
    { 

    },
    computed: 
    { 
    
    },
    data () 
	{
        return {
            today: '2020-05-04',
            events: [
                {
                name:   'Matematica',
                start:  '2020-05-04 07:00',
                end:    '2020-05-04 08:00',
                },
                {
                name:   'Castellano',
                start:  '2020-05-04 08:00',
                end:    '2020-05-04 09:00',
                },
            ],
        }
    },
    methods: {
        intervalFormat(interval) {
            return interval.time
        }
    }
    
}
</script>

<style>

</style>
