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
                dense
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.co_departamento }}</td>
						<td class="text-xs-left">{{ item.nb_departamento }}</td>
						<td class="text-xs-left">{{ item.id_pais }}</td>
						<td class="text-xs-left">{{ item.tx_latitud }}</td>
						<td class="text-xs-left">{{ item.tx_longitud }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
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

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <departamento-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></departamento-form>

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
import departamentoForm  from './departamentoForm';
export default {
    mixins:     [ listHelper],
    components: { 'departamento-form': departamentoForm },
    data () {
    return {
        title:    'Departamento',
        resource: 'departamento',
        headers: [
            { text: 'Departamento',   value: 'co_departamento' },
			{ text: 'Departamento',   value: 'nb_departamento' },
			{ text: 'Pais',   value: 'id_pais' },
			{ text: 'Latitud',   value: 'tx_latitud' },
			{ text: 'Longitud',   value: 'tx_longitud' },
			{ text: 'Observaciones',   value: 'tx_observaciones', sortable: false, filterable: false },
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