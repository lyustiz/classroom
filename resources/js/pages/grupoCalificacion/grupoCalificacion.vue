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
                        <td class="text-xs-left">{{ item.nb_grupo_calificacion }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
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
                                @delete="deleteForm(item)" >
                            </list-buttons>
                        </td>
                    </tr>
                </template>

                <template v-slot:expanded-item="{ headers, item }">
                    <td :colspan="headers.length">
                        <app-calificacion :grupoCalificacion="item"></app-calificacion>
                    </td>
                </template>

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <grupo-calificacion-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></grupo-calificacion-form>

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
import listHelper            from '@mixins/Applist';
import grupoCalificacionForm from './grupoCalificacionForm';
import AppCalificacion       from '@pages/calificacion/AppCalificacion';
export default {

    mixins:     [ listHelper],

    components: { 
        'grupo-calificacion-form': grupoCalificacionForm,
        'app-calificacion':        AppCalificacion
    },

    data () {

        return {
            title:    'Calificaciones',
            resource: 'grupoCalificacion',
            headers: [     
                { text: null,                   value: 'toggle', sortable: false, filterable: false },
                { text: 'Grupo Calificacion',   value: 'nb_grupo_calificacion' },
                { text: 'Observaciones',        value: 'tx_observaciones' },
                { text: 'Status',               value: 'id_status' },
                { text: 'Acciones',             value: 'actions', sortable: false, filterable: false },
            ],
        }
    },
    methods:
    {
     
    }
}
</script>

<style>
</style>