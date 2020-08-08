<template>

    <v-card flat :loading="loading" height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="pruebas" @closeModal="$emit('closeModal')"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="pt-2">
            <v-row justify="center"> 
              
              <v-expansion-panels focusable class="rounded-xl" accordion v-model="section" >
                    <v-expansion-panel v-for="grado in grados" :key="grado.id">
                        
                        <v-expansion-panel-header>
                            <template v-slot:default >
                                <div><v-icon color="red" class="mr-1">mdi-numeric</v-icon> {{ grado.nb_grado }}</div>
                            </template>
                        </v-expansion-panel-header>

                        <v-expansion-panel-content>

                            <list-prueba
                                :docente="docente"
                                :materias="grado.materia"
                                :grado="grado"
                            ></list-prueba>
                        </v-expansion-panel-content>

                    </v-expansion-panel>
                </v-expansion-panels> 

            </v-row>

        </v-card-text>   

    </v-card>

</template>

<script>
import AppData    from '@mixins/AppData';
import ListPrueba from './ListaPrueba'

export default {

    mixins:     [ AppData ],

    components:
    {
        'list-prueba' : ListPrueba
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data () {
        return {
            section: null,
            grados:   [],
            itemsMenu: [
                { label: 'Evaluaciones Alumno', icon: 'mdi-notebook', action: 'addEvaluacion' },
                { label: 'Notificar Alumno', icon: 'mdi-bell-alert', action: 'addNotificacion' },
            ],
            dialogNotificacion: false,
            notificacion:       {}
        }
    },
    methods:
    {
        list()
        {
           this.getResource( `grado/materia/docente/${this.docente.id}` ).then( data => this.grados = data )
        },

    }
}
</script>

