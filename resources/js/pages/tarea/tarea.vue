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
                        <td class="text-xs-left">{{ item.nb_tarea }}</td>
						<td class="text-xs-left">{{ item.tx_descripcion }}</td>
						<td class="text-xs-left">{{ item.id_tipo_tarea }}</td>
						<td class="text-xs-left">{{ item.id_grado }}</td>
						<td class="text-xs-left">{{ item.id_materia }}</td>
						<td class="text-xs-left">{{ item.id_tema }}</td>
						<td class="text-xs-left">{{ item.nu_peso }}</td>
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
                <tarea-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tarea-form>

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
import tareaForm  from './tareaForm';
export default {
    mixins:     [ listHelper],
    components: { 'tarea-form': tareaForm },
    data () {
    return {
        title:    'Tarea',
        resource: 'tarea',
        headers: [
            { text: 'Tarea',   value: 'nb_tarea' },
			{ text: 'Descripcion',   value: 'tx_descripcion' },
			{ text: 'Tipo Tarea',   value: 'id_tipo_tarea' },
			{ text: 'Grado',   value: 'id_grado' },
			{ text: 'Materia',   value: 'id_materia' },
			{ text: 'Tema',   value: 'id_tema' },
			{ text: 'Peso',   value: 'nu_peso' },
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