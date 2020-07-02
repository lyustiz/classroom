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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_status }}</td>
						<td class="text-xs-left">{{ item.nb_secundario }}</td>
						<td class="text-xs-left">{{ item.co_status }}</td>
						<td class="text-xs-left">{{ item.co_grupo }}</td>
						<td class="text-xs-left">{{ item.id_padre }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
						<td class="text-xs-left">{{ item.bo_activo }}</td>
                        
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
                <status-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></status-form>

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
import statusForm  from './statusForm';
export default {
    mixins:     [ listHelper],
    components: { 'status-form': statusForm },
    data () {
    return {
        title:    'Status',
        resource: 'status',
        headers: [
            { text: 'Status',   value: 'nb_status' },
			{ text: 'Secundario',   value: 'nb_secundario' },
			{ text: 'Status',   value: 'co_status' },
			{ text: 'Grupo',   value: 'co_grupo' },
			{ text: 'Padre',   value: 'id_padre' },
			{ text: 'Observaciones',   value: 'tx_observaciones', sortable: false, filterable: false },
			{ text: 'Activo',   value: 'bo_activo' },
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