<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)" :inDialog="inDialog">

        <template slot="HeadTools">
            <add-button @insItem="insertForm()"></add-button>
        </template>

            <v-col cols="12" md="6">
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                ></v-text-field>
            </v-col>

            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
                dense
                single-expand
            >

               <template v-slot:item="{ item, expand, isExpanded }">
                    <tr :class="(isExpanded) ? 'green lighten-4 ': ''">
                        <td class="text-xs-left"> 
                            <v-btn icon color="green" @click="expand(!isExpanded)">
                                <v-icon color="green">{{ (isExpanded) ? 'mdi-arrow-down-drop-circle-outline' : 'mdi-arrow-right-drop-circle-outline'}}</v-icon>
                            </v-btn> 
                        </td>
                        <td class="text-xs-left">{{ item.nb_hora_academica }}</td>
                        <td class="text-xs-left">{{ (item.nivel) ? item.nivel.nb_nivel : 'General' }}</td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :item="item"
                                :resource="resource"
                                @onStatusChanging="loading=true"
                                @onStatusChanged="loading=false">
                            </status-switch>
                        </td>
                        
                        <td class="text-xs-left">
                            <list-buttons 
                                @update="updateForm(item)" 
                                @delete="deleteForm(item)" 
                                :del="!hasCargaHoraria(item)"
                                >
                            </list-buttons>
                        </td>
                    </tr>
                </template>

                <template v-slot:expanded-item="{ headers, item }">
                    <td :colspan="headers.length">
                        <carga-horaria :horaAcademica="item"></carga-horaria>
                    </td>
                </template>

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <hora-academica-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></hora-academica-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import horaAcademicaForm  from './horaAcademicaForm';
import AppCargaHoraria  from '@pages/cargaHoraria/AppCargaHoraria';

export default {

    mixins:     [ listHelper],

    components: { 
        'hora-academica-form': horaAcademicaForm,
        'carga-horaria':       AppCargaHoraria  
    },

    data () {
        return {
            title:    'Hora Academica',
            resource: 'horaAcademica',
            headers: [
                { text: null,          value: 'toggle', sortable: false, filterable: false },
                { text: 'Descripcion', value: 'nb_hora_academica' },
                { text: 'Nivel',       value: 'nivel.nb_nivel' },
                { text: 'Status',      value: 'id_status' },
                { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
            ],
        }
    },

    methods: {
        hasCargaHoraria(item)
        {
            return (item.carga_horaria.length > 0 )
        }    
    }
}
</script>

<style>
</style>