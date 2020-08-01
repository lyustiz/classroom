<template>
           
    <v-card flat :loading="loading" height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Compañeros del Alumno" @closeModal="$emit('closeModal')"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="mt-3">

            <v-row no-gutters justify="center"> 

                <v-col>

                <v-list subheader two-line dense width="100%" color="grey lighten-4" class="rounded-xl"> 
                    
                    <v-subheader class="grey pl-4 lighten-3 rounded-t-xl">
                        <v-icon class="mr-2" color="orange">mdi-alphabetical-variant</v-icon>{{alumno.grupo.nb_grupo}}
                    </v-subheader>
                    
                    <v-list-item v-for="alumno in alumnos" :key="alumno.id" > 
                        <v-list-item-avatar>
                            <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                            <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                            <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                            <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-action>
                            <v-icon color="grey lighten-2">mdi-alert-circle</v-icon>
                        </v-list-item-action>
                    </v-list-item>

                </v-list>

                </v-col>

            </v-row>

        </v-card-text>   
    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
export default {

    mixins:     [ DataHelper ],

    props: {
         alumno: {
            type:       Object,
            default:    () => {}
        },
    },

    watch:
    {
        alumno()
        {
            this.list()
        }
    },

    created()
    {
        this.list()
    },

    data: () => 
    ({
        alumnos: []
    }),
    methods:
    {
        list()
        {
           this.getResource( `alumno/${this.alumno.id}/partners` ).then( data =>  this.alumnos = data )
        }
    }
}
</script>

<style>
</style>