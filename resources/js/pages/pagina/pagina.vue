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
                        <td class="text-xs-left">{{ item.nu_pagina }}</td>
                        <td class="text-xs-left">{{ item.nb_pagina }}</td>
						<td class="text-xs-left">{{ item.libro.nb_libro }}</td>
                        <td class="text-xs-left">{{ item.tema.nb_tema }}</td>
						<td class="text-xs-left">{{ item.tx_path }}</td>
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
                <pagina-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></pagina-form>

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
import paginaForm  from './paginaForm';
export default {
    mixins:     [ listHelper],
    components: { 'pagina-form': paginaForm },
    data () {
    return {
        title:    'Pagina',
        resource: 'pagina',
        headers: [
            { text: 'Nro',   value: 'nu_pagina' },
            { text: 'Pagina',   value: 'nb_pagina' },
            { text: 'Libro',   value: 'libro.nb_libro' },
            { text: 'Tema',   value: 'tema.nb_tema' },
			{ text: 'Path',   value: 'tx_path' },
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