<template>

    <v-container fluid class="indigo lighten-4 contend"> 

        <v-row>

            <v-col cols="12" md="8" >

                <v-row no-gutters >
                    <v-col cols="12" >
                       <!--  <agenda-acudiente></agenda-acudiente> -->
                    </v-col>
               </v-row>
               
            </v-col>

            <v-col cols="12" md="4">

               <!--  <calendario-docente :events="events"></calendario-docente>
 -->
              <!--   <seccion-docente></seccion-docente> -->

            </v-col>

        </v-row>
            
    </v-container>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData           from '@mixins/AppData';
/*import AgendaAcudiente     from './agenda/AgendaAcudiente'
import CalendarioDocente from './calendario/CalendarioDocente'
import SeccionDocente    from './seccionDocente' */

export default {

    mixins: [AppData],

  components: 
    { 
         /*'agenda-acudiente':     AgendaAcudiente,
        'calendario-docente': CalendarioDocente,
        'seccion-docente':    SeccionDocente */
    }, 



    created()
    {
        this.list()
    },

    data () 
	{
        return {
            pariente: 1, //TODO: pariente
            alumnos:  []
        }
    },

    methods: {
        
        list()
        {
            this.getResource( `/alumno/pariente/${this.pariente.id}`).then( (data) => this.alumnos = data)
        },


    }
    
}
</script>

<style>
.contend{
    min-height: 92.8vh;
}
</style>
