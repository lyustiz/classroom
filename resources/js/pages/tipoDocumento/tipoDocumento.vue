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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_tipo_documento }}</td>
					<!-- 	<td class="text-xs-left">{{ item.tx_icono }}</td>
						<td class="text-xs-left">{{ item.tx_path }}</td>
						<td class="text-xs-left">{{ item.tx_grupo }}</td> -->
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
                <tipo-documento-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tipo-documento-form>

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
import tipoDocumentoForm  from './tipoDocumentoForm';
export default {
    mixins:     [ listHelper],
    components: { 'tipo-documento-form': tipoDocumentoForm },
    data () {
    return {
        title:    'Tipo Documento',
        resource: 'tipoDocumento',
        headers: [
            { text: 'Tipo Documento', value: 'nb_tipo_documento' },
			/* { text: 'Icono',          value: 'tx_icono' },
			{ text: 'Path',           value: 'tx_path' },
			{ text: 'Grupo',          value: 'tx_grupo' }, */
			{ text: 'Observaciones',  value: 'tx_observaciones' },
			{ text: 'Status',         value: 'id_status' },
            { text: 'Acciones',       value: 'actions', sortable: false, filterable: false },
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