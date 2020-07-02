<template>

    <v-card dark>
   


        <v-img  src="/images/class.jpg" lazy-src="/images/class.jpg" aspect-ratio="1.8" contain ></v-img>

            

        <v-toolbar color="indigo" dense>
            <v-btn icon color="white"><v-icon>mdi-arrow-right-drop-circle</v-icon></v-btn>
            <v-btn icon color="white"><v-icon>mdi-stop-circle</v-icon></v-btn>
            <v-btn icon color="white"><v-icon>mdi-pause-circle</v-icon></v-btn>
            <v-progress-linear
                v-model="progress"
                :buffer-value="buffer"
            ></v-progress-linear>
            <v-btn icon color="white"><v-icon>mdi-cog</v-icon></v-btn>
           
        </v-toolbar>
    </v-card>

   

</template>

<script>
import DataHelper from '@mixins/AppData';
export default {

    mixins:     [ DataHelper ],

    created()
    {
    },

    data () {
        return {
            progress: 25,
            buffer: 100,
            title:    'Evaluaciones',
            grupo:    1,  //TODO: agregar grupo
            periodo:  null,
            headers:  [
                { text: ' ',        value: 'expand'},
                { text: 'Materia',  value: 'nb_materia' },
            ],
            selects:  
            {
                periodo: 	 [],
            },
        }
    },
    methods:
    {
        getMaterias(periodo)
        {
           this.getResource( `materia/grupo/${this.grupo}` ).then( data =>  this.items = data )
        }
    }
}
</script>

<style>
</style>