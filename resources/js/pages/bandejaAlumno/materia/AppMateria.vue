<template>

    <v-card flat :loading="loading" height="80vh">

        <v-card-title class="pa-0" v-if="!inDialog">
            <app-simple-toolbar title="Calificaciones" @closeModal="$emit('closeModal')"></app-simple-toolbar>
        </v-card-title>
 
        <v-card-title dense class="pa-0">
            <v-toolbar color="grey lighten-4 subtitle-2" flat>
                <v-icon color="orange" class="mr-1">mdi-clipboard-list</v-icon>
                <div class="indigo--text">Calificaciones por Periodo</div>  
                <v-spacer></v-spacer> 
                <list-menu :itemsMenu="itemsMenu" ></list-menu>
            </v-toolbar>
        </v-card-title>

        <v-card-text class="pt-2">
            
            <v-row justify="center"> 
            <v-expansion-panels  focusable class="rounded-xl" accordion>
                <v-expansion-panel v-for="(item,i) in items" :key="i">
                    <v-expansion-panel-header>
                        
                        <div>
                            <v-icon color="red" class="mr-1">mdi-calendar-weekend</v-icon> {{item.nb_periodo}}
                        </div>
                    
                    </v-expansion-panel-header>
                        <v-expansion-panel-content>
                            
                                <v-simple-table dense>

                                <template v-slot:default>
                                    <thead>
                                    <tr>
                                        <th class="text-left">Materia</th>
                                        <th class="text-left">Calificacion</th>
                                        <th class="text-left">Cualitativa</th>
                                        <th class="text-left">Detalle</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="materia in materias" :key="materia.id">
                                        <td>{{ materia.nb_materia }}</td>
                                        <td>A</td>
                                        <td>Sobresaliente</td>
                                        <td>
                                            <v-btn small icon color="indigo">
                                                <v-icon>mdi-text-box-search</v-icon>
                                            </v-btn>
                                        </td>
                                    </tr>
                                    </tbody>
                                </template>

                            </v-simple-table>
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

    computed:
    {
        calendario()
        {
            return this.$store.getters['getCalendario']
        }
    },

    created()
    {
        this.list()
    },

    data () {
        return {
            periodo:  null,
            headers:  [
                { text: ' ',        value: 'expand'},
                { text: 'Materia',  value: 'nb_materia' },
            ],
            materias: [],
            itemsMenu: [
                {
                    label:  'Imprimir Boletin',
                    icon:   'mdi-printer',
                    action: 'print-boletin'
                }
            ]
        }
    },
    methods:
    {
        list()
        {
           this.getResource( `periodo/calendario/${this.calendario.id}` ).then( data =>  this.items = data )
           this.getResource( `materia/grupo/${this.alumno.grupo.id}` ).then( data =>  this.materias = data )
        }

    }
}
</script>

<style>
</style>