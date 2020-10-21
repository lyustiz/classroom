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
                        <td class="text-xs-left">{{ item.nb_tipo_enlace }}</td>
						<td class="text-xs-left"><v-icon :color="item.tx_color">{{item.tx_icono}}</v-icon></td>
						<td class="text-xs-left"><v-chip small label :color="item.tx_color"></v-chip></td>
						<td class="text-xs-left">
                            <list-simple-icon icon="mdi-tooltip-text-outline" color="indigo" :label="item.tx_observaciones"></list-simple-icon>
                        </td>
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
                <tipo-enlace-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tipo-enlace-form>

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
import tipoEnlaceForm  from './tipoEnlaceForm';
export default {
    mixins:     [ listHelper],
    components: { 'tipo-enlace-form': tipoEnlaceForm },
    data () {
    return {
        title:    'Tipo Enlace',
        resource: 'tipoEnlace',
        headers: [
            { text: 'Enlace',   value: 'nb_tipo_enlace' },
			{ text: 'Icono',   value: 'tx_icono' },
			{ text: 'Color',   value: 'tx_color' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
    }
    },

}
</script>

<style>
</style>