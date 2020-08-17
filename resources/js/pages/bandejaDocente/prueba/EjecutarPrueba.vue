<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Ejecutar Pruebas" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
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
                                <td class="text-xs-left">{{ item.grupo.nb_grupo }}</td>
                                <td class="text-xs-left">{{ item.materia.nb_materia }}</td>
                                <td class="text-xs-left">{{ item.alumno.length }}</td>
                                <td class="text-xs-left">{{ item.fe_prueba | formatDate }}</td>
                                <td class="text-xs-left">{{ item.hh_inicio }}</td>
                                <td class="text-xs-left">{{ item.hh_fin }}</td>
                                <td class="text-xs-left">{{ (item.id_status == 5 && item.bo_culminado) ? 'culminada' : item.status.nb_status }}</td>
                            
                                <td class="text-xs-left py-1">
                                    
                                    <template v-if="item.id_status == 4">
                                        <app-button 
                                            color="success" 
                                            icon="mdi-play" 
                                            label="Ejecutar Prueba" 
                                            :loading="loading"
                                            @click="ejecutarPrueba()"> 
                                        </app-button>

                                        <v-dialog v-model="dialogEjecutar" max-width="500" content-class="rounded-xl" scrollable>
                                            <ejecutar-prueba-form 
                                                :item="item" action="upd" v-if="dialogEjecutar" @closeModal="closeDialog($event,'dialogEjecutar')"
                                            ></ejecutar-prueba-form>
                                        </v-dialog>
                                    </template>

                                    <template v-if="item.id_status == 5 && !item.bo_culminado">
                                        <app-button 
                                            color="red" 
                                            icon="mdi-stop" 
                                            label="Cancelar Prueba" 
                                            :loading="loading"
                                            @click="showConfirm('dialogCancelar')"> 
                                        </app-button>
                                        <app-confirm 
                                            :confirm="dialogCancelar" 
                                            titulo="Cancelar" 
                                            mensaje="Dese cancelar la prueba" 
                                            @closeConfirm="closeConfirm($event, 'dialogCancelar', item)">
                                        </app-confirm>
                                    </template>

                                    <template v-if="item.id_status == 5 && item.bo_culminado">
                                        <app-button 
                                            color="amber" 
                                            icon="mdi-restart" 
                                            label="Reiniciar Prueba" 
                                            :loading="loading"
                                            @click="showConfirm('dialogReiniciar')"> 
                                        </app-button>
                                       <app-confirm 
                                            :confirm="dialogReiniciar" 
                                            titulo="Reiniciar" 
                                            mensaje="Desea reiniciar la prueba" 
                                            @closeConfirm="closeConfirm($event, 'dialogReiniciar', item)">
                                        </app-confirm>
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
import EjecutarPruebaForm from './EjecutarPruebaForm'
export default {

    mixins:     [ AppData ],

    components:
    {
        'ejecutar-prueba-form' : EjecutarPruebaForm
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
                { text: 'inicio',           value: 'hh_inicio' },
                { text: 'fin',              value: 'hh_fin' },
                { text: 'Status',           value: 'status.nb_status' },
                { text: 'Acciones',         value: 'actions', sortable: false, filterable: false },
            ],
            validateForm:    false,
            dialogEjecutar:  false,
            dialogCancelar:  false,
            dialogReiniciar: false,
        }
    },

    methods:
    {

        list()
        {
           this.getResource( `prueba/docente/${this.docente.id}/ejecutar`).then( data =>  this.pruebas = data )
        },

        ejecutarPrueba()
        {
            this.dialogEjecutar = true
        },

        closeDialog(refresh, dialog)
        {
            this[dialog]   = false
            this.list()
        },

        showConfirm(dialog)
        {
            this[dialog]         = true
        },

        closeConfirm(confirm, dialog, prueba)
        {           
            this[dialog]   = false;
           
            if(confirm && dialog == 'dialogCancelar')  this.cancelarPrueba(prueba)
           
            if(confirm && dialog == 'dialogReiniciar') this.reiniciarPrueba(prueba)
        },

        cancelarPrueba(prueba)
        {
            this.updateResource(`prueba/cancelar/${prueba.id}`, {id_usuario: this.idUser}).then( data => {
                this.showMessage(data.msj);
                this.list()
            })
        },

        reiniciarPrueba(prueba)
        {
            this.updateResource(`prueba/reiniciar/${prueba.id}`, {id_usuario: this.idUser}).then( data => {
                this.showMessage(data.msj);
                this.list()
            })
        },
    }
}
</script>

<style>
</style>