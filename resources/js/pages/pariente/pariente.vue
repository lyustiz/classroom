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
                        <td class="text-xs-left">{{ item.nb_pariente }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">{{ item.tx_sexo }}</td>
						<td class="text-xs-left">
                            <v-tooltip bottom :key="alumno.id" v-for="alumno in item.alumno">
                                <template v-slot:activator="{ on }">
                                    <v-btn icon dark x-small v-on="on" class="elevation-5">
                                        <v-icon size="28" color="success" >mdi-face</v-icon>
                                    </v-btn>
                                </template>
                                <span v-text="alumno.nb_alumno"></span>
                            </v-tooltip>
                        </td>
						<td class="text-xs-left">{{ item.parentesco.nb_parentesco }}</td>
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
            { text: 'Pariente',   value: 'nb_pariente' },
			{ text: 'Documento',  value: 'tx_documento' },
			{ text: 'Nacimiento', value: 'fe_nacimiento' },
			{ text: 'Alumno',     value: 'id_alumno' },
			{ text: 'Parentesco', value: 'parentesco.nb_parentesco' },
			{ text: 'Status',     value: 'id_status' },
            { text: 'Acciones',   value: 'actions', sortable: false, filterable: false },
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