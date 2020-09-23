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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.id_plan_evaluacion }}</td>
						<td class="text-xs-left">{{ item.id_tipo_evaluacion }}</td>
						<td class="text-xs-left">{{ item.nu_peso }}</td>
						<td class="text-xs-left">{{ item.fe_evaluacion }}</td>
						<td class="text-xs-left">{{ item.tx_tema }}</td>
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

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <plan-detalle-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></plan-detalle-form>

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
import planDetalleForm  from './planDetalleForm';
export default {
    mixins:     [ listHelper],
    components: { 'plan-detalle-form': planDetalleForm },
    data () {
    return {
        title:    'PlanDetalle',
        resource: 'planDetalle',
        headers: [
            { text: 'Plan Evaluacion',   value: 'id_plan_evaluacion' },
			{ text: 'Tipo Evaluacion',   value: 'id_tipo_evaluacion' },
			{ text: 'Peso',   value: 'nu_peso' },
			{ text: 'Evaluacion',   value: 'fe_evaluacion' },
			{ text: 'Tema',   value: 'tx_tema' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
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