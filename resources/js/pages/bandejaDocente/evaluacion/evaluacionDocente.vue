<template>

    <v-card flat :loading="loading">

        <v-card-text class="pt-2">
            <v-row justify="center"> 
              
                <v-expansion-panels focusable class="rounded-xl" accordion >
                    <v-expansion-panel v-for="grupo in grupos" :key="grupo.id">
                        
                        <v-expansion-panel-header>
                            <template v-slot:default="{ open }" >
                                <div @click="getAlumnos(grupo, open)">
                                    <v-icon color="red" class="mr-1">mdi-school</v-icon> {{ grupo.nb_grupo }}
                                </div>
                            </template>
                        </v-expansion-panel-header>

                        <v-expansion-panel-content class="expand-alumnos">
                            <v-list subheader two-line dense> 

                                <v-list-item v-for="alumno in alumnos" :key="alumno.id" > 
                                    <v-list-item-avatar>
                                    <v-img :src="`/storage/foto/alumno/${alumno.id}.jpg`"></v-img>
                                    </v-list-item-avatar>

                                    <v-list-item-content>
                                    <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                                    <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                                    </v-list-item-content>

                                    <v-list-item-icon>
                                        <list-menu iconColor="deep-purple lighten-5" :itemsMenu="itemsMenu"></list-menu>
                                    </v-list-item-icon>
                                </v-list-item>
                            </v-list>
                        </v-expansion-panel-content>

                    </v-expansion-panel>
                </v-expansion-panels>
            </v-row>

        </v-card-text>   

    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
export default {

    mixins:     [ DataHelper ],

    created()
    {
        this.list()
    },

    data () {
        return {
            docente:   1,     //TODO: agregar docente
            grupos:    [],
            materias:  [],
            itemsMenu: [
                { label: 'Evaluaciones Alumno', icon: 'mdi-notebook', action: 'evaluar-alumno' },
                { label: 'Notificar Alumno', icon: 'mdi-bell-alert', action: 'notificar-alumno' },
            ]
        }
    },
    methods:
    {
        list()
        {
           this.getResource( `docenteMateria/docente/${this.docente}` ).then( data => this.grupos = data )
        },

        getAlumnos(grupo, open)
        {
           this.alumnos = []
           if(!open)
           {
               this.getResource( `alumno/grupo/${grupo.id}` ).then( data => this.alumnos = data )
           }
        }

    }


}
</script>

<style>

.expand-alumnos{
    max-height: 51vh !important;
    overflow-y: scroll;
}
</style>