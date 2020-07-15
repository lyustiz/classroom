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
                        <td class="text-xs-left">{{ item.id_tipo_contacto }}</td>
						<td class="text-xs-left">{{ item.id_entidad }}</td>
						<td class="text-xs-left">{{ item.tx_email }}</td>
						<td class="text-xs-left">{{ item.tx_sitio_web }}</td>
						<td class="text-xs-left">{{ item.tx_facebook }}</td>
						<td class="text-xs-left">{{ item.tx_twitter }}</td>
						<td class="text-xs-left">{{ item.tx_instagram }}</td>
						<td class="text-xs-left">{{ item.tx_youtube }}</td>
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
                <contacto-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></contacto-form>

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
import contactoForm  from './contactoForm';
export default {
    mixins:     [ listHelper],
    components: { 'contacto-form': contactoForm },
    data () {
    return {
        title:    'Contacto',
        resource: 'contacto',
        headers: [
            { text: 'Tipo Contacto',   value: 'id_tipo_contacto' },
			{ text: 'Entidad',   value: 'id_entidad' },
			{ text: 'Email',   value: 'tx_email' },
			{ text: 'Sitio Web',   value: 'tx_sitio_web' },
			{ text: 'Facebook',   value: 'tx_facebook' },
			{ text: 'Twitter',   value: 'tx_twitter' },
			{ text: 'Instagram',   value: 'tx_instagram' },
			{ text: 'Youtube',   value: 'tx_youtube' },
			{ text: 'Observaciones',   value: 'tx_observaciones', sortable: false, filterable: false },
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