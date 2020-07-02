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
                        <td class="text-xs-left">{{ item.nb_foto }}</td>
						<td class="text-xs-left">{{ item.tx_src }}</td>
						<td class="text-xs-left">{{ item.id_tipo_foto }}</td>
						<td class="text-xs-left">{{ item.id_origen }}</td>
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
                <foto-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></foto-form>

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
import fotoForm  from './fotoForm';
export default {
    mixins:     [ listHelper],
    components: { 'foto-form': fotoForm },
    data () {
    return {
        title:    'Foto',
        resource: 'foto',
        headers: [
            { text: 'Foto',          value: 'nb_foto' },
			{ text: 'Src',           value: 'tx_src' },
			{ text: 'Tipo Foto',     value: 'id_tipo_foto' },
			{ text: 'Entidad',       value: 'id_origen' },
			{ text: 'Observaciones', value: 'tx_observaciones', sortable: false, filterable: false },
			{ text: 'Status',        value: 'id_status' },
            { text: 'Acciones',      value: 'actions', sortable: false, filterable: false },
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