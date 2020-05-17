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
                        <td class="text-xs-left">{{ item.nb_nombre }}</td>
						<td class="text-xs-left">{{ item.nb_apellido }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">{{ item.id_alumno }}</td>
						<td class="text-xs-left">{{ item.id_parentesco }}</td>
						<td class="text-xs-left">{{ item.tx_empresa }}</td>
						<td class="text-xs-left">{{ item.tx_cargo }}</td>
						<td class="text-xs-left">{{ item.tx_ocupacion }}</td>
						<td class="text-xs-left">{{ item.tx_telefono }}</td>
						<td class="text-xs-left">{{ item.tx_telefono2 }}</td>
						<td class="text-xs-left">{{ item.tx_telefono3 }}</td>
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
                <pariente-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></pariente-form>

            </app-modal>

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
import parienteForm  from './parienteForm';
export default {
    mixins:     [ listHelper],
    components: { 'pariente-form': parienteForm },
    data () {
    return {
        title:    'Pariente',
        resource: 'pariente',
        headers: [
            { text: 'Nombre',   value: 'nb_nombre' },
			{ text: 'Apellido',   value: 'nb_apellido' },
			{ text: 'Documento',   value: 'tx_documento' },
			{ text: 'Alumno',   value: 'id_alumno' },
			{ text: 'Parentesco',   value: 'id_parentesco' },
			{ text: 'Empresa',   value: 'tx_empresa' },
			{ text: 'Cargo',   value: 'tx_cargo' },
			{ text: 'Ocupacion',   value: 'tx_ocupacion' },
			{ text: 'Telefono',   value: 'tx_telefono' },
			{ text: 'Telefono2',   value: 'tx_telefono2' },
			{ text: 'Telefono3',   value: 'tx_telefono3' },
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