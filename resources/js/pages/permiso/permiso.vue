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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.id_menu }}</td>
						<td class="text-xs-left">{{ item.id_perfil }}</td>
						<td class="text-xs-left">{{ item.bo_select }}</td>
						<td class="text-xs-left">{{ item.bo_insert }}</td>
						<td class="text-xs-left">{{ item.bo_update }}</td>
						<td class="text-xs-left">{{ item.bo_delete }}</td>
						<td class="text-xs-left">{{ item.bo_admin }}</td>
						<td class="text-xs-left">{{ item.bo_default }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :item="item"
                                :resource="resource"
                                @onStatusChanging="loading=true"
                                @onStatusChanged="loading=false">
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
                <permiso-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></permiso-form>

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
import permisoForm  from './permisoForm';
export default {
    mixins:     [ listHelper],
    components: { 'permiso-form': permisoForm },
    data () {
    return {
        title:    'Permiso',
        resource: 'permiso',
        headers: [
            { text: 'Menu',   value: 'id_menu' },
			{ text: 'Perfil',   value: 'id_perfil' },
			{ text: 'Select',   value: 'bo_select' },
			{ text: 'Insert',   value: 'bo_insert' },
			{ text: 'Update',   value: 'bo_update' },
			{ text: 'Delete',   value: 'bo_delete' },
			{ text: 'Admin',   value: 'bo_admin' },
			{ text: 'Default',   value: 'bo_default' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
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