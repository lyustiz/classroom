<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Pruebas Pendientes" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
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
                        no-data-text="No existen pruebas pendientes por Ejecucion"
                    >

                        <template v-slot:item="{ item }">
                            <tr>
                                <td class="text-xs-left">{{ item.nb_prueba }}</td>
                                <td class="text-xs-left">{{ item.materia.nb_materia }}</td>
                                <td class="text-xs-left">{{ item.fe_prueba | formatDate }}</td>
                                <td class="text-xs-left">{{ item.pregunta.length }}</td>
                                <td class="text-xs-left">{{ item.nu_minutos }} min</td>
                                <td class="text-xs-left">{{ item.status.nb_status }}</td>
                            
                                <td class="text-xs-left py-1">
                                        
                                        <app-button v-if="!item.prueba_alumno[0].bo_finalizado"
                                            color="amber" 
                                            icon="mdi-play" 
                                            label="Realizar Prueba"
                                            :loading="loading"
                                            @click="dialogEjecutar = true"> 
                                        </app-button>

                                        <app-button v-else 
                                            color="success" 
                                            icon="mdi-check" 
                                            label="Prueba Realizada"
                                            :loading="loading"> 
                                        </app-button>

                                        <app-confirm 
                                            :confirm="dialogEjecutar" 
                                            titulo="Realizar Prueba" 
                                            mensaje="Desea Inicia la Prueba?" 
                                            @closeConfirm="closeConfirm($event, 'dialogEjecutar', item)">
                                        </app-confirm>

                                </td>
                            </tr>
                        </template>

                    </v-data-table>
                </v-col>

            </v-row>
            
        </v-card-text>

        <v-dialog v-model="dialogPrueba" scrollable fullscreen persistent> 
            <ejecutar-prueba v-if="dialogPrueba" :prueba="prueba" :tiempo="tiempo" @closeModal="closeModal($event)"></ejecutar-prueba>
        </v-dialog> 

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';
import EjecutarPrueba from './EjecucionPrueba'
export default {

    mixins:     [ AppData ],

    components:
    {
        'ejecutar-prueba': EjecutarPrueba
    },

    created()
    {
        this.list()
    },

    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno'];
        },
    },

    data() {
        return {
            pruebas: [],
            headers: [
                { text: 'Prueba',           value: 'nb_prueba' },
                { text: 'Materia',          value: 'materia.nb_materia' },
                { text: 'Fecha',            value: 'fe_prueba' },
                { text: 'Preguntas',         value: 'pregunta' },
                { text: 'Tiempo',           value: 'nu_minutos' },
                { text: 'Status',           value: 'status.nb_status' },
                { text: 'Acciones',         value: 'actions', sortable: false, filterable: false },
            ],
            prueba: null,
            tiempo: null,
            dialogEjecutar:  false,
            dialogPrueba: false
        }
    },

    methods:
    {
        list()
        {
           this.getResource( `prueba/alumno/${this.alumno.id}`).then( data =>  this.pruebas = data )
        },

        closeConfirm(confirm, dialog, prueba)
        {           
            this[dialog]     = false;
            this.prueba      = prueba
            let pruebaAlumno = prueba.prueba_alumno[0].id
            if(confirm)  this.iniciarPrueba(pruebaAlumno)
        },

        iniciarPrueba(pruebaAlumno)
        {
            let data = {'id_usuario': this.idUser }
            this.updateResource( `pruebaAlumno/iniciar/${pruebaAlumno}`, data ).then( data =>  {
                this.showMessage(data.msj)
                this.tiempo       = data.nu_minutos
                this.dialogPrueba = true
            })
        },

        closeDialog(refresh, dialog)
        {
            this[dialog]   = false
            this.list()
        },

        closeModal(refresh)
        {
            this.dialogPrueba = false
            this.list()
        }
    }
}
</script>

<style>
</style>