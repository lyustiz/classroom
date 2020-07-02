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
                        <td class="text-xs-left">{{ item.grupo.nb_grupo }}</td>
						<td class="text-xs-left">{{ item.periodo.nb_periodo }}</td>
                        <td class="text-xs-left">{{ item.materia.nb_materia }}</td>
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
                    <td :colspan="headers.length" class="py-4 " >
                        <plan-detalle :planEvaluacion="item"></plan-detalle>
                    </td>
                </template>

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <plan-evaluacion-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></plan-evaluacion-form>

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
import planEvaluacionForm  from './planEvaluacionForm';
import planDetalle  from '@pages/planDetalle/AppPlanDetalle';
export default {
    mixins:     [ listHelper],
    components: { 
        'plan-evaluacion-form': planEvaluacionForm,
        'plan-detalle':  planDetalle
    },
    data () { 
    return {
        title:    'Plan Evaluacion',
        resource: 'planEvaluacion',
        headers: [
            { text: ' ',               value: 'expand', sortable: false, filterable: false },
            { text: 'Grupo',           value: 'grupo.nb_grupo' },
            { text: 'Periodo',         value: 'periodo.nb_periodo' },
            { text: 'Materia',         value: 'materia.nb_materia' },
			{ text: 'Status',          value: 'id_status' },
            { text: 'Acciones',        value: 'actions', sortable: false, filterable: false },
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