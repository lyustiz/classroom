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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_apellido }}</td>
						<td class="text-xs-left">{{ item.nb_apellido2 }}</td>
						<td class="text-xs-left">{{ item.nb_nombre }}</td>
						<td class="text-xs-left">{{ item.nb_nombre2 }}</td>
						<td class="text-xs-left">{{ item.id_estado_civil }}</td>
						<td class="text-xs-left">{{ item.tx_sexo }}</td>
						<td class="text-xs-left">{{ item.fe_nacimiento }}</td>
						<td class="text-xs-left">{{ item.id_tipo_documento }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">{{ item.tx_lugar_nacimiento }}</td>
						<td class="text-xs-left">{{ item.tx_direccion }}</td>
						<td class="text-xs-left">{{ item.id_departamento }}</td>
						<td class="text-xs-left">{{ item.id_ciudad }}</td>
						<td class="text-xs-left">{{ item.tx_email }}</td>
						<td class="text-xs-left">{{ item.tx_telefono }}</td>
						<td class="text-xs-left">{{ item.tx_telefono_movil }}</td>
						<td class="text-xs-left">{{ item.id_cargo }}</td>
						<td class="text-xs-left">{{ item.bo_profesor }}</td>
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

            <app-message></app-message>

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
            { text: 'Apellido',   value: 'nb_apellido' },
			{ text: 'Apellido2',   value: 'nb_apellido2' },
			{ text: 'Nombre',   value: 'nb_nombre' },
			{ text: 'Nombre2',   value: 'nb_nombre2' },
			{ text: 'Estado Civil',   value: 'id_estado_civil' },
			{ text: 'Sexo',   value: 'tx_sexo' },
			{ text: 'Nacimiento',   value: 'fe_nacimiento' },
			{ text: 'Tipo Documento',   value: 'id_tipo_documento' },
			{ text: 'Documento',   value: 'tx_documento' },
			{ text: 'Lugar Nacimiento',   value: 'tx_lugar_nacimiento' },
			{ text: 'Direccion',   value: 'tx_direccion' },
			{ text: 'Departamento',   value: 'id_departamento' },
			{ text: 'Ciudad',   value: 'id_ciudad' },
			{ text: 'Email',   value: 'tx_email' },
			{ text: 'Telefono',   value: 'tx_telefono' },
			{ text: 'Telefono Movil',   value: 'tx_telefono_movil' },
			{ text: 'Cargo',   value: 'id_cargo' },
			{ text: 'Profesor',   value: 'bo_profesor' },
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