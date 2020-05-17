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
                        <td class="text-xs-left">{{ item.nb_colegio }}</td>
						<td class="text-xs-left">{{ item.id_tipo_colegio }}</td>
						<td class="text-xs-left">{{ item.tx_codigo }}</td>
						<td class="text-xs-left">{{ item.tx_direccion }}</td>
						<td class="text-xs-left">{{ item.tx_telefono }}</td>
						<td class="text-xs-left">{{ item.nu_estudiantes }}</td>
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

            <form-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
                :fullscreen="true"
                width=""
            >
                <colegio-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></colegio-form>

            </form-modal>

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
import colegioForm  from './colegioForm';
export default {
    mixins:     [ listHelper],
    components: { 'colegio-form': colegioForm },
    data () {
    return {
        title:    'Colegio',
        resource: 'colegio',
        headers: [
            { text: 'Colegio',   value: 'nb_colegio' },
			{ text: 'Tipo Colegio',   value: 'id_tipo_colegio' },
			{ text: 'Codigo',   value: 'tx_codigo' },
			{ text: 'Direccion',   value: 'tx_direccion' },
			{ text: 'Telefono',   value: 'tx_telefono' },
			{ text: 'Estudiantes',   value: 'nu_estudiantes' },
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