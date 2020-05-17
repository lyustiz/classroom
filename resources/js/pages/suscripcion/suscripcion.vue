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
                        <td class="text-xs-left">{{ item.id_colegio }}</td>
						<td class="text-xs-left">{{ item.aa_lectivo }}</td>
						<td class="text-xs-left">{{ item.mo_cobro }}</td>
						<td class="text-xs-left">{{ item.mo_pagado }}</td>
						<td class="text-xs-left">{{ item.mo_saldo }}</td>
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
                <suscripcion-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></suscripcion-form>

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
import suscripcionForm  from './suscripcionForm';
export default {
    mixins:     [ listHelper],
    components: { 'suscripcion-form': suscripcionForm },
    data () {
    return {
        title:    'Suscripcion',
        resource: 'suscripcion',
        headers: [
            { text: 'Colegio',   value: 'id_colegio' },
			{ text: 'Lectivo',   value: 'aa_lectivo' },
			{ text: 'Cobro',   value: 'mo_cobro' },
			{ text: 'Pagado',   value: 'mo_pagado' },
			{ text: 'Saldo',   value: 'mo_saldo' },
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