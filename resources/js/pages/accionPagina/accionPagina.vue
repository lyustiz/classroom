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
                        <td class="text-xs-left">{{ item.nb_accion_pagina }}</td>
						<td class="text-xs-left">{{ item.id_pagina }}</td>
						<td class="text-xs-left">{{ item.id_recurso }}</td>
						<td class="text-xs-left">{{ item.id_tipo_accion }}</td>
						<td class="text-xs-left">{{ item.tx_x_posicion }}</td>
						<td class="text-xs-left">{{ item.tx_y_posicion }}</td>
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
                <accion-pagina-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></accion-pagina-form>

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
import accionPaginaForm  from './accionPaginaForm';
export default {
    mixins:     [ listHelper],
    components: { 'accion-pagina-form': accionPaginaForm },
    data () {
    return {
        title:    'AccionPagina',
        resource: 'accionPagina',
        headers: [
            { text: 'Accion Pagina',   value: 'nb_accion_pagina' },
			{ text: 'Pagina',   value: 'id_pagina' },
			{ text: 'Recurso',   value: 'id_recurso' },
			{ text: 'Tipo Accion',   value: 'id_tipo_accion' },
			{ text: 'X Posicion',   value: 'tx_x_posicion' },
			{ text: 'Y Posicion',   value: 'tx_y_posicion' },
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