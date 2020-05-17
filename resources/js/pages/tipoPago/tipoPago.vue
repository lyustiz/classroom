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
                        <td class="text-xs-left">{{ item.nb_tipo_pago }}</td>
						<td class="text-xs-left">{{ item.id_comercio }}</td>
						<td class="text-xs-left">{{ item.tx_icono }}</td>
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
                <tipo-pago-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tipo-pago-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <app-message></app-message>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import tipoPagoForm  from './tipoPagoForm';
export default {
    mixins:     [ listHelper],
    components: { 'tipo-pago-form': tipoPagoForm },
    data () {
    return {
        title:    'TipoPago',
        resource: 'tipoPago',
        headers: [
            { text: 'Tipo Pago',   value: 'nb_tipo_pago' },
			{ text: 'Comercio',   value: 'id_comercio' },
			{ text: 'Icono',   value: 'tx_icono' },
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