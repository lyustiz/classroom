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
                        <td class="text-xs-left">{{ item.nb_empleado }}</td>
						<td class="text-xs-left">{{ item.tx_sexo }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">{{ item.cargo.nb_cargo }}</td>
						<td class="text-xs-left"> 
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                   <v-icon v-on="on" 
                                        :color="personColor(item.bo_profesor)" 
                                        v-text="personIcon(item.bo_profesor)">
                                    </v-icon>
                                </template>
                                <span v-text="personLabel(item.bo_profesor)"></span>
                            </v-tooltip>
                            
                             </td>
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
            { text: 'Apellidos y Nombres',   value: 'nb_empleado' },
			{ text: 'Sexo',   value: 'tx_sexo' },
			{ text: 'Documento',   value: 'tx_documento' },
			{ text: 'Cargo',   value: 'cargo.nb_cargo' },
			{ text: 'Tipo',   value: 'bo_profesor' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
    }
    },
    methods:
    {
        personIcon(isProfesor)
        {
            return (isProfesor == 1) ? 'mdi-account-tie' : 'mdi-badge-account' 
        },
        personColor(isProfesor)
        {
            return (isProfesor == 1) ? 'green' : 'cyan' 
        },
        personLabel(isProfesor)
        {
            return (isProfesor == 1) ? 'profesor' : 'empleado' 
        }
    }
}
</script>

<style>
</style>