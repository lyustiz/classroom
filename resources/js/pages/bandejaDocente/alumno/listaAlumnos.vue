<template>

    <v-card flat :loading="loading">

        <v-card-text class="pt-2">
            <v-row justify="center"> 
              
              <v-expansion-panels focusable class="rounded-xl" accordion v-model="section" >
                    <v-expansion-panel v-for="grupo in grupos" :key="grupo.id">
                        
                        <v-expansion-panel-header>
                            <template v-slot:default >
                                <div>
                                    <v-icon color="red" class="mr-1">mdi-school</v-icon> {{ grupo.nb_grupo }} 
                                </div>
                            </template>
                        </v-expansion-panel-header>

                        <v-expansion-panel-content class="expand-alumnos">
                            <v-list subheader two-line dense> 

                                <v-list-item v-for="alumno in grupo.alumno" :key="alumno.id" > 
                                    <v-list-item-avatar>
                                        <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                                        <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
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
            docente:  1,     //TODO: agregar docente
            section: null,
            grupos:   [],
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
           this.getResource( `grupo/alumnos/docente/${this.docente}` ).then( data => this.grupos = data )
        },

    }
}
</script>

<style scoped>

.expand-alumnos{
    max-height: 51vh !important;
    overflow-y: scroll;
}
</style>