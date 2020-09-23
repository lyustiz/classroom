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
                dense
            >
                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_menu }}</td>
						<td class="text-xs-left">{{item.modulo.nb_modulo}}</td>
						<td class="text-xs-left">
                            <list-simple-icon :label="item.tx_ruta" icon="mdi-routes" color="grey"></list-simple-icon>
                        </td>
						<td class="text-xs-left">{{ item.tx_path }}</td>
						<td class="text-xs-left">
                            <list-simple-icon :label="item.tx_icono" :icon="item.tx_icono" color="grey"></list-simple-icon>
                        </td>
						<td class="text-xs-left"><v-chip small label :color="item.tx_color"></v-chip></td>
						<td class="text-xs-left">
                            <list-simple-icon :label="item.tx_target" icon="mdi-puzzle" color="grey"></list-simple-icon>
                        </td>
                        <td class="text-xs-left">
                            <list-icon :data="visibleIcons" :value="item.bo_visible"></list-icon>
                        </td>
						<td class="text-xs-left">{{ item.nu_orden }}</td>
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
                <menu-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></menu-form>

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
import menuForm  from './menuForm';
export default {
    mixins:     [ listHelper],
    components: { 'menu-form': menuForm },
    data () {
    return {
        title:    'Menu',
        resource: 'menu',
        headers: [
            { text: 'Menu',     value: 'nb_menu' },
			{ text: 'Modulo',   value: 'modulo.nb_modulo' },
			{ text: 'Ruta',     value: 'tx_ruta' },
			{ text: 'Path',     value: 'tx_path' },
			{ text: 'Icono',    value: 'tx_icono' },
			{ text: 'Color',    value: 'tx_color' },
			{ text: 'Target',   value: 'tx_target' },
			{ text: 'Visible',  value: 'bo_visible' },
			{ text: 'Orden',    value: 'nu_orden' },
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