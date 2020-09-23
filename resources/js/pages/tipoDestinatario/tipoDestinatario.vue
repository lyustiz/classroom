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
                        <td class="text-xs-left">{{ item.nb_tipo_destinatario }}</td>
						<td class="text-xs-left">{{ item.tx_origen }}</td>
						<td class="text-xs-left"><v-icon :color="item.tx_color">{{item.tx_icono}}</v-icon></td>
						<td class="text-xs-left"><v-chip small label :color="item.tx_color"></v-chip></td>
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
                <tipo-destinatario-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tipo-destinatario-form>

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
import tipoDestinatarioForm  from './tipoDestinatarioForm';
export default {
    mixins:     [ listHelper],
    components: { 'tipo-destinatario-form': tipoDestinatarioForm },
    data () {
    return {
        title:    'Tipo Destinatario',
        resource: 'tipoDestinatario',
        headers: [
            { text: 'Tipo Destinatario',   value: 'nb_tipo_destinatario' },
            { text: 'Origen',   value: 'tx_origen' },
			{ text: 'Icono',   value: 'tx_icono' },
			{ text: 'Color',   value: 'tx_color' },
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