<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)" :inDialog="inDialog">

        <template slot="HeadTools">
           
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
                        <td class="text-xs-left">{{ item.nb_archivo }}</td>
						<td class="text-xs-left">{{ item.id_tipo_archivo }}</td>
						<td class="text-xs-left">{{ item.tx_origen_id }}</td>
						<td class="text-xs-left">{{ item.tx_path }}</td>
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
                <archivo-form
                     origen="detalleEvaluacion"
                    :origenId="1"
                    :tipoArchivo="1"
                    :maxItems="2"
                    @closeModal="closeModal()"
                ></archivo-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                messag e="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import archivoForm  from './archivoForm';
export default {
    mixins:     [ listHelper],
    components: { 'archivo-form': archivoForm },
    data () {
    return {
        title:    'Archivo',
        resource: 'archivo',
        headers: [
            { text: 'Archivo',   value: 'nb_archivo' },
			{ text: 'Tipo Archivo',   value: 'id_tipo_archivo' },
			{ text: 'Origen Id',   value: 'tx_origen_id' },
			{ text: 'Path',   value: 'tx_path' },
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