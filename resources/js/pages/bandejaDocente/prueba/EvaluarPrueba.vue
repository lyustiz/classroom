<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Evaluar Pruebas" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>
            <v-row >
                <v-col cols="10" md="6">
                    <v-text-field
                        v-model="search"
                        append-icon="search"
                        label="Buscar"
                        hide-details
                        clearable
                        dense
                    ></v-text-field>
                </v-col>

                <v-spacer></v-spacer>

                <v-col class="text-center">

                    <app-button 
                        color="info" 
                        icon="mdi-table-refresh" 
                        label="Actualizar" 
                        :loading="loading"
                        @click="list()"> 
                    </app-button>

                </v-col>

            </v-row>

            <v-row no-gutters class="pt-4">

                <v-col>
      
                    <v-data-table
                        :headers="headers"
                        dense
                        :items  ="pruebas"
                        :search ="search"
                        item-key="id"
                        :loading="loading"
                        sort-by=""
                        no-data-text="No existen pruebas pendientes por Revision"
                    >

                        <template v-slot:item="{ item }">
                            <tr>
                                <td class="text-xs-left">{{ item.nb_prueba }}</td>
                                <td class="text-xs-left">{{ item.grupo.nb_grupo }}</td>
                                <td class="text-xs-left">{{ item.materia.nb_materia }}</td>
                                <td class="text-xs-left">{{ item.alumno.length }}</td>
                                <td class="text-xs-left">{{ item.fe_prueba | formatDate }}</td>
                                <td class="text-xs-left">{{ item.status.nb_status }}</td>
                            
                                <td class="text-xs-left py-1">
                                    
                                    <template>
                                        <app-button 
                                            color="success" 
                                            icon="mdi-format-list-checks" 
                                            label="Evaluar Prueba" 
                                            :loading="loading"
                                            @click="evaluarPrueba(item)"> 
                                        </app-button>

                                        <v-dialog v-model="dialogEvaluar" max-width="600" content-class="rounded-xl" scrollable>
                                            <evaluar-prueba-alumno 
                                                :prueba="prueba" 
                                                v-if="dialogEvaluar" 
                                                @closeModal="closeDialog($event,'dialogEvaluar')"
                                            ></evaluar-prueba-alumno>
                                        </v-dialog>
                                    </template>

                                </td>
                            </tr>
                        </template>

                    </v-data-table>
                </v-col>

            </v-row>
            
        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';
import EvaluarPruebaAlumno from './EvaluarPruebaAlumno'
export default {

    mixins:     [ AppData ],

    components:
    {
        'evaluar-prueba-alumno' : EvaluarPruebaAlumno
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    data() {
        return {
            pruebas: [],
            headers: [
                { text: 'Prueba',           value: 'nb_prueba' },
                { text: 'Grupo',            value: 'grupo.nb_grupo' },
                { text: 'Materia',          value: 'materia.nb_materia' },
                { text: 'Alumnos',          value: 'alumno' },
                { text: 'Fecha',            value: 'fe_prueba' },
                { text: 'Status',           value: 'status.nb_status' },
                { text: 'Acciones',         value: 'actions', sortable: false, filterable: false },
            ],
            validateForm:   false,
            dialogEvaluar:  false,
            prueba: null
        }
    },

    methods:
    {

        list()
        {
           this.getResource( `prueba/docente/${this.docente.id}/evaluar`).then( data =>  this.pruebas = data )
        },

        evaluarPrueba(prueba)
        {
            this.prueba = prueba
            this.dialogEvaluar = true
        },

        closeDialog(refresh, dialog)
        {
            this[dialog]   = false
            this.list()
        },
    }
}
</script>

<style>
</style>