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
                        <td class="text-xs-left">{{ item.nb_perfil }}</td>
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

                                <v-dialog max-width="640" content-class="rounded-xl">
                                    <template v-slot:activator="{ on, attrs }">
                                        <app-button v-bind="attrs" v-on="on" icon="mdi-account-lock" label="Permisos"></app-button>
                                    </template>
                                    <permiso-form :perfil="item" action="upd" @closeModal="closeDialog($event,'dialogIncidencia')"></permiso-form>
                                </v-dialog>

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
                <perfil-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></perfil-form>

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
import perfilForm  from './perfilForm';
import AppPermisoForm  from '@pages/permiso/AppPermisoForm'
export default {

    mixins:     [ listHelper],

    components: { 
        'perfil-form':  perfilForm,
        'permiso-form': AppPermisoForm
    },

    data () {
        return {
            title:    'Perfil',
            resource: 'perfil',
            headers: [
                { text: 'Perfil',   value: 'nb_perfil' },
                { text: 'Observaciones',   value: 'tx_observaciones' },
                { text: 'Status',   value: 'id_status' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
            dilogPermiso: false
        }
    },

    methods:
    {
        closeDialog(refresh, dialog)
        {
            this[dialog]   = false
            if(refresh)    this.list()
        }
   
    }
}
</script>

<style>
</style>