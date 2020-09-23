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
                        <td class="text-xs-left">
                            <list-simple-icon :label="item.menu.tx_icono" :icon="item.menu.tx_icono" :color="item.tx_color"></list-simple-icon>
                        </td>
                        <td class="text-xs-left">{{ item.nb_asistente }}</td>
						<td class="text-xs-left">{{ item.menu.nb_menu }}</td>
						<td class="text-xs-left">{{ item.tx_descripcion }}</td>
						<td class="text-xs-left">{{ item.nu_orden }}</td>
						<td class="text-xs-left">{{ item.tx_grupo }}</td>
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
                <asistente-form
                    :action="action"
                    :item="item"
                    :orden="orden"
                    @closeModal="closeModal()"
                ></asistente-form>

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
import asistenteForm  from './asistenteForm';
export default {

    mixins:     [ listHelper],

    components: { 
        'asistente-form': asistenteForm 
    },

    computed: 
    {
        orden()
        {
            return (this.items) ? this.items.length : 0
        }
    },

    data () {
        return {
            title:    'Asistente',
            resource: 'asistente',
            headers: [
                { text: 'Icono',       value: 'menu.nb_menu' },
                { text: 'Menu',        value: 'menu.nb_menu' },
                { text: 'Asistente',   value: 'nb_asistente' },
                { text: 'Descripcion', value: 'tx_descripcion' },
                { text: 'Orden',       value: 'nu_orden' },
                { text: 'Grupo',       value: 'tx_grupo' },
                { text: 'Status',      value: 'id_status' },
                { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
            ],
        }
    },

}
</script>

<style>
</style>