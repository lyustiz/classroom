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
                        <td class="text-xs-left">{{ item.nb_nombre }}</td>
						<td class="text-xs-left">{{ item.nb_apellido }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">{{ item.tx_tarjeta_prof }}</td>
						<td class="text-xs-left">{{ item.tx_direccion }}</td>
						<td class="text-xs-left">{{ item.tx_telefono }}</td>
						<td class="text-xs-left">{{ item.tx_telefono2 }}</td>
						<td class="text-xs-left">{{ item.tx_foto }}</td>
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
                <profesor-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></profesor-form>

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
import profesorForm  from './profesorForm';
export default {
    mixins:     [ listHelper],
    components: { 'profesor-form': profesorForm },
    data () {
    return {
        title:    'Profesor',
        resource: 'profesor',
        headers: [
            { text: 'Nombre',   value: 'nb_nombre' },
			{ text: 'Apellido',   value: 'nb_apellido' },
			{ text: 'Documento',   value: 'tx_documento' },
			{ text: 'Tarjeta Prof',   value: 'tx_tarjeta_prof' },
			{ text: 'Direccion',   value: 'tx_direccion' },
			{ text: 'Telefono',   value: 'tx_telefono' },
			{ text: 'Telefono2',   value: 'tx_telefono2' },
			{ text: 'Foto',   value: 'tx_foto' },
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