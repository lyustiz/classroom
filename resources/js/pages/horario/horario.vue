<template>

    
    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

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
                ></v-text-field>
            </v-col>

            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
                single-expand
            >

                <template v-slot:item="{ item, expand, isExpanded }">
                    <tr :class="(isExpanded) ? 'green lighten-4 ': ''">
                        <td class="text-xs-left"> 
                            <v-btn icon color="grey" @click="expand(!isExpanded)">
                                <v-icon>{{ (isExpanded) ? 'mdi-arrow-down-drop-circle-outline': 'mdi-arrow-right-drop-circle-outline'}}</v-icon>
                            </v-btn> 
                        </td>
                        <td class="text-xs-left">{{ item.nb_horario }}</td>
						<td class="text-xs-left">{{ item.grupo.nb_grupo }}</td>
						<td class="text-xs-left">{{ item.hora_academica.nb_hora_academica }}</td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :item="item" 
                                @onChangeStatus="changeStatus($event)">
                            </status-switch>
                        </td>
                        
                        <td class="text-xs-left">
                            <list-buttons 
                                @update="updateForm(item)" 
                                @delete="deleteForm(item)" >
                            </list-buttons>
                        </td>
                    </tr>
                </template>

                <template v-slot:expanded-item="{ headers, item }">
                    <td :colspan="headers.length" class="py-4" >
                        <carga-horaria :horario="item"></carga-horaria>
                    </td>
                </template>

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <horario-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></horario-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <app-message></app-message>

           

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>
    
</template>

<script>
import listHelper from '@mixins/Applist';
import horarioForm  from './horarioForm';
import CargaHoraria from './cargaHoraria';
export default {

    mixins:     [ listHelper],

    components: { 
        'horario-form' : horarioForm,
        'carga-horaria': CargaHoraria
    },

    data () {
    return {
        title:    'Horario',
        resource: 'horario',
        headers: [
            { text: ' ',              value: 'expand', sortable: false, filterable: false },
            { text: 'Codigo',         value: 'nb_horario' },
			{ text: 'Grupo',          value: 'grupo.nb_grupo' },
			{ text: 'Hora Academica', value: 'hora_academica.nb_hora_academica' },
			{ text: 'Status',         value: 'id_status' },
            { text: 'Acciones',       value: 'actions', sortable: false, filterable: false },
        ],
        expanded: []
    }
    },
    methods:
    {
   
    }
}
</script>

<style>
</style>