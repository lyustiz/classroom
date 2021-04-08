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
                        <td class="text-xs-left">
                            <app-foto-cuenta 
                                :origenId="item.id" 
                                :maxItems="1" 
                                :tipoFoto="8" 
                                :foto="item.foto"
                                :aspectRatio="32/43">
                            </app-foto-cuenta> 
                        </td>
                        <td class="text-xs-left">{{ item.nb_empleado }}</td>
						<td class="text-xs-left">
                            <list-icon :data="sexoIcons" :value="item.tx_sexo"></list-icon>
                        </td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">{{ item.cargo.nb_cargo }}</td>
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
                width="95vw"
            >
                <empleado-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></empleado-form>

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
import empleadoForm  from './empleadoForm';
export default {
    mixins:     [ listHelper],
    components: { 'empleado-form': empleadoForm },
    data () {
    return {
        title:    'Empleado',
        resource: 'empleado',
        headers: [
            { text: 'Foto',   value: 'id', sortable: false, filterable: false },
            { text: 'Apellidos y Nombres',   value: 'nb_empleado' },
			{ text: 'Sexo',   value: 'tx_sexo' },
			{ text: 'Documento',   value: 'tx_documento' },
			{ text: 'Cargo',   value: 'cargo.nb_cargo' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
    }
    },

}
</script>

<style>
</style>