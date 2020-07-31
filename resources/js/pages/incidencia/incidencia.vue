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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.id_alumno }}</td>
						<td class="text-xs-left">{{ item.fe_incidencia }}</td>
						<td class="text-xs-left">{{ item.id_tipo_falta }}</td>
						<td class="text-xs-left">{{ item.tx_descripcion }}</td>
						<td class="text-xs-left">{{ item.id_tipo_sancion }}</td>
						<td class="text-xs-left">{{ item.tx_sancion }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :resource="resource" 
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

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <incidencia-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></incidencia-form>

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
import incidenciaForm  from './incidenciaForm';
export default {
    mixins:     [ listHelper],
    components: { 'incidencia-form': incidenciaForm },
    data () {
    return {
        title:    'Incidencia',
        resource: 'incidencia',
        headers: [
            { text: 'Alumno',   value: 'id_alumno' },
			{ text: 'Incidencia',   value: 'fe_incidencia' },
			{ text: 'Tipo Falta',   value: 'id_tipo_falta' },
			{ text: 'Descripcion',   value: 'tx_descripcion' },
			{ text: 'Tipo Sancion',   value: 'id_tipo_sancion' },
			{ text: 'Sancion',   value: 'tx_sancion' },
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