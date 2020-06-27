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
                        <td class="text-xs-left">{{ item.nb_tipo_foto }}</td>
						<td class="text-xs-left">{{ item.tx_origen }}</td>
						<td class="text-xs-left">{{ item.tx_storage }}</td>
						<td class="text-xs-left">{{ item.tx_base_path }}</td>
						<td class="text-xs-left">{{ item.tx_grupo }}</td>
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
                <tipo-foto-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tipo-foto-form>

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
import tipoFotoForm  from './tipoFotoForm';
export default {
    mixins:     [ listHelper],
    components: { 'tipo-foto-form': tipoFotoForm },
    data () {
    return {
        title:    'TipoFoto',
        resource: 'tipoFoto',
        headers: [
            { text: 'Tipo Foto',   value: 'nb_tipo_foto' },
			{ text: 'Origen',   value: 'tx_origen' },
			{ text: 'Storage',   value: 'tx_storage' },
			{ text: 'Base Path',   value: 'tx_base_path' },
			{ text: 'Grupo',   value: 'tx_grupo' },
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